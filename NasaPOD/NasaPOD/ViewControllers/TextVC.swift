//
//  TextVC.swift
//  NasaPOD
//
//  Created by Cora Jacobson on 12/11/20.
//

import UIKit

class TextVC: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var explanationTextView: UITextView!
    
    var titleString: String?
    var explanation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleString
        explanationTextView.text = explanation
    }

}
