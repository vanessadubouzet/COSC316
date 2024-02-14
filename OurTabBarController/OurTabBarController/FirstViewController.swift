//
//  FirstViewController.swift
//  OurTabBarController
//
//  Created by Vanessa Dubouzet on 2024-02-13.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var view1Textfield: UITextField!
    @IBOutlet weak var view1DisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
     if let secondTab = self.tabBarController!.viewControllers![1]
    as? SecondViewController {
     secondTab.view2DisplayLabel.text = view1Textfield.text!
    + "from Page1!"
     }
     }
}
