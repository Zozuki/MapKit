//
//  DetailViewController.swift
//  Project16
//
//  Created by MacBook Air on 21.11.2020.
//  Copyright © 2020 MacBook Air. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {
    var url = String()
    var webView: WKWebView!
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let Url = URL(string: url)
        webView.load(URLRequest(url: Url!))
        view = webView
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
