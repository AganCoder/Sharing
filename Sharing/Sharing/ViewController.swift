//
//  ViewController.swift
//  Sharing
//
//  Created by Noah-Normal on 2020/3/28.
//  Copyright © 2020 Noah Gao. All rights reserved.
//

import UIKit
import ReplayKit
import Socket

class ViewController: UIViewController {
    
    var socket = try! Socket.create(family: .inet, type: .datagram, proto: .udp)

//    var boradcastAVC: RPBroadcastActivityViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func startRecord(_ sender: UIButton) {
            
        RPBroadcastActivityViewController.load(withPreferredExtension: "io.github.rsenjoyer.Gao.Sharing.UploadSetupUI") { [weak self] (broadcastActivityViewController, error) in
            guard let controller = broadcastActivityViewController else {
                return
            }
            controller.delegate = self
            self?.present(controller, animated: true, completion: nil)
        }

    }
    
    @IBAction func endRecord(_ sender: UIButton) {
        
    }
    
}

extension ViewController: RPBroadcastActivityViewControllerDelegate {
    
    func broadcastActivityViewController(_ broadcastActivityViewController: RPBroadcastActivityViewController, didFinishWith broadcastController: RPBroadcastController?, error: Error?) {
        DispatchQueue.main.sync {
            broadcastActivityViewController.dismiss(animated: true, completion: nil)
        }

        broadcastController?.startBroadcast(handler: { (error) in
            
        })
    }
    

}
