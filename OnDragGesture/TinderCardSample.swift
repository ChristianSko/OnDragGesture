//
//  ContentView.swift
//  OnDragGesture
//
//  Created by Skorobogatow, Christian on 4/7/22.
//

import SwiftUI

struct TinderCardSample: View {
    
    @State var offset: CGSize = .zero

    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                Text("\(getScaleAmount())")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300,
                       height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded{ value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
            )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let maxWidth = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width) // ensure we got always the postive absolute value
        let percentage = currentAmount / maxWidth
        
        return 1.0 - min(percentage, 0.5) * 0.5
        
    }
    
    func getRotationAmount() -> Double {
        let maxWidth = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / maxWidth
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        
        return percentageAsDouble * maxAngle
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TinderCardSample()
    }
}
