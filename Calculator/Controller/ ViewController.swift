//
//  ViewController.swift
//  Calculator
//
//  Created by HAMDI TLILI on 08/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var  userIsInTheMiddleOfTping = false
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTping {
            let textCurrentlyInDsplay = display.text!
            display!.text = textCurrentlyInDsplay + digit
            
        } else {
            display  .text = digit
            userIsInTheMiddleOfTping = true
            
        }
        
    }
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    private var brain = CalculatorBrain()
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTping = false
            
        }
        
        if let mathemacalSymbol = sender.currentTitle
        {
            brain.performOperation(mathemacalSymbol)
        }
        if let result = brain.result {
            displayValue = result
            
        }
    }
    
}
