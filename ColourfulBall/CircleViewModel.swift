//
//  CircleViewModel.swift
//  ColourfulBall
//
//  Created by Obde Willy on 27/02/23.
//

import UIKit
import ChameleonFramework
import RxCocoa
import RxSwift

class CircleViewModel {
    // Create one variable that will be changed and observed
    var centerBehaviorRelay = BehaviorRelay<CGPoint?>(value: CGPoint.zero)
    
    // Create observable that will change backgroundColor based on center
    var backgroundColorObservable: Observable<UIColor>!
    
    init() {
        setup()
    }
    
    func setup() {
        // When we get new center, emit new UIColor
        backgroundColorObservable = centerBehaviorRelay.asObservable()
            .map { center in
                guard let center = center else { return UIColor.flatten(.black)() }
                
                let red: CGFloat = ((center.x + center.y).truncatingRemainder(dividingBy: 255.0)) / 255.0 
                let green: CGFloat = ((center.x - center.y).truncatingRemainder(dividingBy: 255.0)) / 255.0
                let blue: CGFloat = ((center.x / center.y).truncatingRemainder(dividingBy: 255.0)) / 255.0
                
                return UIColor.flatten(UIColor(red: red, green: green, blue: blue, alpha: 1.0))()
            }
    }
}
