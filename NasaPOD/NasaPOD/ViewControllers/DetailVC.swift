//
//  DetailVC.swift
//  NasaPOD
//
//  Created by Cora Jacobson on 12/11/20.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleButton: UIButton!
    
    var photo: PhotoOfTheDay!
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTextSegue" {
            let textVC = segue.destination as! TextVC
            textVC.titleString = photo.title
            textVC.explanation = photo.explanation
        }
    }
    
    private func updateViews() {
        imageView.image = image
        titleButton.titleLabel?.text = photo.title
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: photo.date)
        title = dateString
    }

}
