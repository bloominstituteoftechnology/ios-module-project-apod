//
//  PhotosViewController.swift
//  APOD
//
//  Created by Wyatt Harrell on 5/21/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - Properties
    var currentMonth: [Date] = []
    let photoController = PhotoController()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstLaunch = UserDefaults.standard.bool(forKey: "firstLaunch")
        if !firstLaunch {
            performSegue(withIdentifier: "PresentOnboardingModalSeuge", sender: self)
            UserDefaults.standard.set(true, forKey: "firstLaunch")
        }
        
        
        currentMonth = photoController.getDays(for: 1, in: 2020)
        
//        for item in days {
//
//            photoController.fetchPhotoForDate(date: item) { (error) in
//                if let error = error {
//                    NSLog("Error fetching photos \(error)")
//                    return
//                }
//
//                DispatchQueue.main.async {
//
//                    print(self.photoController.sortedPhotos.count)
//                    print(days.count)
//
//                    if self.photoController.sortedPhotos.count == days.count {
//                        print("Reloading Collection View")
//                        self.collectionView.reloadData()
//                    }
//                }
//
//            }
//        }
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowImageDetailSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            guard let selected = collectionView.indexPathsForSelectedItems else { return }
            photoDetailVC.photo = photoController.sortedPhotos[selected[0].row]
            photoDetailVC.photoController = photoController
        }
    }
    
    private func loadImage(for cell: PhotoCollectionViewCell, with photo: WHLPhoto) {
        photoController.fetchPhotoData(url: photo.hdurl) { (data, error) in
            if let error = error {
                NSLog("Error fetching photos \(error)")
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    cell.imageView.image = UIImage(data: data)
                }
            }
        }
    }
    
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentMonth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }

        photoController.fetchPhotoForDate(date: currentMonth[indexPath.row]) { (error) in
            if let error = error {
                NSLog("Error fetching photo for date: \(self.currentMonth[indexPath.row]) error: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                guard let photo = self.photoController.sortedPhotos.filter ({ $0.date == self.currentMonth[indexPath.row] }).first else { fatalError() }
                cell.photo = photo
                cell.photoController = self.photoController
                self.loadImage(for: cell, with: photo)
            }
            
        }
        
        
        return cell
    }
}
