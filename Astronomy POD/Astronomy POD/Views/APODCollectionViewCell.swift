//
//  APODCollectionViewCell.swift
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

import UIKit

class APODCollectionViewCell: UICollectionViewCell {
    
    // IBOutlets
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    // Methods
    override func prepareForReuse() {
        imageView.image = UIImage(named: "planet")
    }
    
}
