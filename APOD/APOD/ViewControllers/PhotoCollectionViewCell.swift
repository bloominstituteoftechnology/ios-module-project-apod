//
//  PhotoCollectionViewCell.swift
//  APOD
//
//  Created by Shawn Gee on 5/22/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? { didSet { try? updateViews() }}
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dayLabel: UILabel!
    
    private func updateViews() throws {
        guard let photo = photo, let url = photo.url else { return }
        imageView.image = UIImage(data: try Data(contentsOf: url))
    }
}
