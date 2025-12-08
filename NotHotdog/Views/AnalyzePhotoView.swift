//
//  AnalyzePhotoView.swift
//  NotHotdog
//
//  Created by Preston Hang on 12/7/25.
//

import SwiftUI
import PhotosUI

struct AnalyzePhotoView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhoto: UIImage?
    @State private var showCamera: Bool = false
    @State private var isHotdog: Bool = false
    
    var body: some View {
        if let selectedPhoto = selectedPhoto {
            Image(uiImage: selectedPhoto)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .cornerRadius(20)
            Button(action: { isHotdog = AnalyzeImageCommand(UIImage: )(selectedPhoto: selectedPhoto)}) {
                if isHotdog {
                    Text("It's a Hotdog!")
                } else {
                    Text("It's not a Hotdog...")
                }
            }
        } else {
            Text("No photo selected")
        }
        
        Button(action: { showCamera = true}) {
            Text("Find out if a photo has a Hotdog")
                .font(.headline)
                .padding(20)
                .frame(maxWidth: 300)
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(50)
        }
        .sheet(isPresented: $showCamera) {
            CameraView(image: $selectedPhoto)
        }
        
        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
            Text("Select a photo")
                .font(.headline)
                .padding(20)
                .frame(maxWidth: 300)
                .background(Color.indigo)
                .foregroundColor(.white)
                .cornerRadius(50)
        }
        .onChange(of: selectedItem) { _, item in
            if let item = item {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        selectedPhoto = UIImage(data: data)
                        
                    } else {
                        print( "Failed to load data.")
                    }
                }
            }
        }
    }
}


#Preview
{
    AnalyzePhotoView()
}
