//
//  ImageTitleTableViewCell.swift
//  SampleRxDatasources
//
//  Created by jikichi on 2020/12/18.
//

import UIKit

class ImageTitleTableViewCell: UITableViewCell {
    
    let imageTitle: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage, title: String) {
        imageTitle.image = image
        titleLabel.text = title
    }

}

extension ImageTitleTableViewCell {
    fileprivate func setupLayout() {
        addSubview(imageTitle)
        imageTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        imageTitle.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 3 / 2).isActive = true
//        imageTitle.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imageTitle.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
}
