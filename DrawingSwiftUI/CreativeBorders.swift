//
//  CreativeBorders.swift
//  DrawingSwiftUI
//
//  Created by Juliano Goncalves Alvarenga on 03/01/20.
//  Copyright © 2020 Ciclic. All rights reserved.
//

import SwiftUI

struct CreativeBorders: View {
    var body: some View {
        Capsule()
        .strokeBorder(
            ImagePaint(
                image: Image("apollo1"),
                scale: 0.1
            ),
            lineWidth: 40
        )
        .frame(width: 300, height: 200)
    }
}

struct CreativeBorders_Previews: PreviewProvider {
    static var previews: some View {
        CreativeBorders()
    }
}
