//
//  ContentView.swift
//  NotHotdog
//
//  Created by Preston Hang on 6/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        VStack{
            Text("Not Hotdog")
                .font(.title)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .font(.system(size: 100, weight: .bold))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
