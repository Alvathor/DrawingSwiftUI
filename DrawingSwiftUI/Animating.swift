//
//  Animating.swift
//  DrawingSwiftUI
//
//  Created by Juliano Goncalves Alvarenga on 03/01/20.
//  Copyright © 2020 Ciclic. All rights reserved.
//

import SwiftUI


struct CheckBoard: Shape {
    var rows: Int
    var columns: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
    
    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
}

struct Trapeziod: Shape {
    var insetAMount: CGFloat
    var animatableData: CGFloat {
        get { insetAMount }
        set { self.insetAMount = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: 0, y: rect.maxY))
        path.addLine(to: .init(x: insetAMount, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX - insetAMount, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: 0, y: rect.maxY))
        
        return path
    }
}

struct Animating: View {
    
    @State private var insetAmount: CGFloat = 50
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        
        VStack {
            CheckBoard(rows: rows, columns: columns)
                .onTapGesture {
                    withAnimation(.linear(duration: 3)) {
                        self.rows = 8
                        self.columns = 16
                    }
            }
            Trapeziod(insetAMount: insetAmount)
                .frame(width: 200, height: 100)
                .onTapGesture {
                    withAnimation {
                        self.insetAmount = CGFloat.random(in: 10...90)
                    }
                    
            }
        }
    }
}

struct Animating_Previews: PreviewProvider {
    static var previews: some View {
        Animating()
    }
}
