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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func startRecord(_ sender: UIButton) {
        
        let screenRecorder = RPScreenRecorder.shared()
        screenRecorder.isMicrophoneEnabled = true
        screenRecorder.startRecording { (error) in
            debugPrint(error)
        }
        
    }
    
    @IBAction func endRecord(_ sender: UIButton) {
        
    
        RPScreenRecorder.shared().stopRecording {[weak self] (controller, error) in
            guard let controller = controller, error == nil else {
                return
            }
            
            self?.present(controller, animated: true, completion: {
        
            })
        }
        
    }
    
}

