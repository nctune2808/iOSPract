//
//  ImagePicker.swift
//  CardWallet
//
//  Created by Tuan on 08/05/2021.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var shown: Bool
    @Binding var imgData : Data
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(shown: $shown, imgData: $imgData)
    }
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) ->
        UIImagePickerController {
    
        let controller = UIImagePickerController()
        
        controller.sourceType = .photoLibrary
        
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
        context: UIViewControllerRepresentableContext<ImagePicker>) {
        
        
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var imgData : Data
        @Binding var shown : Bool
        
        init(shown : Binding<Bool>, imgData : Binding<Data>) {
            _imgData = imgData
            _shown = shown
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            shown.toggle()
            
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            imgData = image.jpegData(compressionQuality: 80)!
            shown.toggle()
            
        }
    }
    
}
