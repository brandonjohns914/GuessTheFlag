//
//  Gradients.swift
//  GuessTheFlag
//
//  Created by Brandon Johns on 7/7/23.
//


// gradients
//          3 types
//          own view
import SwiftUI

struct Gradients: View {
    var body: some View {
        //LinearGradient(gradient: Gradient(colors: [.blue, .gray, .black]), startPoint: .top, endPoint: .bottom)
        //LinearGradient(gradient: Gradient(stops: [ Gradient.Stop(color: .blue, location: 0.25), Gradient.Stop(color: .gray, location: 0.50), Gradient.Stop(color: .black, location: 0.75)]), startPoint: .top, endPoint: .bottom)
            //.ignoresSafeArea()
        
       RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
            //.ignoresSafeArea()
        
        //AngularGradient(gradient: Gradient(colors: [.blue, .black, .gray, .blue, .purple, .green]), center: .center)
    }
}

struct Gradients_Previews: PreviewProvider {
    static var previews: some View {
        Gradients()
    }
}



