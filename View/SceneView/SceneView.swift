//
//  SceneView.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/26.
//

import SwiftUI

/**
 Sequence가 쌓이느 ContainerView
 */
struct SceneView: View {
        
    @EnvironmentObject
    var globalStore: GlobalStore
    
    
    var body: some View {
        GeometryReader {
            geo in
            ZStack {
                if globalStore.currentScene == .opeaning {
                    SceneOpeningView()
                        .onAppear{
                            print(globalStore.currentSpeaker)
                        }
                }
            }
        }
    }
}
