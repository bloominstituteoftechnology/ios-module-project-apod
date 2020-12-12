//
//  PhotoCell.swift
//  NasaPOD
//
//  Created by Cora Jacobson on 12/11/20.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    var dateLabel = UILabel()
    var imageView = UIImageView()
    
    static let reuseIdentifier = "photoCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dateLabel.text = ""
        imageView.image = UIImage(named: "planet")
    }
    
    func setUpView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textColor = UIColor.white
        dateLabel.backgroundColor = UIColor.blue
        dateLabel.font = UIFont.boldSystemFont(ofSize: 14)
        contentView.addSubview(dateLabel)
        dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    }
    
}
