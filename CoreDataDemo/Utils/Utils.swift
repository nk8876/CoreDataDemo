//
//  Utils.swift
//  WebSevicesUsingURLSession
//
//  Created by Dheeraj Arora on 16/07/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setCustomeTitle() {
//        let label1 = UILabel()
//        label1.text = "Fantastic"
//        label1.font = UIFont(name: "Rockwell", size: 20)
//        label1.textColor = .white
//        label1.sizeToFit()
//
//
//        let label2 = UILabel()
//        label2.text = "Journey"
//        label2.font = UIFont(name: "Menlo", size: 20)
//        label2.textColor = .white
//        label2.sizeToFit()
//
//
//        let stackView = UIStackView(arrangedSubviews: [label1,label2])
//        stackView.axis = .horizontal
//        stackView.frame.size.width = label1.frame.width + label2.frame.width
//        stackView.frame.size.height = max(label1.frame.height, label2.frame.height)
//
//        navigationItem.titleView = stackView
    }
    
    func setCustomeImage() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "icons8-left-50 (1)")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "icons8-left-50 (1)")
        
    }
    
    
}

