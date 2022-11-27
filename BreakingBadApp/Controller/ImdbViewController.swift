//
//  ImdbViewController.swift
//  BreakingBadApp
//
//  Created by Emre Tekin on 24.11.2022.
//

import UIKit
import WebKit

class ImdbViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.imdb.com/title/tt0903747")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        

        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            title = "IMDB"
        }

}
