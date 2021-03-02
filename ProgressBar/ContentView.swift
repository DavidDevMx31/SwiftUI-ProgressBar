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
            CircularBarView(percentage: percentage)
            Spacer()
            Button(action: {
                guard percentage < 100 else { return }
                percentage += 10
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                        .frame(width: 60, height: 60)
                    Text("Add 10% progress")
                        .font(.body)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
