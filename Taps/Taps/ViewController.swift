//
//  ViewController.swift
//  Taps
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var singleLabel:UILabel!
    @IBOutlet var doubleLabel:UILabel!
    @IBOutlet var tripleLabel:UILabel!
    @IBOutlet var quadrupleLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.singleTap))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(singleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.doubleTap))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(doubleTap)
        singleTap.require(toFail: doubleTap)
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tripleTap))
        tripleTap.numberOfTapsRequired = 3
        tripleTap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tripleTap)
        doubleTap.require(toFail: tripleTap)
        
        let quadrupleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.quadrupleTap))
        quadrupleTap.numberOfTapsRequired = 4
        quadrupleTap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(quadrupleTap)
        tripleTap.require(toFail: quadrupleTap)
       
    }

    @objc func singleTap() {
        showText("Single Tap Detected", inLabel: singleLabel)
    }
    
    @objc func doubleTap() {
        showText("Double Tap Detected", inLabel: doubleLabel)
    }
    
    @objc func tripleTap() {
        showText("Triple Tap Detected", inLabel: tripleLabel)
    }
    
    @objc func quadrupleTap() {
        showText("Quadruple Tap Detected", inLabel: quadrupleLabel)
    }
    
    private func showText(_ text: String, inLabel label: UILabel) {
        label.text = text
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            label.text = ""
        })
    }
}

