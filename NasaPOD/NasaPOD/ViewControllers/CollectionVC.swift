//
//  CollectionVC.swift
//  NasaPOD
//
//  Created by Cora Jacobson on 12/11/20.
//

import UIKit

class CollectionVC: UIViewController {
        
    var photos: [PhotoOfTheDay] = []
    var images: [UIImage] = []
    
    lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        fetchPhotos()
    }
    
//
//    // MARK: - Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetailSegue" {
//            let detailVC = segue.destination as! DetailVC
//            let indexPath = collectionView.indexPathsForSelectedItems?.first
//            let photo = photos[indexPath?.item ?? 0]
//            let image = images[indexPath?.item ?? 0]
//            detailVC.photo = photo
//            detailVC.image = image
//        }
//    }
    
    private func setUpCollectionView() {
        let view = UIView()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 160, height: 160)
                
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: "photoCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView ?? UICollectionView())
        self.view = view
    }
    
    private func fetchPhotos() {
        let dayOne = Date()
        let dayTwo = Date(timeInterval: -(60*60*24), since: dayOne)
        let dayThree = Date(timeInterval: -(60*60*24), since: dayTwo)
        let dayFour = Date(timeInterval: -(60*60*24), since: dayThree)
        let dayFive = Date(timeInterval: -(60*60*24), since: dayFour)
        let daySix = Date(timeInterval: -(60*60*24), since: dayFive)
        let daySeven = Date(timeInterval: -(60*60*24), since: daySix)
        
        let days = [dayOne, dayTwo, dayThree, dayFour, dayFive, daySix, daySeven]

        for day in days {
            APIController.shared.getPhotoForDay(with: day) { photo, error in
                if let error = error {
                    NSLog("Error fetching photo: \(error)")
                    return
                }
                if let photo = photo {
                    DispatchQueue.main.async {
                        self.photos.append(photo)
                        APIController.shared.fetchImage(url: photo.url) { image, error in
                            if let error = error {
                                NSLog("Error fetching image: \(error)")
                                return
                            }
                            guard let image = image else { return }
                            DispatchQueue.main.async {
                                self.images.append(image)
                                self.collectionView.reloadData()
                                self.title = "\(self.photos.count) and \(self.images.count)"
                            }
                        }
                    }
                }
            }
        }
    }

}

extension CollectionVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.backgroundColor = .blue
        if images.count == 7 && photos.count == 7 {
            let photo = photos[indexPath.row]
            cell.imageView.image = images[indexPath.row]
            var dateString = formatter.string(from: photo.date)
            if dateString == formatter.string(from: Date()) {
                dateString = "Today"
            }
            cell.dateLabel.text = dateString
        } else {
            cell.imageView.image = UIImage(named: "planet")
            cell.dateLabel.text = ""
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        let indexPath = collectionView.indexPathsForSelectedItems?.first
        let photo = photos[indexPath?.item ?? 0]
        let image = images[indexPath?.item ?? 0]
        detailVC.photo = photo
        detailVC.image = image
        
        self.present(detailVC, animated:true, completion:nil)
    }
    
}
