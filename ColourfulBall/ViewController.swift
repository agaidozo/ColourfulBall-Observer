//
//  ViewController.swift
//  ColourfulBall
//
//  Created by Obde Willy on 27/02/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    var circleView: UIView!
    fileprivate var circleViewModel: CircleViewModel!
    fileprivate let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        // Add circle view
        circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100.0, height: 100.0)))
        circleView.layer.cornerRadius = circleView.frame.width / 2.0
        circleView.center = view.center
        circleView.backgroundColor = .green
        view.addSubview(circleView)
        
        self.circleViewModel = CircleViewModel()
        
        // Bind the center point of the CircleView to the centerObservable
        circleView
            .rx.observe(CGPoint.self, "center")
            .bind(to: circleViewModel.centerBehaviorRelay)
            .disposed(by: disposeBag)
        
        // Subscribe to backgroundObservable to get new colors from the ViewModel.
        circleViewModel.backgroundColorObservable
            .subscribe(onNext: { [weak self] backgroundColor in
                UIView.animate(withDuration: 0.1) {
                    self?.circleView!.backgroundColor = .systemBlue.withAlphaComponent(0.4)
                    
                    // Try to get complementary color for given background color
                    let viewBackgroundColor = UIColor(complementaryFlatColorOf: backgroundColor)
                    
                    // If it is different that the color
                    if viewBackgroundColor != backgroundColor {
                        
                        // Assign it as a background color of the view
                        // We only want different color to be able to see that circle in a view
                        self?.view.backgroundColor = backgroundColor
                    }
                }
            })
            .disposed(by: disposeBag)
        
        // Add gesture recognizer
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(circleMoved(_:)))
        circleView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func circleMoved(_ recognizer: UIPanGestureRecognizer) {
        let location = recognizer.location(in: view)
        UIView.animate(withDuration: 0.1) {
            self.circleView.center = location
        }
    }
}
