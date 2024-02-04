//
//  ViewController.swift
//  LabelButtonTextFieldImage
//
//  Created by cs316 on 2020-01-25.
//  Copyright © 2020 cs316. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputTextfield: UITextField!
    
    @IBAction func getInput(_ sender: Any) {
       outputLabel.text = "Hello, " + inputTextfield.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        self.inputTextfield.delegate = self    //***
        self.inputTextfield.keyboardType = .numberPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextfield.resignFirstResponder()
        return true
    }


}

