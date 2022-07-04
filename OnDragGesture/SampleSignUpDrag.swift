//
//  Drag.swift
//  OnDragGesture
//
//  Created by Skorobogatow, Christian on 4/7/22.
//

import SwiftUI

struct SampleSignUpDrag: View {
    
    @State var startingOffSetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffetY: CGFloat = 0
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            
            SignUpView()
                .offset(y: startingOffSetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffetY)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded{ value in
                            
                            if currentDragOffsetY < -150 {
                                endingOffetY = -startingOffSetY
                            } else if endingOffetY != 0 &&  currentDragOffsetY > 150 {
                                endingOffetY = 0
                            }
                            currentDragOffsetY = 0
                        }
                )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SampleSignUpDrag_Previews: PreviewProvider {
    static var previews: some View {
        SampleSignUpDrag()
    }
}

struct SignUpView: View {
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100,
                       height: 100)
            
            Text("Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text!")
                .multilineTextAlignment(.center)
            
            Text("CREATE ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
    }
}
