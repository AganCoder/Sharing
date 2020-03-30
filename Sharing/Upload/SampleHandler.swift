//
//  SampleHandler.swift
//  Upload
//
//  Created by Noah-Normal on 2020/3/28.
//  Copyright © 2020 Noah Gao. All rights reserved.
//

import ReplayKit
import Socket

class SampleHandler: RPBroadcastSampleHandler {

    var socket = try! Socket.create(family: .inet, type: .datagram, proto: .udp)
    
    override func broadcastStarted(withSetupInfo setupInfo: [String : NSObject]?) {
        debugPrint(#function)
        // User has requested to start the broadcast. Setup info from the UI extension can be supplied but optional. 
    }
    
    override func broadcastPaused() {
        debugPrint(#function)
        // User has requested to pause the broadcast. Samples will stop being delivered.
    }
    
    override func broadcastResumed() {
        debugPrint(#function)
        // User has requested to resume the broadcast. Samples delivery will resume.
    }
    
    override func broadcastFinished() {
        debugPrint(#function)
        // User has requested to finish the broadcast.
    }
    
    override func processSampleBuffer(_ sampleBuffer: CMSampleBuffer, with sampleBufferType: RPSampleBufferType) {
        debugPrint(#function)
        switch sampleBufferType {
        case RPSampleBufferType.video:
            let names: [String] = ["Alice", "Bob", "Jessy"]
            for name in names {
                if let data = name.data(using: .utf8) {
                    try! socket.write(from: data, to: Socket.createAddress(for: "10.100.94.27", on: 9999)!)
                }
            }
            break
        case RPSampleBufferType.audioApp:
            // Handle audio sample buffer for app audio
            break
        case RPSampleBufferType.audioMic:
            // Handle audio sample buffer for mic audio
            break
        @unknown default:
            // Handle other sample buffer types
            fatalError("Unknown type of sample buffer")
        }
    }
}
