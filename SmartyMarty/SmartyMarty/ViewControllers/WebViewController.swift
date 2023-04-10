//
//  WebViewController.swift
//  SmartyMarty
//
//  Created by Leo on 2023-04-08.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var webP : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    func webP (_ webP: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webP (_ webP: WKWebView, didFinish navigation: WKNavigation!){
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let facebookAddress = URL (string: "https://www.facebook.com/")
        
        let url = URLRequest ( url: facebookAddress!)
        webP?.load(url)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
