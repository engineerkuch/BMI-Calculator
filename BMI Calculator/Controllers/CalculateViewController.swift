//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    var bmi: BMI?
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
//        print("V1 -> heightSliderChanged sender.value: \(round(sender.value * 100) / 100)")
        heightLabel.text = "\(String(format: "%.2f", arguments: [sender.value]))\("m")"
        
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = "\(String(format: "%.0f", arguments: [sender.value]))\("kg")"
        
    }
    
    
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        bmi = calculatorBrain.calculateBMI(height: height, weight: weight)
        print(bmi ?? BMI(bmiVal: 0.00, advice: "Nothing to calculate", color: UIColor.gray))
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice =  calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    

}

