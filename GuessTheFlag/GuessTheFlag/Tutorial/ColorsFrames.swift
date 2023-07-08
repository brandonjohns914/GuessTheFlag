//
//  ColorsFrames.swift
//  GuessTheFlag
//
//  Created by Brandon Johns on 7/7/23.
//

//.foregroundColor makes it gray in the your content
//.foregroundStyle allows the clothes to come through 

import SwiftUI

struct ColorsFrames: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Your content")
                //.foregroundColor(.secondary)
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
            
        }
        .ignoresSafeArea()
    }
}

struct ColorsFrames_Previews: PreviewProvider {
    static var previews: some View {
        ColorsFrames()
    }
}
