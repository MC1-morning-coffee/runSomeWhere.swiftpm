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
    
    private func delayText() {
        setTimeoutClosure(timeCount: 3) {
            globalStore.isPopupActive = true
        }
    }
    
    var body: some View {
        GeometryReader {
            geo in
            
            let deviceWidth = geo.size.width
            let deviceHeight = geo.size.height
            

            
            ZStack(alignment:.leading) {
                if globalStore.currentScene == .opeaning {
                    SequenceOpeningView()
                        .onAppear{
                            print(globalStore.currentSpeaker)
                            delayText()
                    }
                }else if globalStore.currentScene == .sequence1 {
                    SequenceOneView()
                }
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let windows = windowScene.windows {
                    let safeAreaBtm =  windows.first?.safeAreaInsets.bottom ?? 0
                    FaceView()
                        .border(.red)
                        .offset(x: deviceWidth - 150  ,y: deviceHeight - 212 - 200 + safeAreaBtm
                        )
                        .onAppear{
                            print(deviceHeight)
                            print(deviceWidth)
                            print(geo.safeAreaInsets.bottom)
                            print(geo.safeAreaInsets.top)
                            print(geo.safeAreaInsets.leading)
                            print(geo.safeAreaInsets.trailing)
                            print(safeAreaBtm)
                    }
                }
                if globalStore.isPopupActive {
                    DetailPopupView()
                        .border(.red)
                        .position(x: deviceWidth / 2, y: deviceHeight / 2)
                        .transition(.asymmetric(insertion: .opacity.animation(.linear(duration: 2)), removal: .opacity.animation(.linear(duration: 2))))
                }
            }
            .frame(width: deviceWidth, height: deviceHeight)
            .background(Color.brown)
        }
    }
}
