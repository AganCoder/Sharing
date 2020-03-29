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
        let names: [String] = ["Alice", "Bob", "Jessy"]
        
        for name in names {
            if let data = name.data(using: .utf8) {
                try! socket.write(from: data, to: Socket.createAddress(for: "192.168.0.101", on: 9999)!)
            }

            var d = Data()
            try? socket.readDatagram(into: &d)                                                
            print(String(data: d, encoding: .utf8))
        }
        
    
//        RPBroadcastActivityViewController.load(withPreferredExtension: "io.github.rsenjoyer.Gao.Sharing.UploadSetupUI") { [weak self] (broadcastActivityViewController, error) in
//            guard let controller = broadcastActivityViewController else {
//                return
//            }
//
//            controller.delegate = self
//
//
////            self?.boradcastAVC = controller
////            self?.boradcastAVC?.delegate = self
//
//            self?.present(controller, animated: true, completion: nil)
//
//        }

    }
    
    @IBAction func endRecord(_ sender: UIButton) {
        
    }
    
}

extension ViewController: RPBroadcastActivityViewControllerDelegate {
    
    func broadcastActivityViewController(_ broadcastActivityViewController: RPBroadcastActivityViewController, didFinishWith broadcastController: RPBroadcastController?, error: Error?) {
        
        // 回调到才此处，上面有两个ViewConttroller
        // RPBroadcastActivityViewController
        // RPBroadcastActivityHostViewController
//        DispatchQueue.main.sync {
//            debugPrint(broadcastActivityViewController)
//
//            broadcastActivityViewController.dismiss(animated: true, completion: nil)
//            self.boradcastAVC = broadcastActivityViewController
//        }
//
//        broadcastController?.startBroadcast(handler: { (error) in
//            debugPrint(error)
//        })
    }
    

}
