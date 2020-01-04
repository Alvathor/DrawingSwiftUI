//
//  ContentView.swift
//  DrawingSwiftUI
//
//  Created by Juliano Goncalves Alvarenga on 03/01/20.
//  Copyright © 2020 Ciclic. All rights reserved.
//

import SwiftUI

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path  {
        var path = Path()
        path.addArc(
            center: .init(x: rect.midX, y: rect.midY),
            radius: rect.width / 2 - insetAmount,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        return path
    }
        
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: rect.midX, y: rect.minY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Shapes: View {
    var body: some View {
        
        VStack(spacing: 20) {
            Circle()
                .strokeBorder(Color.red, lineWidth: 40)
                .frame(width: 200, height: 200)
                        
            Arc(startAngle: .degrees(0), endAngle: .degrees(135), clockwise: true)
                .inset(by: 5)
                .stroke(Color.blue, lineWidth: 10)
                .frame(width: 200, height: 200)
                
            
            Triangle()
                .stroke(
                    Color.red,
                    style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
        }
        
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
