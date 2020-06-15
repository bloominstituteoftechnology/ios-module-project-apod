//
//  APODDetailViewController.swift
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

import UIKit

class APODDetailViewController: UIViewController {
    
    // Properties
    var pictureReference: APODPicture?
    var image: UIImage?

    // IBOutlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    

    // IBActions
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        
    }
    
    // Private Methods
    
    private func updateViews() {
        if let pictureReference = pictureReference {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateLabel.text = dateFormatter.string(from: pictureReference.date)
            
            titleLabel.text = pictureReference.title
            bodyLabel.text = pictureReference.explanation
        }
        
        if let image = image {
            imageView.image = image
        }
    }
}
