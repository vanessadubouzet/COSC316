//
//  ViewController.swift
//  CheckPlease
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let check = CheckMarkRecognizer(target: self, action: #selector(ViewController.doCheck(_:)))
        view.addGestureRecognizer(check)
        imageView.isHidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func doCheck(_ check: CheckMarkRecognizer) {
        imageView.isHidden = false
        if imageView.traitCollection.forceTouchCapability == .available
                && check.maxPossibleForce > 0 {
            imageView.alpha = CGFloat(check.greatestForce/check.maxPossibleForce)
        } else {
            imageView.alpha = CGFloat(1)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.imageView.isHidden = true
        }
        /*
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
             self.imageView.isHidden = true
         }
         */
    }
}

