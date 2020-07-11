//
//  DetailViewController.swift
//  Assignment
//
//  Created by Rahul Mahajan on 11/07/2020.
//  Copyright © 2020 Rahul Mahajan. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.hidesWhenStopped = true
        }
    }

    var body: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadWebView()
    }

    func loadWebView() {
        self.activityIndicator.startAnimating()
        self.webView.loadHTMLString(body, baseURL: nil)
        self.webView.sizeToFit()
    }
}

extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        insertCSSString(into: webView)
        //insertContentsOfCSSFile(into: webView)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
    
    func insertCSSString(into webView: WKWebView) {
        let cssString = "body { font-size: 150px; color: #000 }"
        let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
        webView.evaluateJavaScript(jsString, completionHandler: nil)
    }

    func insertContentsOfCSSFile(into webView: WKWebView) {
        guard let path = Bundle.main.path(forResource: "styles", ofType: "css") else { return }
        let cssString = try! String(contentsOfFile: path).trimmingCharacters(in: .whitespacesAndNewlines)
        let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
        webView.evaluateJavaScript(jsString, completionHandler: nil)
    }
}
