//
//  CircularBarView.swift
//  ProgressBar
//
//  Created by David Ali on 02/03/21.
//

import SwiftUI

struct CircularBarView: View {
    var percentage: Double = 0
    var barLineWidth: CGFloat = 20
    
    var trimPercentage: Double {
        percentage * 0.01
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: barLineWidth)
                .opacity(0.3)
                .foregroundColor(.purple)
            
            Circle()
                .trim(from: 0, to: CGFloat(trimPercentage))
                .stroke(style: StrokeStyle(lineWidth: barLineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(.purple)
                .animation(.linear)
            
            BarLabel(percentage: percentage)
        }
        .padding(barLineWidth * 0.5)
    }
}

struct BarLabel: View {
    var percentage: Double = 0
    var percentageString: String {
        String(format: "%0.f", percentage)
    }
    
    var body: some View {
        Text("\(percentageString)%")
            .font(.body)
            .fontWeight(.medium)
            .minimumScaleFactor(0.5)
    }
}
