//
//  GameScreen.swift
//  High or Low?
//
//  Created by ceyda oymak on 2.02.2025.
//

import SwiftUI

struct GameScreen: View {
    @State private var userGuess: String = ""
    @State private var targetNumber: Int = Int.random(in: 1...100)
    @State private var message: String = "Enter a number between 1-100"
    @State private var count: Int = 7
    @State private var gameOver: Bool = false
    @State private var winning: Bool = false
    
    
    var body: some View {
        GeometryReader { geometry in
            let screenWitdh=geometry.size.width
            let screenHeight=geometry.size.height
            
            VStack(spacing: 20){
                
                Text(message)
                    .padding(.top,40)
                    .fontWeight(.bold)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                Text("Attempts left: \(count)" )
                    .italic()
                    .padding(.top,7)
                    .font(.title2)
                
                Image("d")
                    .resizable()
                    .frame(width: screenWitdh/2, height:
                            screenHeight/3)
                    .padding(.top,30)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                TextField("Your Guess", text: $userGuess)
                    .multilineTextAlignment(.center)
                    .padding(.top,50)
                    .frame(width: 400,height: 30)
                Spacer()
                Button("Guess"){
                    checkGuess()
                  
                    
                    
                }
                
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(width: screenHeight/3, height: screenWitdh/5)
                .background(Color.brown)
                .padding(.bottom,60)
                
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
    
    func checkGuess() {
        
        guard let guessedNumber = Int(userGuess) else {
            message = "Please enter a valid number!"
            count -= 1
            userGuess = ""
            return
        }
        
        guard guessedNumber >= 1 && guessedNumber <= 100 else {
                   message = "Enter a number between 1 and 100"
                   count -= 1
                   userGuess = ""
                   return
               }
        
        if guessedNumber == targetNumber {
            message = "🎉 Congratulations! You guessed it!"
            gameOver = true
            winning = true
            
        } else if guessedNumber > targetNumber {
            count -= 1
            message = "⬇️ Lower! Try again."
        } else {
            count -= 1
            message = "⬆️ Higher! Try again."
        }
        
        if count == 0 && guessedNumber != targetNumber {
            message = "❌ Game Over! The number was \(targetNumber)."
            gameOver = true
            winning = false
            
        }
        
        userGuess = ""
        
        if gameOver {
            if winning {
                navigateToWinner()
            }
            else {
                navigateToGameOver()
            }
        }
        
    }
    func navigateToWinner() {
         if let window = UIApplication.shared.windows.first {
             window.rootViewController = UIHostingController(rootView: Winner())
             window.makeKeyAndVisible()
         }
     }

     func navigateToGameOver() {
         if let window = UIApplication.shared.windows.first {
             window.rootViewController = UIHostingController(rootView: GameOver())
             window.makeKeyAndVisible()
         }
     }
    struct GameScreen_Previews: PreviewProvider {
        static var previews: some View {
            GameScreen()
        }
    }
}
