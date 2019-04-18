//
//  ViewController.swift
//  Picker View
//
//  Created by dit03 on 2019. 4. 18..
//  Copyright © 2019년 201730529. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var colorList = ["Red", "Blue", "Yellow"]
    var animalList = ["Dog", "Cat", "Bear", "Tiger", "Rion"]
    
    var lastSelColor = 0, lastSelAnimal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        data.text = "Red Dog"
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return colorList.count
        } else {
            return animalList.count
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return colorList[row]
        } else {
            return animalList[row]
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            data.text = colorList[row] + " " + animalList[lastSelAnimal]
            lastSelColor = row
        } else {
            data.text = colorList[lastSelColor] + " " + animalList[row]
            lastSelAnimal = row
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
}
