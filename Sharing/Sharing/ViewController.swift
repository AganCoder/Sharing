//
//  ViewController.swift
//  Sharing
//
//  Created by Noah-Normal on 2020/3/28.
//  Copyright © 2020 Noah Gao. All rights reserved.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {

    var boradcastAVC: RPBroadcastActivityViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func startRecord(_ sender: UIButton) {
        
        debugPrint(#function)
        
        RPBroadcastActivityViewController.load { [weak self] (broadcastActivityViewController, error) in
            guard let controller = broadcastActivityViewController else {
                return
            }
            
            controller.delegate = self
            
            
//            self?.boradcastAVC = controller
//            self?.boradcastAVC?.delegate = self
            
            self?.present(controller, animated: true, completion: nil)
            
        }

    }
    
    @IBAction func endRecord(_ sender: UIButton) {
        
    }
    
}

extension ViewController: RPBroadcastActivityViewControllerDelegate {
    
    func broadcastActivityViewController(_ broadcastActivityViewController: RPBroadcastActivityViewController, didFinishWith broadcastController: RPBroadcastController?, error: Error?) {
        
        // 回调到才此处，上面有两个ViewConttroller
        // RPBroadcastActivityViewController
        // RPBroadcastActivityHostViewController
        DispatchQueue.main.sync {
            debugPrint(broadcastActivityViewController)
    
//            broadcastActivityViewController.dismiss(animated: true, completion: nil)            
            self.boradcastAVC = broadcastActivityViewController
        }
        
        broadcastController?.startBroadcast(handler: { (error) in
            debugPrint(error)
        })
    }
    

}
