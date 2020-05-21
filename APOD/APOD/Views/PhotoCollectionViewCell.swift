//
//  PhotoCollectionViewCell.swift
//  APOD
//
//  Created by Wyatt Harrell on 5/21/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    
    var photo: WHLPhoto? {
        didSet {
            setupViews()
        }
    }
    
    private func setupViews() {
        
    }
    
}
