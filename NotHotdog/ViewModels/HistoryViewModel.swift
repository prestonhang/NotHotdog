//
//  HistoryViewModel.swift
//  NotHotdog
//
//  Created by Preston Hang on 12/13/25.
//

import Foundation


final class HistoryViewModel: ObservableObject {
    @Published var results = [AnalyzeResult]()
    
    init(results: [AnalyzeResult] = [AnalyzeResult]()) {
        
    }
    
    func createResult(_ result: AnalyzeResult) {
        results.append(result)
    }
    
    func deleteResult(_ result: AnalyzeResult) {
        if let index = results.firstIndex(of: result) {
            results.remove(at: index)
        }
    }
}
