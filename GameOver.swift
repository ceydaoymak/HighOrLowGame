//
//  GameOver.swift
//  High or Low?
//
//  Created by ceyda oymak on 3.02.2025.
//

import SwiftUI

struct GameOver: View {
    var body: some View {
        NavigationStack{
            VStack{
                GeometryReader { geometry in
                    let screenWitdh=geometry.size.width
                    let screenHeight=geometry.size.height
                    VStack{
                        
                        Image("c")
                            .resizable()
                            .frame(width: screenWitdh/1.5, height:
                                    screenHeight/2)
                            .padding(.top,50)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("Game Over!").padding(.top,50).fontWeight(.bold).font(.title2)
                    }
                    
                    
                    NavigationLink(destination: GameScreen()){
                        Text("Try Again")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: screenHeight/3, height: screenWitdh/5)
                            .background(Color.brown)
                    }
                }
            }
        }
    }

    struct GameOver_Previews: PreviewProvider {
        static var previews: some View {
            GameOver()
        }
    }
}
