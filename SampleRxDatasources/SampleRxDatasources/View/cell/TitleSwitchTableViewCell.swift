//
//  TitleSwitchTableViewCell.swift
//  SampleRxDatasources
//
//  Created by jikichi on 2020/12/18.
//

import UIKit

class TitleSwitchTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let toggleSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        return toggleSwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, isEnabled: Bool) {
        titleLabel.text = title
        toggleSwitch.isEnabled = isEnabled
        
    }
    
}

extension TitleSwitchTableViewCell {
    fileprivate func setupLayout() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(toggleSwitch)
        toggleSwitch.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        toggleSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        toggleSwitch.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
}
