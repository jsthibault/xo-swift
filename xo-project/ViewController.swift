//
//  ViewController.swift
//  xo-project
//
//  Created by Jean-Stephane Mowgli Thibault  on 11/06/2016.
//  Copyright © 2016 Jean-Stephane Mowgli Thibault . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var CurrencyIn: UIPickerView!
    @IBOutlet weak var CurrencyOut: UIPickerView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var change: UILabel!
  
    var         tabIn = ["USD", "BHD", "EUR", "GBP", "RUB"]
    var         tabOut = ["USD", "BHD", "EUR", "GBP", "RUB"]
    var         In = ""
    var         Out = ""
    var         index = 0
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        In = tabIn[0]
        Out = tabOut[0]
        self.CurrencyIn.delegate = self
        self.CurrencyIn.dataSource = self
        self.CurrencyOut.delegate = self
        self.CurrencyOut.dataSource = self
        input.delegate = self
        input.keyboardType = .DecimalPad
    }
    
    @IBAction func change(sender: AnyObject)
    {
        var         value: String = input.text!
        
       
        print(value)
        print(In, " <-> ", Out)
        value = value.stringByReplacingOccurrencesOfString(",", withString: ".")
        print(value)
        view.endEditing(true)
        Currency(From: In, To: Out, value: value, TextLabel: change)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if (pickerView == CurrencyIn)
        {
            return tabIn.count
        }
        else if (pickerView == CurrencyOut)
        {
            return tabOut.count
        }
        return tabOut.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if (pickerView == CurrencyIn)
        {
            return tabIn[row]
        }
        else if (pickerView == CurrencyOut)
        {
            return tabOut[row]
        }
        return tabOut[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if (pickerView == CurrencyIn)
        {
            In = tabIn[row]
            print(tabIn[row])
        }
        else if (pickerView == CurrencyOut)
        {
            Out = tabOut[row]
            print(tabOut[row])
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

