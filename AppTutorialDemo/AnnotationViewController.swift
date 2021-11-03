//
//  AnnotationViewController.swift
//  AppTutorialDemo
//
//  Created by 後藤孝輔 on 2021/11/03.
//

import UIKit
import Gecco

class AnnotationViewController: SpotlightViewController {
    
    var annotationViews: [UIView] = []
    var stepIndex: Int = 0
    var positions: [CGPoint]
    let messages = ["タイトルです", "チュートリアルです", "左のボタンです", "真ん中のボタンです", "右のボタンです"]
    
    init(positions: [CGPoint]) {
        self.positions = positions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for messageText in messages {
            addMessage(messageText: messageText)
        }
        delegate = self
    }
    
    func addMessage(messageText: String) {
        let message = UILabel()
        message.text = messageText
        message.textColor = .white
        message.font = UIFont.boldSystemFont(ofSize: 30)
        message.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(message)
        message.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        message.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        annotationViews.append(message)
    }
    
    func next(_ labelAnimated: Bool) {
        updateAnnotationView(labelAnimated)
        
        switch stepIndex {
        case 0:
            spotlightView.appear(Spotlight.RoundedRect(center: positions[stepIndex], size: CGSize(width: 200, height: 100), cornerRadius: 10))
        case 1:
            spotlightView.move(Spotlight.Oval(center: positions[stepIndex], diameter: 100))
        case 2:
            spotlightView.move(Spotlight.Oval(center: positions[stepIndex], diameter: 100))
        case 3:
            spotlightView.move(Spotlight.Oval(center: positions[stepIndex], diameter: 100))
        case 4:
            spotlightView.move(Spotlight.Oval(center: positions[stepIndex], diameter: 100))
        case 5:
            dismiss(animated: true, completion: nil)
        default:
            break
        }
        
        stepIndex += 1
    }
    
    func updateAnnotationView(_ animated: Bool) {
        annotationViews.enumerated().forEach { index, view in
            UIView.animate(withDuration: animated ? 0.25 : 0) {
                view.alpha = index == self.stepIndex ? 1 : 0
            }
        }
    }
}

extension AnnotationViewController: SpotlightViewControllerDelegate {
    func spotlightViewControllerWillPresent(_ viewController: SpotlightViewController, animated: Bool) {
        next(false)
    }
    
    func spotlightViewControllerWillDismiss(_ viewController: SpotlightViewController, animated: Bool) {
        spotlightView.disappear()
    }
    
    func spotlightViewControllerTapped(_ viewController: SpotlightViewController, tappedSpotlight: SpotlightType?) {
        next(true)
    }
    
}
