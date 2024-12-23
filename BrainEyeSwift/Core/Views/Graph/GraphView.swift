//
//  GraphView.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import SwiftUI

private let normalRangeColor = Color.gray.opacity(0.2)

struct GraphView: View {
    
    let title: String
    let subTitle: String
    let data: [Int]
    let normalRange: (Int, Int)
    
    var body: some View {
        VStack {
            GraphTitleView(
                title: title,
                subTitle: subTitle
            )
            
            GeometryReader { geometry in
                ZStack {
                    // Normal range area
                    Rectangle()
                        .fill(normalRangeColor)
                        .frame(
                            height: geometry.size.height * 0.5,
                            alignment: .center
                        )
                    
                    // Graph line and data points
                    Path { path in
                        let widthStep = geometry.size.width / CGFloat(data.count - 1)
                        let height = geometry.size.height
                        
                        for (index, value) in data.enumerated() {
                            let x = CGFloat(index) * widthStep
                            let y = height - (CGFloat(value - normalRange.0) / CGFloat(normalRange.1 - normalRange.0) * height)
                            
                            if index == 0 {
                                path.move(to: CGPoint(x: x, y: y))
                            } else {
                                path.addLine(to: CGPoint(x: x, y: y))
                            }
                        }
                    }
                    .stroke(Color.blue, lineWidth: 2)
                    
                    // Data points
                    ForEach(0..<data.count, id: \.self) { index in
                        let widthStep = geometry.size.width / CGFloat(data.count - 1)
                        let height = geometry.size.height
                        let x = CGFloat(index) * widthStep
                        let y = height - (CGFloat(data[index] - normalRange.0) / CGFloat(normalRange.1 - normalRange.0) * height)
                        
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 8, height: 8)
                            .position(x: x, y: y)
                    }
                }
            }
            .frame(height: 200)
            
            GraphLegend()
                .padding([.top], 20)
        }
        .padding()
    }
}


private struct GraphTitleView: View {
    
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(subTitle)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

private struct GraphLegend: View {
    
    private let rectangleSiZe: CGFloat = 15
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(normalRangeColor)
                .frame(width: rectangleSiZe, height: rectangleSiZe)
            
            Text("Normal range")
                .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    GraphView(
        title: "Accuracy",
        subTitle: "Jun-Jul 2024",
        data: [100, 200, 50],
        normalRange: (30, 50)
    )
}
