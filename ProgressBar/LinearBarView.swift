//
//  LinearBarView.swift
//  ProgressBar
//
//  Created by David Ali on 02/03/21.
//

import SwiftUI

struct LinearBarView: View {
    var progressPercentage: Double
    var barCornerRadius: CGFloat = 10
    var barColors: [Color] = [Color.blue]
    var barBackgroundColor: Color = Color.secondary
    var percentageLabelColor: Color = Color.black
    
    private var percentageString: String {
        String(format: "%0.f", progressPercentage)
    }
    
    var body: some View {
        GeometryReader { geoReader in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(barBackgroundColor)
                    .opacity(0.6)
                    .frame(width: geoReader.size.width, height: geoReader.size.height)
                    .cornerRadius(barCornerRadius)
                
                LinearGradient(gradient: Gradient(colors: barColors), startPoint: .leading, endPoint: .trailing)
                    .frame(width: getProgressGradientWidth(progress: CGFloat(progressPercentage), totalWidth: geoReader.size.width), height: geoReader.size.height)
                    .cornerRadius(barCornerRadius)
                    .animation(.linear)
                
                HStack(alignment: .center) {
                    Text(percentageString + "%")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(percentageLabelColor)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    private func getProgressGradientWidth(progress: CGFloat, totalWidth: CGFloat) -> CGFloat {
        progress * totalWidth / 100
    }
}
