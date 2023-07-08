//
//  AlertMessages.swift
//  GuessTheFlag
//
//  Created by Brandon Johns on 7/7/23.
//

import SwiftUI

struct AlertMessages: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important Message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please read this")
        }
    }
}

struct AlertMessages_Previews: PreviewProvider {
    static var previews: some View {
        AlertMessages()
    }
}
