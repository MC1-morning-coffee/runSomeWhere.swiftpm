//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct TestView: View {
        @State private var isMoveActive = false
    var body: some View {
        Image("Object_Magic")
        .position(x: 195, y: 400)
    }
}

    struct TestView_Previews: PreviewProvider {
        static var previews: some View {
            TestView()
        }
    }

