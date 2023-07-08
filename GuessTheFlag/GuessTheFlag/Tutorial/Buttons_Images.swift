//
//  Buttons_Images.swift
//  GuessTheFlag
//
//  Created by Brandon Johns on 7/7/23.
//

// role: .destructive makes the button red

// border prominent one or two if to many nothing stands out

//system image comes from SFsymbols

//image use .renderingMode(.orginal) forces back to the original color 
import SwiftUI

struct Buttons_Images: View {
    var body: some View {
        
        //Button("Delete Selection", role: .destructive, action: executeDelete)
        //        VStack {
        //            Button("Button 1"){
        //            }
        //            .buttonStyle(.bordered)
        //            Button("Button 2", role: .destructive){
        //            }
        //            .buttonStyle(.bordered)
        //            Button("Button 3"){
        //            }
        //            .buttonStyle(.borderedProminent)
        //            .tint(.green)
        //            Button("Button 4", role: .destructive){
        //            }
        //            .buttonStyle(.borderedProminent)
        //        }
        
        Button {
            print("edit mode was typed ")
        } label: {
            Label("Edit", systemImage: "pencil")
        }
    
    }
    
    
    func executeDelete() {
        print("Deleting")
    }
}

struct Buttons_Images_Previews: PreviewProvider {
    static var previews: some View {
        Buttons_Images()
    }
}
