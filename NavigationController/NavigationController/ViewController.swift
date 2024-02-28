//
//  ViewController.swift
//  NavigationController
//
//  Created by Vanessa Dubouzet on 2024-02-27.
//

import UIKit

class ViewController: UIViewController {
    
     @IBOutlet weak var view1Textfield: UITextField!
     @IBOutlet weak var view1Label: UILabel!

     override func prepare (for segue: UIStoryboardSegue, sender: Any?){
     let sdest = segue.destination as! SecondViewController
     sdest.fromViewController = self
     }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

