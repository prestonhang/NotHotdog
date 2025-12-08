import Foundation
import UIKit
import SwiftData

@Model
final class AnalyzedResult {
    private var _timestamp: Date?
    private var _result: String?
    var timestamp: Date { get { return _timestamp ?? Date()}}
    var result: String? { get { return _result}}
    
    init(_ timestamp: Date,_ photo: UIImage?) {
        self._timestamp = timestamp
        
        // Call AI here to determine result
    }
}
 
