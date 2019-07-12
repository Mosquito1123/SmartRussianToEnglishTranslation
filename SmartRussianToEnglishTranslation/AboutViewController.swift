//
//  AboutViewController.swift
//  SmartRussianToEnglishTranslation
//
//  Created by Mosquito1123 on 13/07/2019.
//  Copyright © 2019 Cranberry. All rights reserved.
//

import UIKit
import WebKit
class AboutViewController: UIViewController,WKNavigationDelegate {
    var urlString:String?{
        didSet{
            guard let url = URL(string: urlString ?? "") else {return}
            let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
            self.webView?.load(request)
        }
    }
    var webView:WKWebView?
    override func loadView() {
        super.loadView()
        self.automaticallyAdjustsScrollViewInsets = false
        self.webView = WKWebView(frame: CGRect.zero)
        self.webView?.navigationDelegate = self
        self.view.addSubview(self.webView ?? UIView())
        self.webView?.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor)
        self.webView?.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor)
        self.webView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        self.webView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "About"
        guard let url = URL(string: urlString ?? "") else {return}
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        self.webView?.load(request)
        
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.title = webView.title
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
}
