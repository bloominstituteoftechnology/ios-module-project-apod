//
//  PhotoCollectionViewController.swift
//  APOD
//
//  Created by Shawn Gee on 5/22/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit


class PhotoCollectionViewController: UICollectionViewController {
    
    private var photos: [Photo] = []
    private let apodClient = APODClient()
    
    @IBOutlet private var previousButton: UIBarButtonItem!
    @IBOutlet private var nextButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = "September"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Colors.darkBlue,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold),
        ]
        
        previousButton.image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration.init(pointSize: 32, weight: .medium))
        previousButton.imageInsets = .init(top: 0, left: 50, bottom: 0, right: 0)
        
        nextButton.image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration.init(pointSize: 32, weight: .medium))
        nextButton.imageInsets = .init(top: 0, left: 0, bottom: 0, right: 50)
        
        
        apodClient.fetchPhoto(from: Date()) { (result) in
            switch result {
            case .failure(let error):
                print("⚠️ Error fetching photo: \(error)")
            case .success(let photo):
                DispatchQueue.main.async {
                    self.photos.append(photo)
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("Failed to cast cell as \(PhotoCollectionViewCell.self)")
        }
        
        cell.dayLabel.text = "\(indexPath.item + 1)"
        cell.photo = photos[indexPath.item]
        
        return cell
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        
        return CGSize(width: width, height: width)
    }
}
