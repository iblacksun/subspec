//
//  WKScriptMessageHandlerWrapper.swift
//  IBWebView
//
//  Created by Peng Guo on 2018/5/22.
//  Copyright © 2018年 Peng Guo. All rights reserved.
//

import Foundation
import WebKit

public class WKScriptMessageHandlerWrapper: NSObject, WKScriptMessageHandler {
    
    private weak var wrapperedHandler: WKScriptMessageHandler?
    
    public convenience init(handler: WKScriptMessageHandler) {
        self.init()
        wrapperedHandler = handler
    }
    
    public func userContentController(_ userContentController: WKUserContentController,
                                      didReceive message: WKScriptMessage) {
        wrapperedHandler?.userContentController(userContentController, didReceive: message)
    }
}
