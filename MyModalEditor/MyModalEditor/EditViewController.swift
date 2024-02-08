//
//  EditViewController.swift
//  MyModalEditor
//
//  Created by Vanessa Dubouzet on 2024-02-08.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func updateEditor(_ sender: Any) {
        (presentingViewController as! ViewController).emailLabel.text = emailField.text
         /* We’’ll use “Triggered Segue” action connect at the end. But if we don't use "Triggered Segue"
         action connection, then we need to call "performSegue function" like this:
         */
         performSegue(withIdentifier: "UnwindSegueToVC", sender: self)
    }
    
    // This function will be called by an action event “ when the “Done” or “Enter”
    // key is hitted for the emailField.
    @IBAction func hideKeyboard(_ sender: AnyObject) {
    emailField.resignFirstResponder()
    }

    override func viewWillAppear(_ animated: Bool) {
    emailField.text = (presentingViewController as! ViewController).emailLabel.text
    super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
