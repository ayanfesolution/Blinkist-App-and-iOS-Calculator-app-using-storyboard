//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Decagon on 07/03/2022.
//

import UIKit

class HomePageViewController: UIViewController {
        
    @IBOutlet var calculatorDisplay: UILabel!
    
    @IBOutlet var calculatorButtons: [UIButton]!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calculatorButtons {
            button.layer.cornerRadius = button.frame.size.height / 2
        }
    }


}

