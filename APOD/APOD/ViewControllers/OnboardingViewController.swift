//
//  OnboardingViewController.swift
//  APOD
//
//  Created by Shawn Gee on 5/22/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(
            withDuration: 0.25,
            animations: {
                self.navigationController?.navigationBar.layer.opacity = 0
            },
            completion: { _ in
                self.navigationController?.navigationBar.isHidden = true;
            }
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.layer.opacity = 0
        self.navigationController?.navigationBar.isHidden = false;
        UIView.animate(withDuration: 0.25) {
            self.navigationController?.navigationBar.layer.opacity = 1
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
