//
//  ViewController.swift
//  LabelButtonTextFieldImage
//
//  Created by cs316 on 2020-01-25.
//  Copyright © 2020 cs316. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var inputTextfield: UITextField!
    
    
    @IBOutlet weak var imageSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func getImage(_ sender: Any) {
        let imageNum = segmentControl.selectedSegmentIndex
        switch imageNum {
        case 0:
        imageView.image = UIImage(named: "norway")
        break
        case 1:
        imageView.image = UIImage(named: "italy")
        break
        case 2:
        imageView.image = UIImage(named: "forest_park")
        break
        default:
        break
        }
    }
    
    @IBAction func imageSlider(_ sender: Any) {
        if(imageSlider.value < 0.34) {
            imageView.image = UIImage(named: "norway")
        }
        else if (imageSlider.value > 0.67) {
            imageView.image = UIImage(named: "forest_park")
        }
        else {
            imageView.image = UIImage(named: "italy")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setValue(_sender: Any) {
        if(imageSlider.value < 0.34) {
            imageView.image = UIImage(named: "norway")
        }
        else if (imageSlider.value > 0.67) {
            imageView.image = UIImage(named: "forest_park")
        }
        else {
            imageView.image = UIImage(named: "italy")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextfield.resignFirstResponder()
        return true
    }


}

