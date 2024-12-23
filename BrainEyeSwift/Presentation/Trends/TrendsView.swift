//
//  TrendsView.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import SwiftUI

struct TrendsView: View {
    
    @ObservedObject private var viewModel = TrendsViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Text("\(viewModel.trends)")
        }
        .padding()
    }
}

#Preview {
    TrendsView()
}
