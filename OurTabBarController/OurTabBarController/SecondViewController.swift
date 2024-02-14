//
//  SecondViewController.swift
//  OurTabBarController
//
//  Created by Vanessa Dubouzet on 2024-02-13.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var view2Textfield: UITextField!
    @IBOutlet weak var view2DisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
     if let firstTab = self.tabBarController!.viewControllers![0] as?
    FirstViewController {
     firstTab.view1DisplayLabel.text = view2Textfield.text! + "from Page2!"
     }
     }
}
