//
//  TitleStepperTableViewCell.swift
//  SampleRxDatasources
//
//  Created by jikichi on 2020/12/18.
//

import UIKit

class TitleStepperTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }

}

extension TitleStepperTableViewCell {
    fileprivate func setupLayout() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        addSubview(stepper)
        stepper.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        stepper.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        stepper.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stepper.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
    }
}
