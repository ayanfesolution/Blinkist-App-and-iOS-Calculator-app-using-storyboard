//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Decagon on 07/03/2022.
//

import UIKit

class HomePageViewController: UIViewController {
    
    var firstNumber : String = ""
    var secondNumber : String = ""
    var operatorKey : String = ""
    var haveResult : Bool = false
    var resultNumber : String = ""
    var numberAfterResult : String = ""
    
        
    @IBOutlet var calculatorDisplay: UILabel!
    
    @IBOutlet var calculatorButtons: [UIButton]!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calculatorButtons {
            button.layer.cornerRadius = button.frame.size.height / 2
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
            firstNumber = ""
            secondNumber = ""
            operatorKey = ""
            haveResult = false
            resultNumber = ""
            numberAfterResult = ""
            calculatorDisplay.text = "0"
    }
    
    @IBAction func numberClicked(_ sender: UIButton) {
        if operatorKey == "" {
            firstNumber += String(sender.tag)
            calculatorDisplay.text = firstNumber
        } else if operatorKey != "" && !haveResult {
            secondNumber += String(sender.tag)
            calculatorDisplay.text = secondNumber
        } else if operatorKey != "" && haveResult {
            numberAfterResult += String(sender.tag)
            calculatorDisplay.text = numberAfterResult
        }
    }
    @IBAction func decimalDotClicked(_ sender: UIButton) {
        if operatorKey == "" {
            firstNumber += "."
            calculatorDisplay.text = firstNumber
        } else if operatorKey != "" && !haveResult {
            secondNumber += "."
            calculatorDisplay.text = secondNumber
        }
    }
    
    @IBAction func numberZeroClicked(_ sender: UIButton) {
        if operatorKey == "" && calculatorDisplay.text != "0" {
            firstNumber += String(sender.tag)
            calculatorDisplay.text = firstNumber
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        operatorKey = "+"
    }
    
    @IBAction func subtractButton(_ sender: Any) {
        operatorKey = "-"
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        operatorKey = "x"
    }
    
    @IBAction func divisionButton(_ sender: Any) {
        operatorKey = "÷"
    }
    
    @IBAction func percentageButton(_ sender: Any) {
        operatorKey = "%"
    }
    
    @IBAction func signChangingButton(_ sender: Any) {
    }
    
    @IBAction func equalToButton(_ sender: Any) {
        resultNumber = String(Int(performOperations()))
        calculatorDisplay.text = resultNumber
        numberAfterResult = ""
    }
    
    func performOperations() -> Double {
        if operatorKey == "+" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! + Double(secondNumber)!
            } else {
                return Double(resultNumber)! + Double(numberAfterResult)!
            }
        } else if operatorKey == "-" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! - Double(secondNumber)!
            } else {
                return Double(resultNumber)! - Double(numberAfterResult)!
            }
        } else if operatorKey == "÷" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! / Double(secondNumber)!
            } else {
                return Double(resultNumber)! / Double(numberAfterResult)!
            }
        } else if operatorKey == "x" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! * Double(secondNumber)!
            } else {
                return Double(resultNumber)! * Double(numberAfterResult)!
            }
        } else if operatorKey == "%" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! * 0.01
            } else {
                return Double(resultNumber)! * 0.01
            }
        }
        return 0
    }
    
}


