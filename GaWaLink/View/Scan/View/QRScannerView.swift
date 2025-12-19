//
//  QRScannerView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI
import AVFoundation

struct QRScannerView: UIViewRepresentable {
    
    var onResult: (String) -> Void
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let session = AVCaptureSession()
        
        guard
            let device = AVCaptureDevice.default(for: .video),
            let input = try? AVCaptureDeviceInput(device: device)
        else {
            return view
        }
        
        session.addInput(input)
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(context.coordinator, queue: .main)
        output.metadataObjectTypes = [.qr]
        
        let preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = .resizeAspectFill
        preview.frame = UIScreen.main.bounds
        
        view.layer.addSublayer(preview)
        session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onResult: onResult)
    }
    
    final class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        
        let onResult: (String) -> Void
        
        init(onResult: @escaping (String) -> Void) {
            self.onResult = onResult
        }
        
        func metadataOutput(_ output: AVCaptureMetadataOutput,
                            didOutput metadataObjects: [AVMetadataObject],
                            from connection: AVCaptureConnection) {
            
            if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
               let value = object.stringValue {
                onResult(value)
            }
        }
    }
}
