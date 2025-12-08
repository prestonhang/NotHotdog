//
//  CameraCoordinator.swift
//  NotHotdog
//
//  Created by Preston Hang on 12/7/25.
//

import UIKit

class CameraCoordinator: NSObject, UIImagePickerControllerDelegate,
                   UINavigationControllerDelegate {
    var parent: CameraView
    
    init(_ parent: CameraView) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            // Pass image to th Parent view
            parent.image = image
        }
        parent.presentationMode.wrappedValue.dismiss()
    }
    
    func imagePickerControllerCancel(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        parent.presentationMode.wrappedValue.dismiss()
    }
}
