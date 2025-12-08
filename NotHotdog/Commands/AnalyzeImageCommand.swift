//
//  AnalyzePhotoCommand.swift
//  NotHotdog
//
//  Created by Preston Hang on 12/7/25.
//
import UIKit
import SwiftData

class AnalyzeImageCommand {
    private var imageToAnalyze: UIImage
    
    init (image: UIImage){
        imageToAnalyze = image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        analyzePhoto(formatter.date(formatter.string(from: Date()))!, image)
    }
    
    func analyzePhoto(_ date: String, _ image: UIImage) -> Bool {
        let result = AnalyzedResult(date).result
        return AnalyzedResult(date).result == "True"
    }
}
