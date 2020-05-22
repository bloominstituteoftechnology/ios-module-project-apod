//
//  ViewController.swift
//  APOD
//
//  Created by Shawn Gee on 5/21/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: - Public Properties
    var photo: Photo?
    
    // MARK: - Private Properties
    
    private var trayVC: PhotoDescriptionTrayViewController!
    private let trayClosedOffset: CGFloat = 68
    private var trayOpenOffset: CGFloat {
        trayVC.view.frame.height - 50
    }
    
    @IBOutlet private var trayConstraint: NSLayoutConstraint!
    @IBOutlet var imageView: UIImageView!
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try? updateViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func updateViews() throws {
        guard let photo = photo, let url = photo.hdURL else { return }
        trayVC.photo = photo
        imageView.image = UIImage(data: try Data(contentsOf: url))
    }
    
    // MARK: - Embed
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let trayVC = segue.destination as? PhotoDescriptionTrayViewController {
            self.trayVC = trayVC
            
            let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(pan)
        }
    }
    
    private var shouldMoveTray = false // Used to determine if the pan in the function below should move the tray
    
    @objc func handlePan(_ pan: UIPanGestureRecognizer) {
        
        switch pan.state {
        case .began, .changed:
            var location = pan.location(in: trayVC.view)
            
            // Adjustment so that tray is easier to grab when closed
            if trayConstraint.constant == trayClosedOffset { location.y += 10 }
            
            // Check to see if we should be moving the tray
            if trayVC.view.bounds.contains(location) { shouldMoveTray = true }
            
            if shouldMoveTray {
                let translation = pan.translation(in: view)
                trayConstraint.constant = (trayConstraint.constant - translation.y)
                    .clamped(trayClosedOffset, trayOpenOffset)
            }
        case .ended:
            shouldMoveTray = false
            
            var trayIsClosing = pan.velocity(in: view).y > 0
            let allowance: CGFloat = 40 // How much to allow tray to move before opening or closing
            if trayConstraint.constant > trayOpenOffset - allowance { trayIsClosing = false }
            if trayConstraint.constant < trayClosedOffset + allowance { trayIsClosing = true }
            trayConstraint.constant = trayIsClosing ? trayClosedOffset : trayOpenOffset
            
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                usingSpringWithDamping: 0.65,
                initialSpringVelocity: 0.4,
                options: .curveEaseInOut,
                animations: {
                    self.view.layoutIfNeeded()
                },
                completion: nil
            )
        default:
            break
        }
        
        pan.setTranslation(.zero, in: view)
    }
}

extension Comparable {
    func clamped(_ minimum: Self, _ maximum: Self) -> Self {
        min(max(self, minimum), maximum)
    }
}
