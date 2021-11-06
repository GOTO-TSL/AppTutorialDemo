//
//  ViewController.swift
//  AppTutorialDemo
//
//  Created by 後藤孝輔 on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    private var views = [UIView]()
    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDemoData()
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .red
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        for i in 0..<views.count {
            let view = views[i]
            view.frame = CGRect(x: CGFloat(i) * self.view.frame.size.width, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            scrollView.addSubview(view)
        }
        
        pageControl = UIPageControl(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: 50)))
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(self.pageUpdated), for: .valueChanged)
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        view.addSubview(pageControl)
        view.bringSubviewToFront(pageControl)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // ScrollView
        scrollView.frame = self.view.frame
        let totalWidth = CGFloat(views.count) * self.view.frame.size.width
        scrollView.contentSize = CGSize(width: totalWidth, height: self.view.bounds.height)
        // UIPageControl
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        let leading = pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let bottom = pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        view.addConstraints([leading, trailing, bottom])
    }
    
    @objc func pageUpdated() {
        print("update")
    }
    
    func loadDemoData() {
        for i in 0..<3 {
            // UIKit
            let view = UIView()
            view.backgroundColor = .purple
            let title = UILabel()
            title.text = "チュートリアル\(i)"
            title.textColor = .white
            title.textAlignment = .center
            title.font = .preferredFont(forTextStyle: .largeTitle)
            title.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(title)
            let centerX = title.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let top = title.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
            view.addConstraints([centerX, top])
            views.append(view)
        }
    }

}
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
