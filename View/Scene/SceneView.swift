//
//  SceneView.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/26.
//

import SwiftUI

struct SceneView: View {
    @State var counter = 0.0
    
    @State
    var scaleState = 1.2
    
    @State
    private var timeRemaining = ""
    
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
                    .offset(y: CGFloat(counter))
                Slider(value: $scaleState, in: 1...2) {
                    Text("Text")
                }
            }
        }
//        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
//            counter += 32.5
//        }
    }
}
