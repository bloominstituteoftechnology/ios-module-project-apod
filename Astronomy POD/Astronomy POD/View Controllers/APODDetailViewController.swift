//
//  APODDetailViewController.swift
//  Astronomy POD
//
//  Created by David Wright on 6/14/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

import UIKit

class APODDetailViewController: UIViewController {

    // IBOutlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // IBActions
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        
    }
}
