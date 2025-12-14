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
    @State private var showCamera = false
    @State private var isHotdog = ""
    @EnvironmentObject var sharedViewModel: HistoryViewModel
    
    var body: some View {
        VStack  {
            if let selectedPhoto = selectedPhoto {
                Image(uiImage: selectedPhoto)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                
                if isHotdog != "" {
                    Text(isHotdog)
                }
                
                Button(action: {
                    beginAnalysis()
                    }) {
                    Text("Analyze Selected Photo")
                        .font(.headline)
                        .padding(20)
                        .frame(maxWidth: 300)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                }
            } else {
                Text("No photo selected")
            }
                        
            Button(action: {
                showCamera = true
                isHotdog = ""
            }) {
                Text("Open Camera")
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
                    isHotdog = ""
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
    func beginAnalysis() {
        let result = AnalyzeResult(selectedPhoto)
        isHotdog = result.result!
        sharedViewModel.createResult(result)
    }
}


#Preview
{
    AnalyzePhotoView()
}
