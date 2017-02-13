//
//  ViewController.swift
//  calculator
//
//  Created by Arslan Waheed on 2/5/17.
//  Copyright © 2017 Arslan Waheed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var currentDisplay = "0"
    var num1 = 0.0
    var num2 = 0.0
    var result = 0.0
    
    var operatorSelected = false
    var currentOperator = ""
    var containsPoint = false
    var containsValue = false //for num2
    
    @IBAction func numericButtons(_ sender: UIButton) {
        result = 0
        
        if sender.currentTitle == "." {
            if containsPoint == false {
                currentDisplay += sender.currentTitle!
                updateDisplay()
                assignValue()
                containsPoint = true
            }
        }else if sender.currentTitle == "0" || sender.currentTitle == "00" {
            if currentDisplay != "0" {
                currentDisplay += sender.currentTitle!
                updateDisplay()
                assignValue()
            }else {
                assignValue()
            }
        }else{
            if currentDisplay == "0" {
                currentDisplay = sender.currentTitle!
                updateDisplay()
                assignValue()
            }else{
                currentDisplay += sender.currentTitle!
                updateDisplay()
                assignValue()
            }
        }
    }
    
    @IBAction func clearAllButton(_ sender: UIButton) {
        num1 = 0
        num2 = 0
        result = 0
        containsPoint = false
        currentDisplay = "0"
        currentOperator = ""
        operatorSelected = false
        updateDisplay()
        containsValue = false
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        
        if num1 == 0.0 {
            num1 = result
        }
        if operatorSelected && !containsValue {
            num2 = num1
        }
 
        result = calculate(opr: currentOperator)
        currentDisplay = String(result)
        updateDisplay()
        currentDisplay = "0"
        containsPoint = false
        num1 = result
        operatorSelected = false
    }
    
    @IBAction func arithmeticButton(_ sender: UIButton) {
        currentOperator = sender.currentTitle!
        operatorSelected = true
        
        currentDisplay = "0"
        containsPoint = false
    }
    
//these are all my helper functions
    func updateDisplay(){
        displayLabel.text = currentDisplay
    }
    
    func addition(a:Double, b:Double) -> Double {
        return a + b
    }
    
    func multiplication(a:Double, b:Double) -> Double {
        return a * b
    }
    
    func subtraction(a:Double, b:Double) -> Double {
        return a - b
    }
    
    func division(a:Double, b:Double) -> Double {
        return a / b
    }
    
    func calculate(opr: String) -> Double {
        
        var result = 0.0
        
        if opr == "+" {
            result = addition(a:num1,b:num2)
            
        }else if opr == "x" {
            result = multiplication(a:num1,b:num2)
            
        }else if opr == "-" {
            result = subtraction(a:num1,b:num2)
            
        }else if opr == "/" {
            result = division(a:num1,b:num2)
            
        }
        return result
    }
    
    func assignValue() {
        if operatorSelected {
            num2 = Double(currentDisplay)!
            containsValue = true
        }else {
            num1 = Double(currentDisplay)!
        }
    }
    
}

