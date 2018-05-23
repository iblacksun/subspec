//
//  IBWebViewController.swift
//  IBWebView
//
//  Created by Peng Guo on 2018/5/22.
//  Copyright © 2018年 Peng Guo. All rights reserved.
//

import UIKit
import WebKit

public class IBWebViewController: UIViewController {
    
    fileprivate var url: URL?
    fileprivate var webView: WKWebView?
    
    fileprivate var bridgeName: String?
    
    required public init(url: URL) {
        super.init(nibName: nil, bundle: nil)
        self.url = url
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        createWebView()
    }
}

extension IBWebViewController {
    fileprivate func createWebView() {
        let configuration = WKWebViewConfiguration()
        
        #if ENABLE_BRIDGE
        let handler = WKScriptMessageHandlerWrapper(handler: self)
        configuration.userContentController.add(handler, name: "xx")
        #endif
        
        let webview = WKWebView(frame: CGRect.zero, configuration: configuration)
        
        view.addSubview(webview)
        
        self.webView = webview
    }
}

extension IBWebViewController: WKScriptMessageHandler {
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //未实现，仅示例用
    }
}

