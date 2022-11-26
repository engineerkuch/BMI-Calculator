////
////  CalculatorBrain.swift
////  BMI Calculator
////
////  Created by Kelvin KUCH on 19.09.2022.
////  Copyright © 2022 Angela Yu. All rights reserved.
////
//
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    let b = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    let g = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    let r = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    let defaultColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    
    mutating func calculateBMI(height: Float, weight: Float) -> BMI {
        let bmiVal = Float(weight) / (Float(height) * Float(height))
        
        if bmiVal < 18.5 {
            bmi = BMI(bmiVal: bmiVal, advice: "You're underweight", color: b)
            print("bmi: \(bmi!)")
        } else if (bmiVal > 18.5) && (bmiVal < 25) {
            bmi = BMI(bmiVal: bmiVal, advice: "You're perfect!", color: g)
            print("bmi: \(bmi!)")
        } else {
            bmi = BMI(bmiVal: bmiVal, advice: "You're obokun!", color: r)
            print("bmi: \(bmi!)")
        }

        return bmi ?? BMI(bmiVal: 0.00, advice: "nothing to calculate", color: UIColor.gray)
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", arguments: [bmi?.bmiVal ?? 0.0])
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Nothing to calculate. But something strange is happening here."
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? defaultColor
    }
}
