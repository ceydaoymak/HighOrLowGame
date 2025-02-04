//
//  WelcomeScreen.swift
//  High or Low?
//
//  Created by ceyda oymak on 2.02.2025.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenWitdh=geometry.size.width
                let screenHeight=geometry.size.height
                
                VStack(){
                    Spacer()
                    Text("High or Low – Test Your Guessing Skills! 🎯 ").font(.title).multilineTextAlignment(.center).fontWeight(.bold)
                    
                    Image("a")
                        .resizable()
                        .frame(width: screenWitdh/3, height:
                                screenHeight/3)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("I picked a number between 1 and 100... Can you find it in just 7 guesses?").font(.title3)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Spacer()
                    
                    NavigationLink(destination: GameScreen()){
                        Text("Start")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: screenHeight/3, height: screenWitdh/5)
                            .background(Color.brown)
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
            }
        }
        
    }
    
    struct WelcomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeScreen()
        }
    }
}
