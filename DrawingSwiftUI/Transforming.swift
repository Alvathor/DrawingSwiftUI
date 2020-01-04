//
//  Transforming.swift
//  DrawingSwiftUI
//
//  Created by Juliano Goncalves Alvarenga on 03/01/20.
//  Copyright © 2020 Ciclic. All rights reserved.
//

import SwiftUI

struct Flower: Shape {
    var petalOffset: Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            let rotation = CGAffineTransform.init(rotationAngle: number)
            let position = rotation.concatenating(
                CGAffineTransform.init(
                    translationX: rect.width / 2, y: rect.height / 2
                )
            )
            let originalPetal = Path(
                ellipseIn: .init(
                    x: CGFloat(petalOffset),
                    y: 0, width: CGFloat(petalWidth),
                    height: rect.width / 2
                )
            )
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct Transforming: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(Color.red, style: FillStyle(eoFill: true, antialiased: true))
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct Transforming_Previews: PreviewProvider {
    static var previews: some View {
        Transforming()
    }
}
