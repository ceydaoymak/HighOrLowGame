//
//  Winner.swift
//  High or Low?
//
//  Created by ceyda oymak on 3.02.2025.
//

import SwiftUI

struct Winner: View {
    var body: some View {
        GeometryReader { geometry in
            let screenWitdh=geometry.size.width
            let screenHeight=geometry.size.height
            VStack{
                
                Image("B")
                    .resizable()
                    .frame(width: screenWitdh/2, height:
                            screenHeight/2)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Congratulations!").padding(.top,50).fontWeight(.bold).font(.title2)
                
                NavigationLink(destination: GameScreen()){
                    Text("New Game")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: screenHeight/3, height: screenWitdh/5)
                        .background(Color.brown)
                        .padding()

                }
            }
        }
    }
}

struct Winner_Previews: PreviewProvider {
    static var previews: some View {
        Winner()
    }
}
