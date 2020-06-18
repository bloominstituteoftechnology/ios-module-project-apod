//
//  OnboardingViewController.swift
//  APOD
//
//  Created by Chris Dobek on 6/18/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var dismissButton: UIButton!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.layer.cornerRadius = 20
    }
    
    // MARK: - IBActions
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
