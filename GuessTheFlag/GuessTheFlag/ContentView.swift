//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Brandon Johns on 6/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    @State private var questions = 0
    
    var body: some View
    {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.teal, .blue,  .black,]), startPoint: .top, endPoint: .bottom)
//            RadialGradient(stops: [
//                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
//                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
//            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack
            {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.primary)
            
            VStack(spacing: 15) {
                
                VStack {
                    
                    
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.title2.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.title.weight(.semibold))
                    
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(radius: 20)
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title3.weight(.heavy))
                Spacer()
        }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore)
        {
            Button("Continue", action:  askQuestion)
        } message: {
            Text("Your score: \(score) ")
        }
    }
    
    func flagTapped(_ number: Int)
    {
       
            questions += 1
            if number == correctAnswer
            {
                scoreTitle = "CORRECT: \(countries[number])"
                score += 1
            }
            else {
                scoreTitle = "WRONG: that's \(countries[number]) flag"
                score -= 1
            }
            showingScore = true
            
            
          
        if questions == 8
        {
         scoreTitle = ("Game Over! Your score is \(score)")
            score = 0
            questions = 0
            
        }
       
        
    }
    
    func askQuestion()
    {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
