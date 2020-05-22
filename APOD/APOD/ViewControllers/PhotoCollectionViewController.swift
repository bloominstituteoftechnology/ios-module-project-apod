//
//  PhotoCollectionViewController.swift
//  APOD
//
//  Created by Shawn Gee on 5/22/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit


class PhotoCollectionViewController: UICollectionViewController {
    @IBOutlet var previousButton: UIBarButtonItem!
    @IBOutlet var nextButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = "September"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Colors.darkBlue,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold),
            NSAttributedString.Key.baselineOffset: -4,
        ]
        
        previousButton.image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration.init(pointSize: 32, weight: .medium))
        previousButton.imageInsets = .init(top: 0, left: 40, bottom: 0, right: 0)
        
        nextButton.image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration.init(pointSize: 32, weight: .medium))
        nextButton.imageInsets = .init(top: 0, left: 0, bottom: 0, right: 40)
 
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    private let darkCells = [1, 2, 5, 6, 9, 10, 13, 14]
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("Failed to cast cell as \(PhotoCollectionViewCell.self)")
        }
        
        cell.backgroundColor = darkCells.contains(indexPath.item) ? Colors.mediumGray : Colors.lightGray
        cell.dayLabel.text = "\(indexPath.item + 1)"
        return cell
    }
    
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        
        return CGSize(width: width, height: width)
    }
}
