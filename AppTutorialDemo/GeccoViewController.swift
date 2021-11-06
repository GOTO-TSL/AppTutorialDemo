//
//  ViewController.swift
//  AppTutorialDemo
//
//  Created by 後藤孝輔 on 2021/11/03.
//

import UIKit
import Gecco

class GeccoViewController: UIViewController {
    
    var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = MainView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        
        [
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ].forEach { $0.isActive = true }
        
        mainView.tutorialButton.addTarget(self, action: #selector(tutorialPressed(_:)), for: .touchUpInside)

    }
    
    @objc func tutorialPressed(_ sender: UIButton) {
        showSpotlight()
    }
    
    func showSpotlight() {
        var positions: [CGPoint] = []
        mainView.subviews.forEach { view in
            if view is UIStackView {
                let parentY = view.center.y
                view.subviews.forEach { subview in
                    let childX = subview.center.x
                    let childY = parentY
                    positions.append(CGPoint(x: childX, y: childY))
                }
            } else {
                positions.append(view.center)
            }
        }
        let spotlightViewController = AnnotationViewController(positions: positions)
        present(spotlightViewController, animated: true, completion: nil)
    }
    
}
