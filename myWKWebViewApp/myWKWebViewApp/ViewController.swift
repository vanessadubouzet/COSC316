//
//  ViewController.swift
//  myWKWebViewApp
//
//  Created by Daniel Ling on 2022-02-16.
//

import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {


    @IBOutlet var siteView: WKWebView!
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        loadSpinner.isHidden = false
        loadSpinner.scaleIndicator(factor: 4)
        loadAddress()
        
   
        siteView.navigationDelegate = self
        self.view.addSubview(loadSpinner)
      
        siteView = WKWebView()
       
 
    }
    
    func loadAddress() {
        let myURL = URL(string:"https://www.google.com")
        let request = URLRequest(url: myURL!)
        siteView.load(request)
    }

    //MARK:- WKNavigationDelegate
 
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadSpinner.startAnimating()
        print("Start to load")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
        loadSpinner.stopAnimating()
        loadSpinner.isHidden = true

    }
}
extension UIActivityIndicatorView {
    func scaleIndicator(factor: CGFloat) {
        transform = CGAffineTransform(scaleX: factor, y: factor)
    }
}


