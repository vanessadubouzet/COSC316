//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Vanessa Dubouzet on 2024-02-02.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet var inputTextfield: UITextField!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func GoForIt(_ sender: Any) {
        outputLabel.text = "Hello, " + inputTextfield.text!
        image.image = UIImage(named: "norway")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputTextfield.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextfield.resignFirstResponder()
        return true
    }
}

