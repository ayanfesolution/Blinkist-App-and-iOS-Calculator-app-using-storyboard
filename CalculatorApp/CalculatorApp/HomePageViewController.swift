//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Decagon on 07/03/2022.
//

import UIKit

enum Operations: String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Percentage = "%"
    case NULL = "Null"
}


class HomePageViewController: UIViewController {
    
    var runningNumber : String = ""
    var firstValue : String = ""
    var secondValue : String = ""
    var resultNumber : String = ""
    var currentOperation : Operations = .NULL
    
        
    @IBOutlet var calculatorDisplay: UILabel!
    
    @IBOutlet var calculatorButtons: [UIButton]!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calculatorButtons {
            button.layer.cornerRadius = button.frame.size.height / 2
        }
            
            calculatorDisplay.text = "0"
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        runningNumber = ""
        firstValue = ""
        secondValue = ""
        resultNumber = ""
        currentOperation = .NULL
        calculatorDisplay.text = "0"
    }
   
    
    @IBAction func numberClicked(_ sender: UIButton) {
        if runningNumber.count <= 9 {
            runningNumber += "\(sender.tag)"
            calculatorDisplay.text = runningNumber
        }
    }
    
    @IBAction func decimalDotClicked(_ sender: UIButton) {
        if runningNumber.count <= 8 && calculatorDisplay.text?.contains(".") == false && runningNumber != "0." {
            if runningNumber != "0" {
            runningNumber += "."
            calculatorDisplay.text = runningNumber
            } else if calculatorDisplay.text == "0" || runningNumber == "0" {
                runningNumber = "0."
                calculatorDisplay.text = "0"
            } else {
                runningNumber = "0."
                calculatorDisplay.text = "0"
            }
        }
    }
    
    
    @IBAction func addButton(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func divisionButton(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    @IBAction func percentageButton(_ sender: UIButton) {
        operation(operation: .Percentage)
    }
    
    @IBAction func signChangingButton(_ sender: UIButton) {
        if calculatorDisplay.text!.hasPrefix("-") {
            calculatorDisplay.text! = runningNumber
            
            calculatorDisplay.text = calculatorDisplay.text!
        } else {
            calculatorDisplay.text = "-\(String(describing: calculatorDisplay.text!))"
        }
    }
    
    @IBAction func equalToButton(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    
    func operation(operation: Operations) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                secondValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    resultNumber = "\(Double(firstValue)! + Double(secondValue)!)"
                }else if currentOperation == .Subtract {
                    resultNumber = "\(Double(firstValue)! - Double(secondValue)!)"
                }else if currentOperation == .Multiply {
                    resultNumber = "\(Double(firstValue)! * Double(secondValue)!)"
                }else if currentOperation == .Divide {
                    resultNumber = "\(Double(firstValue)! / Double(secondValue)!)"
                }else if currentOperation == .Percentage {
                    resultNumber = "\(Double(firstValue)! / Double(secondValue)! * 100)"
                }
                
                firstValue = resultNumber
                if (Double(resultNumber)!.truncatingRemainder(dividingBy: 1) == 0 ) {
                    resultNumber = "\(Int(Double(resultNumber)!))"
                }
                calculatorDisplay.text = resultNumber
            }
            currentOperation = operation
        } else {
            firstValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

}
