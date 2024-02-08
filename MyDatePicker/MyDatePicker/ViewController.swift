//
//  ViewController.swift
//  MyDatePicker
//
//  Created by Vanessa Dubouzet on 2024-02-08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerView: UITextView!
    
    @IBAction func getDateTime(_ sender: Any) {
        let date = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short

        dateFormatter.locale = Locale(identifier: "en_US")
        datePickerView.text = "Date & Time selected:\n" +
        dateFormatter.string(from: date)    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let date = NSDate()
        datePicker.setDate(date as Date, animated: false)
        datePickerView.text = "Current Date and Time: \(date)"
    }


}

