//
//  StacksArrangeViews.swift
//  GuessTheFlag
//
//  Created by Brandon Johns on 7/7/23.
//

//VStack
//      10 children max
//      default center align

//HStack
//      Horizontal
//      align center of avaible space

//Spacer() automatically divides the avaible space

//ZStack
//      overlaps 
import SwiftUI

struct StacksArrangeViews: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("First")
            Text("Second")
            Text("Third")
            Spacer()
        }
    }
}

struct StacksArrangeViews_Previews: PreviewProvider {
    static var previews: some View {
        StacksArrangeViews()
    }
}
