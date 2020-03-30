//
//  BroadcastSetupViewController.swift
//  UploadSetupUI
//
//  Created by Noah-Normal on 2020/3/28.
//  Copyright © 2020 Noah Gao. All rights reserved.
//

import ReplayKit

class BroadcastSetupViewController: UIViewController {

    // Call this method when the user has finished interacting with the view controller and a broadcast stream can start
    func userDidFinishSetup() {
        // URL of the resource where broadcast can be viewed that will be returned to the application
        let broadcastURL = URL(string:"http://apple.com/broadcast/streamID")
        
        // Dictionary with setup information that will be provided to broadcast extension when broadcast is started
        let setupInfo: [String : NSCoding & NSObjectProtocol] = ["broadcastName": "example" as NSCoding & NSObjectProtocol]
        
        // Tell ReplayKit that the extension is finished setting up and can begin broadcasting
        self.extensionContext?.completeRequest(withBroadcast: broadcastURL!, setupInfo: setupInfo)
    }
    
    func userDidCancelSetup() {
        let error = NSError(domain: "YouAppDomain", code: -1, userInfo: nil)
        // Tell ReplayKit that the extension was cancelled by the user
        self.extensionContext?.cancelRequest(withError: error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let btn = UIButton(type: .close)
        btn.addTarget(self, action: #selector(closeButtonDidTapped(sender:)), for: .touchUpInside)
        view.addSubview(btn)
        
        btn.center = view.center
        
        view.backgroundColor = .green
                
    }
    
    @objc func closeButtonDidTapped(sender: UIButton) {
        userDidFinishSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        userDidFinishSetup()
        
        debugPrint(#function)
    }
}

