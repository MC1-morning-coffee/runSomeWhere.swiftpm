//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct ShipView: View {
    var body: some View {
        Image("Object_Boat")
            .fixedSize()
            .position(x: 195, y: 300)
    }
}

struct ShipView_Previews: PreviewProvider {
    static var previews: some View {
        ShipView()
    }
}
