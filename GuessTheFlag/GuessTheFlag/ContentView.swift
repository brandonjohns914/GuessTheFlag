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
    @State private var countries = allCountries.shuffled()
    
    static let allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    @State private var score = 0
    @State private var showingResults = false
    @State private var questionCounter = 1
    
    @State private var selectedFlag = -1
   
    
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
                    .title()
            
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
                        
                    }
                    
                    
                label: {
                        FlagImage(name: countries[number])
                        .rotation3DEffect(.degrees(selectedFlag == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(selectedFlag == -1 || selectedFlag == number ? 1 : 0.25)
                        .blur(radius: selectedFlag == -1 || selectedFlag == number ? 0 : 3)
                        .scaleEffect(selectedFlag == -1 || selectedFlag == number ? 1 : 0.75)
                        .animation(.default, value: selectedFlag)
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
        .alert("Game Over!", isPresented: $showingResults)
        {
            Button("Start Again", action:  newGame)
        } message: {
            Text("Your final score was: \(score) ")
        }
    }
    
    func flagTapped(_ number: Int)
    {
        selectedFlag = number
            if number == correctAnswer
            {
                scoreTitle = "CORRECT: \(countries[number])"
                score += 1
            }
            else {
                
                score -= 1
                let needsThe = ["US", "UK"]
                let theirAnswer = countries[number]
                if needsThe.contains(theirAnswer)
                {
                    scoreTitle = "WRONG: that's the flag of the \(theirAnswer)"
                }
                else
                {
                    scoreTitle = "WRONG: that's the flag of  \(theirAnswer)"
                }
                
            }
        
        if questionCounter == 8
        {
            showingResults = true
        }
        else
        {
            showingScore = true
        }
    }
    
    func askQuestion()
    {
        countries.remove(at: correctAnswer)
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCounter += 1
        selectedFlag = -1
    }
    
    func newGame()
    {
        questionCounter = 0
        score = 0
        countries = Self.allCountries
        askQuestion()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleModifier: ViewModifier
{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.primary)
    }
}

extension View
{
    func title() -> some View
    {
        modifier(TitleModifier())
    }
}
