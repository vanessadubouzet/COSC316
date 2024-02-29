//
//  ViewController.swift
//  UIWebViewApp
//
//  Created by cs316 on 2020-02-12.
//  Copyright © 2020 cs316. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate  {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadSpinner.scaleIndicator(factor: 3)
        loadSpinner.isHidden = false
        webView.delegate = self
        loadAddress()
    }

    func loadAddress() {
        
        let myURL = URL(string:"https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        webView.loadRequest(myRequest)
        print("Webpage Loaded Successfully")
    }

    public func webViewDidStartLoad(_ webView: UIWebView) {
        print("webViewDidStartLoad")
        loadSpinner.isHidden = false
        logo.isHidden = false
        loadSpinner.startAnimating()
    }
    
    
    public func webViewDidFinishLoad(_ webView: UIWebView){
        print("webViewDidFinishLoad")
        loadSpinner.stopAnimating()
        loadSpinner.isHidden = true
        logo.isHidden = true
    }
}
extension UIActivityIndicatorView {
    func scaleIndicator(factor: CGFloat) {
        transform = CGAffineTransform(scaleX: factor, y: factor)
    }
}


