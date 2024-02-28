//
//  SecondViewController.swift
//  NavigationController
//
//  Created by Vanessa Dubouzet on 2024-02-27.
//


import UIKit

class SecondViewController: UIViewController {
    var fromViewController: ViewController?
    
    @IBOutlet weak var view2Textfield: UITextField!
    @IBOutlet weak var view2Label: UILabel!

     override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
     view2Label.text = fromViewController?.view1Textfield.text
     }

     override func viewWillDisappear (_ animated: Bool){
     super.viewWillDisappear(animated)
     fromViewController?.view1Label.text = view2Textfield?.text
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
