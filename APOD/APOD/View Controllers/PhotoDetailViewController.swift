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
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
    }
    

}
