//
//  ViewController.swift
//  AutoLayoutTutorial
//
//  Created by Vanessa Dubouzet on 2024-02-08.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: UIButton) {
      if sender.title(for: .normal) == "X" {
        sender.setTitle("A very long title for this button", for: .normal)
      } else {
        sender.setTitle("X", for: .normal)
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

