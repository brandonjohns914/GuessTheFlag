//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Brandon Johns on 6/9/23.
//

import SwiftUI


    struct FlagImage: View
    {
        let name: String
        
        var body: some View
        {
            Image(name)
                .renderingMode(.original)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 20)
                
        }
    }


struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(name: "US")
    }
}
