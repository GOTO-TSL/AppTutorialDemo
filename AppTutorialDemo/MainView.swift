//
//  MainView.swift
//  AppTutorialDemo
//
//  Created by 後藤孝輔 on 2021/11/03.
//

import UIKit

class MainView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "タイトル"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tutorialButton: UIButton = {
        let button = UIButton()
        button.setTitle("使い方", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("ひだり", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let centerButton: UIButton = {
        let button = UIButton()
        button.setTitle("まんなか", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("みぎ", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let buttons = UIStackView(arrangedSubviews: [leftButton, centerButton, rightButton])
        buttons.axis = .horizontal
        buttons.alignment = .fill
        buttons.distribution = .fillEqually
        buttons.spacing = 30
        buttons.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(tutorialButton)
        addSubview(buttons)
        
        [
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            tutorialButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            tutorialButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            buttons.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttons.leftAnchor.constraint(equalTo: leftAnchor),
            buttons.rightAnchor.constraint(equalTo: rightAnchor),
            buttons.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
        ].forEach { $0.isActive = true }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
