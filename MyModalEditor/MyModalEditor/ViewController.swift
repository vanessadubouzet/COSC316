//
//  ViewController.swift
//  MyModalEditor
//
//  Created by Vanessa Dubouzet on 2024-02-08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // This function will be linked programmatically from the “Unwind segue” to be
    // created later in the EditViewController layout.
    @IBAction func exitToHere(_ sender: UIStoryboardSegue) {
     // No code needed!
     }
}

