
Pod::Spec.new do |s|


  s.version      = "0.0.1"
  s.summary      = "A short description of IBWebView."

  s.description  = "Empty DESC"

  s.homepage     = "https://github.com/iblacksun/subspec"

  s.license      = "MIT"
  s.author    = "Peng Guo"

  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/iblacksun/subspec.git", :tag => "#{s.version}" }

  s.requires_arc = true

  s.name                = "IBWebView"
  s.default_subspec     = 'Controller'
  s.public_header_files = 'IBWebView/IBWebView.h'
  s.source_files        = 'IBWebView/IBWebView.h'

  s.subspec 'Controller' do |sp|
    sp.source_files = 'IBWebView/IBWebViewController.swift'
    sp.frameworks = 'WebKit'
  end

  s.subspec 'Bridge' do |sp|
    sp.source_files = 'IBWebView/JSBridge/WKScriptMessageHandlerWrapper.swift'
    sp.dependency 'IBWebView/Controller'

    sp.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => '-D ENABLE_BRIDGE'}
  end

end
