//
//  ViewController.swift
//  NavigationControllerTableView
//
//  Created by Vanessa Dubouzet on 2024-02-27.
//

import UIKit

class ViewController: UIViewController {
    var titleStringViaSegue : String?
    
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var viewLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)

     if titleStringViaSegue == "Cantaloupe"
     {
     viewImage.image = UIImage(named: "Cantaloupe")
     }
     else if titleStringViaSegue == "Banana" {
     viewImage.image = UIImage (named: "Banana")
     }
     else {
     viewImage.image = UIImage (named: "Apple")
     }

     viewLabel.text = titleStringViaSegue

     }
    
    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         }
    }

