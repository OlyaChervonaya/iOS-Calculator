//
//  ViewController.swift
//  Calculator
//
//  Created by admin on 04.10.2022.
//

import UIKit


class ViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var fieldContainer: UIView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var allButtons: [UIButton]!
    
    private var firstValue: Double = 0.0
    private var secondValue: Double = 0.0
    private var operation: String = ""
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "0"
        
        addSwipeGesture(direction: .right)
        addSwipeGesture(direction: .left)
    }
    
    override func viewWillLayoutSubviews() {
        view.layoutIfNeeded()
        allButtons.forEach{
            $0.layer.cornerRadius = $0.frame.height / 2
        }
    }
    
    // MARK: - Private methods
    private func addSwipeGesture(direction: UISwipeGestureRecognizer.Direction) {
        let swipeGesture = (UISwipeGestureRecognizer(target: self, action: #selector(backSpace)))
        swipeGesture.direction = direction
        fieldContainer.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func backSpace(_ gestureRecognizer: UISwipeGestureRecognizer) {
        
        var label = resultLabel.text
        switch gestureRecognizer.direction {
        case .left:
            if label!.count > 1 {
                label?.removeLast()
                resultLabel.text = label
            } else {
                resultLabel.text = "0" }
        case .right:
            if label!.count > 1 {
                label?.removeLast()
                resultLabel.text = label
            } else {
                resultLabel.text = "0" }
        default:
            return
        }
    }
    
    // MARK: - IBActions
    @IBAction func clearButton(_ sender: UIButton) {
        firstValue = 0.0
        secondValue = 0.0
        resultLabel.text = "0"
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if resultLabel.text!.count < 8 {
            
            let tag = sender.tag
            
            if resultLabel.text?.count == 1 && resultLabel.text == "0" {
                resultLabel.text = ""
            }
            
            switch tag {
            case 0: resultLabel.text! += "0"
            case 1: resultLabel.text! += "1"
            case 2: resultLabel.text! += "2"
            case 3: resultLabel.text! += "3"
            case 4: resultLabel.text! += "4"
            case 5: resultLabel.text! += "5"
            case 6: resultLabel.text! += "6"
            case 7: resultLabel.text! += "7"
            case 8: resultLabel.text! += "8"
            case 9: resultLabel.text! += "9"
            case 10:
                if !resultLabel.text!.contains(".") {
                    resultLabel.text! += "."
                }
            default:
                break
            }
        }
    }
    
    @IBAction func sumButton(_ sender: UIButton) {
        firstValue = Double(resultLabel.text!)!
        operation = "+"
        resultLabel.text = ""
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        secondValue = Double(resultLabel.text!)!
        
        switch operation {
        case "+":
            resultLabel.text = String(firstValue + secondValue)
        case "-":
            resultLabel.text = String(firstValue - secondValue)
        case "*":
            resultLabel.text = String(firstValue * secondValue)
        case "/":
            resultLabel.text = String(firstValue / secondValue)
        default:
            break
        }
        
        let indexPoint = resultLabel.text!.firstIndex(of: ".")!
        let str = resultLabel.text![indexPoint...]
        
        if str == ".0" {
            resultLabel.text!.removeLast(2)
        }
        
        resultLabel.text?.removeLast(resultLabel.text!.count - 8)
    }
    
    @IBAction func subtractionButton(_ sender: UIButton) {
        firstValue = Double(resultLabel.text!)!
        operation = "-"
        resultLabel.text = ""
    }
    
    @IBAction func multiplicationButton(_ sender: UIButton) {
        firstValue = Double(resultLabel.text!)!
        operation = "*"
        resultLabel.text = ""
    }
        
    @IBAction func divisionButton(_ sender: UIButton) {
        firstValue = Double(resultLabel.text!)!
        operation = "/"
        resultLabel.text = ""
    }
}
