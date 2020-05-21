//
//  PhotoDetailViewController.swift
//  APOD
//
//  Created by Wyatt Harrell on 5/21/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var infoButton: UIButton!
    
    // MARK: - Properties
    var photo: WHLPhoto? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private Methods
    private func updateViews() {
        guard let photo = photo else { return }
        
        /*
        
         Download Image
         
        */
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowImageInfoSegue" {
            guard let photoInfoVC = segue.destination as? PhotoDetailViewController else { return }
            guard let photo = photo else { return }
            photoInfoVC.photo = photo
        }
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
    }
    
}
