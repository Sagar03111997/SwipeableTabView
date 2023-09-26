//
//  CustomScrollableTabsViewController.swift
//  CustomScrollableTabs
//
//  Created by Sagar Sahu on 5/24/23.
//

import UIKit

class CustomScrollableTabsViewController: UIViewController, UIScrollViewDelegate  {
    
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    let scrollView = UIScrollView()
    let indicatorView = UIView()
    let controller1 = UIViewController()
    let controller2 = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIndicatorView()
        setupScrollView()
        addControllers()
        setupTabs()
    }
    
    func setupTabs() {
        let tabButton1 = UIButton(type: .system)
        tabButton1.setTitle("Tab 1", for: .normal)
        tabButton1.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(tabButton1)
        
        let tabButton2 = UIButton(type: .system)
        tabButton2.setTitle("Tab 2", for: .normal)
        tabButton2.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(tabButton2)
    }
    
    @objc func tabButtonTapped(_ sender: UIButton) {
        guard let index = stackView.arrangedSubviews.firstIndex(of: sender) else { return }
        
        let xOffset = CGFloat(index) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
        
        let indicatorX = CGFloat(index) * (view.frame.width / 2)
        UIView.animate(withDuration: 0.3) {
            self.indicatorView.frame.origin.x = indicatorX
        }
    }
    
    func setupIndicatorView() {
        view.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        //indicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        indicatorView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.5).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        indicatorView.backgroundColor = UIColor.red // Customize as needed
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: indicatorView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = CGSize(width: scrollView.frame.width * 2, height: scrollView.frame.height)
        controller1.view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        controller2.view.frame = CGRect(x: scrollView.frame.width, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
    }
    
    func addControllers() {
        controller1.view.backgroundColor = UIColor.blue // Customize as needed
        
        controller2.view.backgroundColor = UIColor.green // Customize as needed
        
        addChild(controller1)
        scrollView.addSubview(controller1.view)
        controller1.didMove(toParent: self)
        
        addChild(controller2)
        scrollView.addSubview(controller2.view)
        controller2.didMove(toParent: self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        let buttonWidth = scrollView.frame.width / 2
        let indicatorX = contentOffsetX / 2
        indicatorView.frame.origin.x = indicatorX
        print("origin = \(indicatorX)")
    }
    
}
