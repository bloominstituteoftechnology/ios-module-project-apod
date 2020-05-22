//
//  PhotoDescriptionTrayViewController.swift
//  APOD
//
//  Created by Shawn Gee on 5/21/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class PhotoDescriptionTrayViewController: UIViewController {
    
    var photo: Photo? { didSet { updateViews() }}
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionTextView: UITextView!
    
    private func updateViews() {
        guard let photo = photo else { return }
        titleLabel.text = photo.title
        descriptionTextView.text = photo.explanation
    }
}
