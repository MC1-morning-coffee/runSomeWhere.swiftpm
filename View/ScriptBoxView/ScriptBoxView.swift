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
    
    @State
    var value = ""
    
    @State
    var tmpText: String = ""
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            tmpText = ""
        }
        if position < value.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                tmpText.append(value[position])
                typeWriter(at: position + 1)
            }
        }
    }
            
    private let SCRIPT_BOX_VIEW_BACKGROUND_IMAGE = "Background_Text"
    
    private func updateCurrentSequence() {
        if value.count > tmpText.count {
            return
        }
        if !globalStore.isTapAble{
            return
        }
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
        handleSceneEvent(globalStore: globalStore)
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
            let offset = CGFloat(16)
            
            // Background Image
            Image(SCRIPT_BOX_VIEW_BACKGROUND_IMAGE)
                .zIndex(-1)
                .offset(y: offset)
            // Cursor Pointer
            CursorView()
                .frame(width: CURSOR_SIZE, height: CURSOR_SIZE)
                .offset(x: width - CURSOR_SIZE - offset , y: SCRIPT_BOX_HEIGHT - CURSOR_SIZE)
            VStack(alignment: .leading) {
                    HStack(spacing: 0){
                        VStack(alignment: .leading, spacing: 0){
                            CustomText(value: "\(tmpText)")
                        }
                        .padding(24)
                        Spacer()
                    }
                    .offset(y: 20)
            }
            .zIndex(10)
        }
        .padding(16)
        .frame(width: width, height: SCRIPT_BOX_HEIGHT)
        .background(CustomColor.scriptBox)
        .onTapGesture {
            updateCurrentSequence()
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            value = globalStore.currentScripts[currentCount].1
            typeWriter()
        })
    }
}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
