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
    
    var currentOperator = ""
    var containsPoint = false
    
    @IBAction func numericButtons(_ sender: UIButton) {
        
        if sender.currentTitle == "." {
            if containsPoint == false {
                currentDisplay += sender.currentTitle!
                updateDisplay()
                containsPoint = true
            }
        }else if sender.currentTitle == "0" || sender.currentTitle == "00" {
            if currentDisplay != "0" {
                currentDisplay += sender.currentTitle!
                updateDisplay()
            }
        }else{
            if currentDisplay == "0" {
                currentDisplay = sender.currentTitle!
                updateDisplay()
            }else{
                currentDisplay += sender.currentTitle!
                updateDisplay()
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
        updateDisplay()
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        
        if num1 == 0.0 {
            num1 = result
        }
        if currentDisplay != "0" {
            num2 = Double(currentDisplay)!
        }
        
        result = calculate(opr: currentOperator)
        currentDisplay = String(result)
        updateDisplay()
        currentDisplay = "0"
        containsPoint = false
        num1 = result
    }
    
    @IBAction func arithmeticButton(_ sender: UIButton) {
        currentOperator = sender.currentTitle!
        
        if num1 == 0{
            num1 = Double(currentDisplay)!
        }else{
            num2 = Double(currentDisplay)!
        }
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
    
}

