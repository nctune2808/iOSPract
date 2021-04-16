//
//  ScanDocumentViewModel.swift
//  CardWallet
//
//  Created by Tuan on 21/03/2021.
//

import SwiftUI
import VisionKit
import Vision

struct ScanDocumentViewModel: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var recognizedText: [String]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(recognizedText: $recognizedText, parent: self)
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentViewController = VNDocumentCameraViewController()
        documentViewController.delegate = context.coordinator
        return documentViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        // nothing to do here
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var recognizedText: Binding<[String]>
        var parent: ScanDocumentViewModel
        
        init(recognizedText: Binding<[String]>, parent: ScanDocumentViewModel) {
            self.recognizedText = recognizedText
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let extractedImages = extractImages(from: scan)
            let processedText = recognizeText(from: extractedImages)
            
            recognizedText.wrappedValue = processedText
            parent.presentationMode.wrappedValue.dismiss()
            
            //            var string = entireRecognizedText
            //
            //            string.removeAll(where:  {$0.isNumber || $0.isSymbol || $0.isPunctuation})
            //            array = string.components(separatedBy: "\n")
            //
            ////                let number = entireRecognizedText.removeAll(where:  {$0.isNumber})
            //            print(array.count)
        }
        
        fileprivate func extractImages(from scan: VNDocumentCameraScan) -> [CGImage] {
            var extractedImages = [CGImage]()
            for index in 0..<scan.pageCount {
                let extractedImage = scan.imageOfPage(at: index)
                guard let cgImage = extractedImage.cgImage else { continue }
                
                extractedImages.append(cgImage)
            }
            return extractedImages
        }
        
        fileprivate func recognizeText(from images: [CGImage]) -> [String] {
            var entireRecognizedText = ""
            var array : [String] = []
            let recognizeTextRequest = VNRecognizeTextRequest { (request, error) in
                guard error == nil else { return }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
                
                let maximumRecognitionCandidates = 5
                for observation in observations {
                    guard let candidate = observation.topCandidates(maximumRecognitionCandidates).first else { continue }
                    
                    entireRecognizedText += "\(candidate.string)\n"
                    
                }
//                let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=().!_")
//                entireRecognizedText.filter {okayChars.contains($0)}
                
                
                entireRecognizedText.removeAll(where:  {$0.isSymbol})
                array = entireRecognizedText.components(separatedBy: "\n").filter { $0 != "*" }

                print(array)
                                
            }
            

            
            recognizeTextRequest.recognitionLevel = .accurate
            
            for image in images {
                let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
                
                try? requestHandler.perform([recognizeTextRequest])
            }
            
            return array
        }
    }
}
