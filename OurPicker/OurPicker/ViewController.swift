//
//  ViewController.swift
//  OurPicker
//
//  Created by Vanessa Dubouzet on 2024-02-08.
//

import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let fillingComponent = 0
     private let breadComponent = 1
     private let fillingTypes = ["Ham", "Turkey", "Peanut Butter", "Tuna Salad", "Chicken Salad",
     "Roast Beef", "Vegemite"]
     private let breadTypes = [ "White", "Whole Wheat", "Rye", "Sourdough","Seven Grain"]

    @IBOutlet weak var doublePicker: UIPickerView!
    
    @IBAction func selectPicker(_ sender: Any) {
        let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent)
         let breadRow = doublePicker.selectedRow(inComponent: breadComponent)

         let filling = fillingTypes[fillingRow]
         let bread = breadTypes[breadRow]
         let message = "Your \(filling) on \(bread) bread will be right up."

         // create an Alert message to display the selected items
         let alert = UIAlertController(
         title: "Thank you for your order",
         message: message,
         preferredStyle: .alert)
         let action = UIAlertAction(
         title: "Great",
         style: .default,
         handler: nil)
         alert.addAction(action)
         present(alert, animated: true, completion: nil)
    }
    
    /*
     two methods below need to be implemented for
     UIPickerViewDataSource protocol
     */
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
     // the exact number needs to be determined later
     return 2
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component:
    Int) -> Int {
     // the exact number needs to be determined later
         if component == breadComponent {
          return breadTypes.count
          } else {
          return fillingTypes.count
          }
     }
    // one method below need to be implemented for UIPickerViewDelegate
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent
    component: Int) -> String? {
     //component string needs to be determined to be returned
         if component == breadComponent {
          return breadTypes[row]
          } else {
          return fillingTypes[row]
          }
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        doublePicker.delegate = self
        doublePicker.dataSource = self
    }


}

