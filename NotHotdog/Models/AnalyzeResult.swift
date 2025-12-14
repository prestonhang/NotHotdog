import Foundation
import UIKit
import SwiftData

@Model
final class AnalyzeResult {
    private var _timestamp: Date?
    private var _result: String?
    var timestamp: Date { get { return _timestamp ?? Date()}}
    var result: String? { get { return _result}}
    
    init(_ photo: UIImage?) {
        self._timestamp = Date()
        
        // Call Model here to determine result
        
        let imageClassifierWrapper = try? NotHotdogImageClassifier()
        
        if let imageToPredict = photo {
            imageClassifierWrapper?.prediction(imageToPredict)
            }
        }
    }
}
 
