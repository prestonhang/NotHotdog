import Foundation
import UIKit
import SwiftData
import CoreML

@Model
final class AnalyzeResult {
    private var _timestamp: Date?
    private var _result: String?
    var timestamp: Date { get { return _timestamp ?? Date()}}
    var result: String? { get { return _result}}
    
    init(_ photo: UIImage?) {
        _timestamp = Date()

        // Call Model here to determine result
        let model = try? NotHotdogImageClassifier()
        guard let image = photo?.resizeImageTo(size: CGSize(width: 224, height: 224)),
            let buffer = image.convertToBuffer()
        else {
            _result = "Image processing error!"
            return
        }
        
        let prediction = try? model?.prediction(image: buffer)
        if prediction?.target == "hotdog" {
            _result = "Hotdog!"
        } else if prediction?.target == "not_hotdog" {
            _result = "Not Hotdog."
        } else {
            _result = "Model Failed Prediction!"
        }
    }
}
 
