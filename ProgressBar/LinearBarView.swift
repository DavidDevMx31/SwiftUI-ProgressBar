//
//  LinearBarView.swift
//  ProgressBar
//
//  Created by David Ali on 02/03/21.
//

import SwiftUI

struct LinearBarView: View {
    var progressPercentage: Double
    var barWidth: CGFloat
    var barHeight: CGFloat = 25
    var barCornerRadius: CGFloat = 10
    var barColors: [Color] = [Color.blue]
    var barBackgroundColor: Color = Color.secondary
    
    private var percentageString: String {
        String(format: "%0.f", progressPercentage)
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(barBackgroundColor)
                    .opacity(0.7)
                    .frame(width: barWidth, height: barHeight)
                    .cornerRadius(barCornerRadius)
                
                LinearGradient(gradient: Gradient(colors: barColors), startPoint: .leading, endPoint: .trailing)
                    .frame(width: getProgressGradientWidth(progress: CGFloat(progressPercentage), totalWidth: barWidth), height: barHeight)
                    .cornerRadius(barCornerRadius)
                    .animation(.linear)
            }
            
            HStack(alignment: .center) {
                Text(percentageString + "%")
                    .font(.footnote)
                    .fontWeight(.regular)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private func getProgressGradientWidth(progress: CGFloat, totalWidth: CGFloat) -> CGFloat {
        progress * totalWidth / 100
    }
}
