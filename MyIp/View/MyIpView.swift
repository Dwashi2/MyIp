//
//  MyIpView.swift
//  MyIp
//
//  Created by Daniel Washington Ignacio on 19/04/24.
//

import UIKit


class MyIpView: UIView {
    
    var ipTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MyIp"
        label.font = UIFont(name: "Menlo Regular", size: 56)
        label.textColor = .white
        return label
    }()
    
    var ipTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Menlo Regular", size: 30)
        return label
    }()
    
    var countryTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Menlo Regular", size: 30)
        return label
    }()
    
    var ccTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Menlo Regular", size: 30)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(ipTitleLabel)
        self.addSubview(ipTextLabel)
        self.addSubview(countryTextLabel)
    }
    
    private func setupConstraints(){

        NSLayoutConstraint.activate([
            ipTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ipTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            ipTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ipTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50)
        ])

        NSLayoutConstraint.activate([
            countryTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            countryTextLabel.topAnchor.constraint(equalTo: ipTextLabel.bottomAnchor, constant: 10)
        ])
        
    }
    
}
