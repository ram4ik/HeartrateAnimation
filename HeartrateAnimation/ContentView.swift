//
//  ContentView.swift
//  HeartrateAnimation
//
//  Created by ramil on 05.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showRate = false
    @State private var heartBeat = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            Text("Heartrate Animation")
                .foregroundColor(.white)
                .font(.title)
                .offset(y: -300)
            
            Group {
                Rectangle()
                    .frame(width: 50, height: 5)
                    .offset(x: -53, y: 3)
                Rectangle()
                    .frame(width: 20, height: 5)
                    .rotationEffect(.degrees(45))
                    .offset(x: -22, y: 10)
                Rectangle()
                    .frame(width: 50, height: 5)
                    .rotationEffect(.degrees(-45))
                    .offset(x: 0)
                Rectangle()
                    .frame(width: 20, height: 5)
                    .rotationEffect(.degrees(45))
                    .offset(x: 22, y: -10)
                Rectangle()
                    .frame(width: 50, height: 5)
                    .offset(x: 53, y: -3)
            }
            .foregroundColor(.white)
            .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10)
                        .speed(1.3)
                        .repeatForever(autoreverses: true)
                        .delay(0.2))
            .onAppear() {
                showRate.toggle()
            }
            
            Rectangle()
                .frame(width: 200, height: 200)
                .background(Color(.black))
                .offset(x: showRate ? 0 : 200)
                .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10)
                            .speed(1.3)
                            .repeatForever(autoreverses: true)
                            .delay(0.2))
            
            Image(systemName: "heart")
                .font(.system(size: 150))
                .foregroundColor(.red)
                .scaleEffect(heartBeat ? 1 : 1.3)
                .animation(Animation.interpolatingSpring(stiffness: 30, damping: 10)
                            .speed(1.3/2)
                            .repeatForever(autoreverses: false))
                .onAppear() {
                    heartBeat.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
