//
//  SceneView.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/26.
//

import SwiftUI

struct SceneView: View {
    @State
    var scaleState = 1.2
    
    var body: some View {
        GeometryReader {
            geo in
            ZStack {
                Image("AzaleaTown")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaleEffect(scaleState)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .background(Color.green)
                Slider(value: $scaleState, in: 1...2) {
                    Text("Text")
                }
            }
        }
    }
}
