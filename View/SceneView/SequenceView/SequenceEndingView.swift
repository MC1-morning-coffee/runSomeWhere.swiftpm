//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct SequenceEndingView: View {
    @EnvironmentObject var globalStore: GlobalStore
    
    @State private var word1 = false
    @State private var word2 = false
    @State private var word3 = false
    @State private var word4 = false
    @State private var treasure = false
    @State private var MC2 = false
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
        case 1:
            setTimeoutClosure(timeCount: 1000) {
                globalStore.addScriptCount()
            }
        case 2:
            word1 = true
        case 3:
            word1 = false
            word2 = true
        case 4:
            word2 = false
            treasure = true
        case 5:
            treasure = false
            MC2 = true
        case 6:
            MC2 = false
            word3 = true
        case 7:
            word3 = false
            word4 = true
        default:
            print("scriptCount", scriptCount)
        }
    }
    
    @State
    var currentSceneCount: Int = 0
    
    private func updateCurrentSequence() {
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
    }
    
    var body: some View {
        VStack{
            if word1 {
                VStack{
                    CustomText(value: "\"자 이제 열어볼까?\n어떤 보물이지..? \"", fontSize: 36, color: Color.white)
                }
            }
            
            if word2 {
                VStack{
                    CustomText(value: "\"6개의 열쇠를 꽂아서\n보물상자를 열었다 \"", fontSize: 36, color: Color.white)
                }
            }
            
            if treasure {
                Image("Object_Treasure")
            }
            if MC2 {
                ZStack{
                    Image("Object_Treasure")
                    Image("Object_MC2")
                }
            }
            if word3 {
                VStack{
                    CustomText(value: "\"어어어어!!\n강렬한 빛이 쏟아져나오며\n여섯명이 또다시 사라졌다.\"", fontSize: 36, color: Color.white)
                }
            }
            if word4 {
                CustomText(value: "\"The end\"", fontSize: 36, color: Color.white)
            }
            
        }
        .onTapGesture(perform: {
            print("test current")
            updateCurrentSequence()
        })
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
        }
        )}
}
/*엔딩크레딧 올라간다.
 아마 이미지 처리하는 텍스트가 나온다.
 보물상자 이미지 팝업
 MC2 포스트잇 이미지 팝업*/
