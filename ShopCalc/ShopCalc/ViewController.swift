//
//  ViewController.swift
//  ShopCalc
//
//  Created by Pranav Sharma on 7/3/17.
//  Copyright © 2017 Pranav Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var originalField: UITextField!
    @IBOutlet var discountField: UITextField!
    @IBOutlet var taxField: UITextField!
    @IBOutlet var finalField: UITextField!
    
    @IBAction func clicked(_ sender: UIButton)
    {
        var original = 0.0
        var discount = 0.0
        var tax = 0.0
        var final = 0.0
        
        if originalField.hasText
        {
            original = Double(originalField.text!)!
        }
        
        if discountField.hasText
        {
            discount = Double(discountField.text!)!
            discount /= 100 // Convert to decimal
        }
        
        if taxField.hasText
        {
            tax = Double(taxField.text!)!
            tax /= 100 // Convert to decimal
        }
        
        if finalField.hasText
        {
            final = Double(finalField.text!)!
        }
        
        switch sender.currentTitle!
        {
        case "Original Price":
            original = final / ((1 - discount) * (1 + tax))
            originalField.text = String(original)
            break;
        case "Discount %":
            discount = 1 - (final / (original * (1 + tax)))
            discount *= 100 // Convert to percentage
            discountField.text = String(discount)
            break;
        case "Tax %":
            tax = (final / (original * (1 - discount))) - 1
            tax *= 100 // Convert to percentage
            taxField.text = String(tax)
            break;
        case "Final Price":
            final = original * (1 - discount) * (1 + tax)
            finalField.text = String(final)
            break;
        case "Clear":
            originalField.text = ""
            discountField.text = ""
            taxField.text = ""
            finalField.text = ""
            break;
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

