//
//  PhotoCollectionViewCell.swift
//  APOD
//
//  Created by Chris Dobek on 6/18/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    
    var photoController: PhotoController?
    var photo: CMDPhoto? {
        didSet {
            setupViews()
        }
    }
    
    private func setupViews() {
        guard let photo = photo else { return }
        
        dateLabel.text = photoController?.df.string(from: photo.date)
        
    }
    
    
    override func prepareForReuse() {
        imageView.image = nil
    }
}
