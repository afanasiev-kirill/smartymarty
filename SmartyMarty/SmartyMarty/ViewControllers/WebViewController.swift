//
//  WebViewController.swift
//  SmartyMarty
//
//  Created by Yukun on 2023-04-08.
//  This view controller displays a web page using the WKWebView component. The web page to be displayed is hardcoded as the Facebook home page. The WKWebView is loaded with the Facebook URL and a loading indicator is displayed while the page loads. Once the page is loaded, the loading indicator is hidden.
//


import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var webP : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    // Display loading indicator when the web page starts loading
    func webP (_ webP: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        activity.isHidden = false
        activity.startAnimating()
    }
    
    // Hide loading indicator when the web page finishes loading
    func webP (_ webP: WKWebView, didFinish navigation: WKNavigation!){
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the Facebook home page in the WKWebView
        let facebookAddress = URL (string: "https://www.facebook.com/")
        
        let url = URLRequest ( url: facebookAddress!)
        webP?.load(url)
        // Do any additional setup after loading the view.
    }
    
}
