//
//  ViewController.swift
//  AppTutorialDemo
//
//  Created by 後藤孝輔 on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let leftButton = Button(frame: view.frame, title: "左")
        let centerButton = Button(frame: view.frame, title: "真ん中")
        let rightButton = Button(frame: view.frame, title: "右")
        let tutorialButton = Button(frame: view.frame, title: "使い方")
        
        let buttons = UIStackView(arrangedSubviews: [leftButton, centerButton, rightButton])
        buttons.axis = .horizontal
        buttons.alignment = .fill
        buttons.distribution = .fillEqually
        buttons.spacing = 30
        buttons.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttons)
        view.addSubview(tutorialButton)
        
        [
            buttons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttons.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tutorialButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tutorialButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
        ].forEach { $0.isActive = true }
    }

}

class Button: UIButton {
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        setTitle(title, for: .normal)
        titleLabel?.textColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

