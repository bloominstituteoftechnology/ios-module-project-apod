//
//  PhotoInfoViewController.swift
//  APOD
//
//  Created by Chris Dobek on 6/18/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var infoTextView: UITextView!
    
    // MARK: - Properties
    var photo: CMDPhoto? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Private Methods
    private func updateViews() {
        guard let photo = photo else { return }
        if isViewLoaded {
            titleLabel.text = photo.title
            infoTextView.text = photo.explanation
        }
        
        
        
        
    }
    
}

