import Foundation
import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> UIViewController {
        // Create Camera Picker, set it's delegate, and bind the
        // source
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = context.coordinator
        cameraPicker.sourceType = .camera
        return cameraPicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No Updates required
    }
    
    func makeCoordinator() -> CameraCoordinator { CameraCoordinator(self)}
    
}
