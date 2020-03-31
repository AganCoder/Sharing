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
        switch sampleBufferType {
        case RPSampleBufferType.video:
            
            if let cvImageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
                let ciimage = CIImage(cvImageBuffer: cvImageBuffer)
                let context = CIContext()
                
                guard let cgImage = context.createCGImage(ciimage, from: ciimage.extent) else {
                    return
                }
                
                let uiImage = UIImage(cgImage: cgImage)
            
                                
            } else {
                debugPrint("转换错误")
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
