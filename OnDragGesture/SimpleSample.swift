//
//  SimpleSample.swift
//  OnDragGesture
//
//  Created by Skorobogatow, Christian on 4/7/22.
//

import SwiftUI

struct SimpleSample: View {
    @State var offset: CGSize = .zero
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 100,
                   height: 100)
            .offset(offset)
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

struct SimpleSample_Previews: PreviewProvider {
    static var previews: some View {
        SimpleSample()
    }
}
