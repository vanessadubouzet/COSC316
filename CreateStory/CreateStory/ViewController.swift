//
//  ViewController.swift
//  CreateStory
//
//  Created by Vanessa Dubouzet on 2024-02-14.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var verbLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var templateTextView: UITextView!
    @IBOutlet weak var storyTextView: UITextView!
    
    @IBAction func createStoryButton(_ sender: Any) {
        let place = placeTextField.text ?? ""
        let verb = verbTextField.text ?? ""
        let number = numberTextField.text ?? ""
        
        let template = templateTextView.text
        let story = template?.replacingOccurrences(of: "<place>", with: place)
                            .replacingOccurrences(of: "<verb>", with: verb)
                            .replacingOccurrences(of: "<number>", with: number)
        
        storyTextView.text = story
    }
    
    @IBAction func textFieldDoneEditing(sender:UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_sender: AnyObject) {
        placeTextField.resignFirstResponder()
        verbTextField.resignFirstResponder()
        numberTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        placeTextField.delegate = self
        verbTextField.delegate = self
        numberTextField.delegate = self
        
        templateTextView.text = "The iOS developers descended upon <place>. They vowed to <verb> night and day, until all <number> Android users came to their senses. <place> would never be the same again."
    }
}


