//
//  ScriptBoxView.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/26.
//

import SwiftUI


/**
 필요한 기능
1. 탭 클릭 시 스크립트가 변경된다.
2. 스크립트가 타이핑효과로 나타난다.
3. 스크립트가 다 나타나면 커서가 깜빡이며 탭 클릭이 가능하다.
 */
struct ScriptBoxView: View {
    @State private var isFlickering = false
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @State
    var currentSceneCount: Int = 0
    
    var script: Script
    var width: CGFloat
    
    private let SCRIPT_BOX_VIEW_BACKGROUND_IMAGE = "Background_Text"
    
    private func updateCurrentSequence() {
        
        if globalStore.scriptCount == globalStore.currentScripts.count - 1 {
            currentSceneCount += 1
            if currentSceneCount > 4 {
                return
            }
            globalStore.updateCurrentScene(scene: .allCases[currentSceneCount])
            globalStore.resetScriptCount()
        }else{
            globalStore.scriptCount += 1
        }
//        globalStore.updateCurrentFaces(faces: script.0)
        print(script.0)
        print(script.1)
        updateFaces()
    }
        
    private func updateFaces() {
        if globalStore.currentScene == .sequence1 {
            // 커피 등장
//            if globalStore.scriptCount == 2 {
//                globalStore.toggleIsFaceViewActive() // true
//            }else if globalStore.scriptCount == 5 {
//                globalStore.toggleIsFaceViewActive() // false
//            // 무호 등장
//            }else if globalStore.scriptCount == 6 {
//                globalStore.toggleIsFaceViewActive() // true
//            }else if globalStore.scriptCount == 7 {
//                globalStore.toggleIsFaceViewActive()
//            }
//        }
//        if globalStore.currentScene == .sequence2 {
//            if globalStore.scriptCount == 0 {
//                globalStore.toggleIsFaceViewActive()
//            }
        }
    }
    
    // Speaker
    private func setSpeaker()->String {
        // 둘이상이면?
        var _speaker = "\(script.0[0])"
        
        if script.0.count > 1 {
            _speaker = "\(script.0[0]), \(script.0[1])"
        }
        
        return _speaker
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(SCRIPT_BOX_VIEW_BACKGROUND_IMAGE)
                .zIndex(-1)
                .offset(y: 16)
            VStack(alignment: .leading) {
                HStack(spacing: 0){
                    VStack(alignment: .leading, spacing: 0){
                        // speaker
//                        if script.0[0] != .unknown {
//                            CustomText(value: setSpeaker(),
//                                       fontSize: 24)
//                                .padding(.bottom, 4)
//                        }
                        CustomText(value: "\(script.1)")
                        Image("Image_Button").opacity(isFlickering ? 0.01 : 1.0).animation(Animation.easeOut(duration: 0.3).repeatForever(autoreverses: true)).onAppear() {
                            isFlickering = true
                    }
                    .padding(24)
                    Spacer()
                }
                .offset(y: 20)
                Spacer()
            }
            .zIndex(10)
            Spacer()
        }
        .padding(16)
        .frame(width: width, height: SCRIPT_BOX_HEIGHT)
        .onTapGesture {
            updateCurrentSequence()
        }
    }
}

