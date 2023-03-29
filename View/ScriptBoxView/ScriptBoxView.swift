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
    

//    var sceneCount: Int
    var scripts: [Script]
    
    @State
    var currentSceneCount: Int = 0
    
    @State
    var scriptCount = 0
    
    var width: CGFloat
    
    func updateCurrentSequence() {
        globalStore.scriptCount += 1
    }
    
    var body: some View {
        var speaker = findSpeaker(scriptCount: scriptCount, scripts: scripts)
        var script = findScript(scriptCount: scriptCount, scripts: scripts)
        
        ZStack {
            VStack(alignment: .leading) {
                HStack(spacing: 0){
                    VStack(alignment: .leading, spacing: 0){
                        CustomText(value: "\(speaker)", fontSize: 24)
                            .padding(.bottom, 4)
                        CustomText(value: "\(script)")
                    }
                    Spacer()
                }
                .border(.red, width: 1)
                Spacer()
            }
            .border(.red, width: 1)
            Spacer()
        }
        .padding(16)
        .frame(width: width, height: 212)
        .border(.red, width: 1)
        .background(CustomColor.scriptBoxColor)
        .onTapGesture {
            updateCurrentSequence()
            print(scriptCount)
        }
    }
}

