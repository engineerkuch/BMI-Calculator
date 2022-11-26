//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Kelvin KUCH on 19.09.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

//import Foundation

import UIKit

class SecondViewController: UIViewController {
    
    var BMIValue: String? = nil
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = BMIValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        label.textColor = .white
        view.addSubview(label)
        view.backgroundColor = UIColor.black
    }
}
