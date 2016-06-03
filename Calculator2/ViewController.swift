//
//  ViewController.swift
//  Calculator2
//
//  Created by Hye Sun Hong on 6/1/16.
//  Copyright © 2016 Vaporware. All rights reserved.
//

// Hello world

import UIKit

class ViewController: UIViewController {
    // ui button not anyobject. func funcName(sender: UIButton, otherargument: int) -> Double

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping: Bool = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            
            let textCurrentlyInDisplay = display!.text!
            display!.text = textCurrentlyInDisplay + digit
            
        }
        else {
            display!.text = digit
        }
        
        userIsInTheMiddleOfTyping = true
        
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    // one free initializer
    
    // private var brain: CalculatorBrain = CalculatorBrain()
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
        }
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
            displayValue = brain.result
    }

    
}
// pi plus minus ex divide sqrt π+−×÷√
