//
//  APODCollectionViewController.swift
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

import UIKit

private let reuseIdentifier = "APODCell"

class APODCollectionViewController: UIViewController {

    // MARK: - Properties
    
    private let client = APODClient()
    private let fetchPictureQueue = OperationQueue()
    private var operations = [String: Operation]()
    private let cache = APODCache<UIImage>()
    private let minimumCellSpacing: CGFloat = 0.0
    
    private var currentDate: Date {
        Date()
    }
    
    private var displayDate = Date() {
        didSet {
            if currentDate != oldValue {
                cache.clear()
                
                var date = displayDate.startOfMonth
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                
                for _ in 1...displayDate.numberOfDaysInMonth {
                    
                    let dateString = dateFormatter.string(from: date)
                    
                    client.fetchPOD(withDateString: dateString) { (pictureReference, error) in
                        if let error = error { NSLog("Error fetching picture for date: \(dateString): \(error)"); return }
                        
                        guard let pictureReference = pictureReference else { return }
                        
                        self.pictureReferences.append(pictureReference)
                    }
                    
                    guard let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: date),
                    nextDate <= currentDate else { return }
                    
                    date = nextDate
                }
                
                updateTitleView()
                collectionView?.reloadData()
            }
        }
    }
    
    private var pictureReferences = [APODPicture]() {
        didSet {
            pictureReferences.sort { $0.date < $1.date }
            collectionView?.reloadData()
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var monthLabel: UILabel!
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTitleView()
        displayDate = currentDate

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(refresh), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    @objc func refresh() {
        collectionView.reloadData()
        collectionView.refreshControl?.endRefreshing()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first,
                let detailVC = segue.destination as? APODDetailViewController else { return }
            
            detailVC.pictureReference = pictureReferences[indexPath.item]
            
            guard let cell = collectionView.cellForItem(at: indexPath) as? APODCollectionViewCell,
                let image = cell.imageView.image else { return }
            detailVC.image = image
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func nextMonthButtonTapped(_ sender: UIButton) {
        guard let nextDisplayDate = Calendar.current.date(byAdding: .month, value: 1, to: displayDate) else { return }
        displayDate = nextDisplayDate
    }
    
    @IBAction func previousMonthButtonTapped(_ sender: UIButton) {
        guard let nextDisplayDate = Calendar.current.date(byAdding: .month, value: -1, to: displayDate) else { return }
        displayDate = nextDisplayDate
    }
    
    // MARK: - Private Methods
    
    private func updateTitleView() {
        guard isViewLoaded else { return }
        monthLabel.text = currentDate.monthName
    }
    
    private func loadImage(forCell cell: APODCollectionViewCell, forItemAt indexPath: IndexPath) {
        let pictureReference = pictureReferences[indexPath.item]
        let dateString = string(from: pictureReference.date)
        
        if let image = cache.value(forKey: dateString) {
            cell.imageView.image = image;
            return
        }
        
        guard let url = URL(string: pictureReference.urlString) else { return }
        
        let fetchOp = APODFetchPictureOperation(pictureURL: url)
        
        let cacheOp = BlockOperation {
            if let image = fetchOp.image {
                self.cache.cacheValue(image, forKey: dateString)
            }
        }
        
        let completionOp = BlockOperation {
            defer { self.operations.removeValue(forKey: dateString) }
            
            if let currentIndexPath = self.collectionView.indexPath(for: cell),
                currentIndexPath != indexPath {
                return // Cell has been reused
            }
            
            if let image = fetchOp.image {
                cell.imageView.image = image
            }
        }
        
        cacheOp.addDependency(fetchOp)
        completionOp.addDependency(fetchOp)
        
        fetchPictureQueue.addOperation(fetchOp)
        fetchPictureQueue.addOperation(cacheOp)
        OperationQueue.main.addOperation(completionOp)
        
        operations[dateString] = fetchOp
    }
    
    private func string(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}

// MARK: - UICollectionViewDataSource

extension APODCollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureReferences.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! APODCollectionViewCell
        
        let pictureDate = pictureReferences[indexPath.item].date
        let calendar = Calendar.current
        let dayComponent = calendar.dateComponents([.day], from: pictureDate)
        let day = dayComponent.day!
        let dayString = String(format: "%02d", day)
        
        cell.dateLabel.text = dayString
        
        loadImage(forCell: cell, forItemAt: indexPath)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item #: \(indexPath.item)")
        self.performSegue(withIdentifier: "ShowDetail", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if pictureReferences.count > 0 {
            let pictureRef = pictureReferences[indexPath.item]
            let dateString = string(from: pictureRef.date)
            operations[dateString]?.cancel()
        } else {
            for (_, operation) in operations {
                operation.cancel()
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension APODCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var totalUsableWidth = collectionView.frame.width
        let inset = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        totalUsableWidth -= inset.left + inset.right
        
        let minWidth: CGFloat = 150.0
        let numberOfItemsInOneRow = Int(totalUsableWidth / minWidth)
        totalUsableWidth -= CGFloat(numberOfItemsInOneRow - 1) * minimumCellSpacing
        let width = totalUsableWidth / CGFloat(numberOfItemsInOneRow)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: minimumCellSpacing, bottom: 0, right: minimumCellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        minimumCellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        minimumCellSpacing
    }
}


extension Date {
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)

        return  calendar.date(from: components)!
    }
    
    var dayOfMonth: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)

        return  components.day!
    }
    
    var numberOfDaysInMonth: Int {
        let calendar = Calendar.current
        let interval = calendar.dateInterval(of: .month, for: self)!
        
        return calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
    }
    
    var monthName: String {
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "LLLL"
        let monthName = monthFormatter.string(from: self)
        
        return monthName
    }
}
