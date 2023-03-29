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
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @State
    var currentSceneCount: Int = 0
    
    var script: Script
    var width: CGFloat
    
    private let SCRIPT_BOX_VIEW_BACKGROUND_IMAGE = "Background_Text"
    
    private func updateCurrentSequence() {
        if globalStore.scriptCount > globalStore.currentScripts.count - 2 {
            currentSceneCount += 1
            if currentSceneCount > 4 {
                return
            }
            globalStore.updateCurrentScene(scene: .allCases[currentSceneCount])
        }else{
            globalStore.scriptCount += 1
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
        .background(Color(CustomColor.scriptBox))
        .onTapGesture {
            updateCurrentSequence()
        }
    }
}

