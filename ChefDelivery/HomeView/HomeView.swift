//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Rafael Lima on 19/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimatind: Bool = false
    @State private var imageOffset : CGSize = .zero
    @State private var buttonOffset : CGFloat = .zero
    @State private var showSecondScreen = false
    let buttonHeight: CGFloat = 80
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle().foregroundStyle(Color("ColorRed"))
                    .frame(width: isAnimatind ? 200 : 0)
                    .position(
                        x: isAnimatind ? 50: -50,
                        y: isAnimatind ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimatind ? 0.5 : 0)
                
                Circle().foregroundStyle(Color("ColorRedDark"))
                    .frame(width: isAnimatind ? 200 : 0)
                    .position(
                        x: isAnimatind ? geometry.size.width - 50 : geometry.size.width + 50,
                        y: isAnimatind ? geometry.size.height - 50 : geometry.size.height + 50)
                    .blur(radius: 60)
                    .opacity(isAnimatind ? 0.5 : 0)
                
                VStack {
                    Text("Chef Delivery")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("ColorRed"))
                        .opacity(isAnimatind ? 1 : 0)
                        .offset(y: isAnimatind ? 0 : -40)
                    
                    Text("Peça as suas comidas do conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .opacity(isAnimatind ? 1 : 0)
                        .offset(y: isAnimatind ? 0 : -40)
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimatind ? 32 : 92)
                        .opacity(isAnimatind ? 1 : 0)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    withAnimation(.easeOut(duration: 0.5)) {
                                        imageOffset = gesture.translation
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.5)) {
                                        imageOffset = .zero
                                    }
                                })
                        )
                    
                    ZStack {
                        Capsule().fill(Color("ColorRed").opacity(0.2))
                        Capsule().fill(Color("ColorRed").opacity(0.2))
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("ColorRedDark"))
                            .offset(x: 20)
                        
                        HStack {
                            Capsule().fill(Color("ColorRed"))
                                .frame(width: buttonOffset + buttonHeight)
                            
                            Spacer()
                        }
                        
                        HStack {
                            ZStack {
                                Circle().fill(Color("ColorRed"))
                                Circle().fill(Color("ColorRed")).padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                                
                            }
                            Spacer()
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= (geometry.size.width - 60) - buttonHeight {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffset = gesture.translation.width
                                        }
                                    }
                                })
                                .onEnded({ _ in
                                    if buttonOffset > (geometry.size.width - 60) / 2 {
                                        showSecondScreen = true
                                    } else {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            buttonOffset = .zero
                                        }
                                    }
                                })
                        )
                        
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimatind ? 1 : 0)
                    .offset(y: isAnimatind ? 0 : -100)
                }
            }
        }.onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                isAnimatind = true
            }
        }.fullScreenCover(isPresented: $showSecondScreen) {
            ContentView()
        }
    }
}

#Preview {
    HomeView()
}
