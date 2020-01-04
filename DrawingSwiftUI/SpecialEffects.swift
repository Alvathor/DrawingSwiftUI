//
//  SpecialEffects.swift
//  DrawingSwiftUI
//
//  Created by Juliano Goncalves Alvarenga on 03/01/20.
//  Copyright © 2020 Ciclic. All rights reserved.
//

import SwiftUI

struct SpecialEffects: View {
    
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Image("apollo1")
                .resizable()
                .colorMultiply(.red)
                .frame(width: 200, height: 200)
            Image("apollo1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)            
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -100)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -100)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
                        
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffects()
    }
}
