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
//        var speaker = findSpeaker(scriptCount: scriptCount, scripts: scripts)
//        var script = findScript(scriptCount: scriptCount, scripts: scripts)
        
        ZStack {
            VStack(alignment: .leading) {
                HStack(spacing: 0){
                    VStack(alignment: .leading, spacing: 0){
                        CustomText(value: "\(coffee)", fontSize: 24)
                            .padding(.bottom, 4)
                        CustomText(value: "\(SEQUENCE_ONE_SCRIPTS)")
//                        CustomText(value: "\(speaker)", fontSize: 24)
//                            .padding(.bottom, 4)
//                        CustomText(value: "\(script)")
                        Image("Image_Button").opacity(isFlickering ? 0.01 : 1.0).animation(Animation.easeOut(duration: 0.3).repeatForever(autoreverses: true)).onAppear() {
                            isFlickering = true
                        }
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
        .frame(width: width, height: SCRIPT_BOX_HEIGHT)
        .border(.red, width: 1)
        .background(CustomColor.scriptBoxColor)
        .onTapGesture {
            //updateCurrentSequence()
            scriptCount += 1
            print(scriptCount)
        }
    }
}

