//
//  ContentView.swift
//  ProgressBar
//
//  Created by David Ali on 02/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var percentage = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            CircularBarView(percentage: percentage)
                .frame(width: 150, height: 150)
            Spacer()
            
            ProgressBarControls(progressPercentage: $percentage)
        }
    }
}

struct ProgressBarControls: View {
    @Binding var progressPercentage: Double
    
    var body: some View {
        VStack {
            Text("Tap to increase or reduce progress")
                .font(.callout)
            
            HStack {
                //Reduce progress
                Button(action: {
                    guard progressPercentage > 0 else { return }
                    progressPercentage -= 10
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 40)
                    }
                }
                //Add progress
                Button(action: {
                    guard progressPercentage < 100 else { return }
                    progressPercentage += 10
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }
        .padding(.vertical, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
