//
//  ViewController.swift
//  BunniesHop
//
// Created by Vanessa Dubouzet on 2024-02-14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bunnyView1: UIImageView!
    @IBOutlet weak var bunnyView5: UIImageView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var hopsPerSecond: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    var isAnimating = false

    @IBAction func setSpeed(_ sender: Any) {
        let speedValue: Float
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            speedValue = 0.5
        case 1:
            speedValue = 0.75
        case 2:
            speedValue = 1.0
        case 3:
            speedValue = 1.25
        case 4:
            speedValue = 1.5
        default:
            speedValue = 1.0
        }
        
        let duration = TimeInterval(2.0 - speedValue)
        bunnyView1.animationDuration = duration
        bunnyView5.animationDuration = duration
        if isAnimating {
            bunnyView1.startAnimating()
            bunnyView5.startAnimating()
        }
        
        let hopRateString = String(format: "%1.2f hps", 1 / (2 - speedValue))
        hopsPerSecond.text = hopRateString
    }
    
    @IBAction func toggleAnimation(_ sender: Any) {
        if isAnimating {
            bunnyView1.stopAnimating()
            bunnyView5.stopAnimating()
            toggleButton.setTitle("Hop!", for: .normal)
        } else {
            bunnyView1.startAnimating()
            bunnyView5.startAnimating()
            toggleButton.setTitle("Sit Still!", for: .normal)
        }
        isAnimating = !isAnimating
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        let hopAnimation: [UIImage] = [
            UIImage(named: "frame-1")!,
            UIImage(named: "frame-2")!,
            UIImage(named: "frame-3")!,
            UIImage(named: "frame-4")!,
            UIImage(named: "frame-5")!,
            UIImage(named: "frame-6")!,
            UIImage(named: "frame-7")!,
            UIImage(named: "frame-8")!,
            UIImage(named: "frame-9")!,
            UIImage(named: "frame-10")!,
            UIImage(named: "frame-11")!,
            UIImage(named: "frame-12")!,
            UIImage(named: "frame-13")!,
            UIImage(named: "frame-14")!,
            UIImage(named: "frame-15")!,
            UIImage(named: "frame-16")!,
            UIImage(named: "frame-17")!,
            UIImage(named: "frame-18")!,
            UIImage(named: "frame-19")!,
            UIImage(named: "frame-20")!
        ]
        
        let fallAnimation: [UIImage] = [
            UIImage(named: "frame-15")!,
            UIImage(named: "frame-16")!,
            UIImage(named: "frame-17")!,
            UIImage(named: "frame-18")!,
            UIImage(named: "frame-19")!,
            UIImage(named: "frame-20")!,
            UIImage(named: "frame-1")!,
            UIImage(named: "frame-2")!,
            UIImage(named: "frame-3")!,
            UIImage(named: "frame-4")!,
            UIImage(named: "frame-5")!,
            UIImage(named: "frame-6")!,
            UIImage(named: "frame-7")!,
            UIImage(named: "frame-8")!,
            UIImage(named: "frame-9")!,
            UIImage(named: "frame-10")!,
            UIImage(named: "frame-11")!,
            UIImage(named: "frame-12")!,
            UIImage(named: "frame-13")!,
            UIImage(named: "frame-14")!
        ]
        
        bunnyView1.animationImages = hopAnimation
        bunnyView5.animationImages = fallAnimation
        bunnyView1.animationDuration = 1.0
        bunnyView5.animationDuration = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
}


