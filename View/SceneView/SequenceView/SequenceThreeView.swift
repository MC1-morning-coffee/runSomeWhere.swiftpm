//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct SequenceThreeView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
        
    @State
    var isPaddleBtnActive = false
    
    /**
     sample
     */
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
            case 19:
                isPaddleBtnActive = true
            case 20:
                isPaddleBtnActive = false
            default:
                print("scriptCount", scriptCount)
        }
    }
    var body: some View {
        ZStack(alignment: .topLeading){
            Text("globalStore.scriptCount: \(globalStore.scriptCount)")
            if isPaddleBtnActive {
                PaddleButtonView()
            }
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
        })
    }
}

/*시퀀스 쓰리
 6명이 나와서 걷는다(12걸음 뒤 자동 멈춤)
 도면이미지 나타난다.
 나무와 천 이미지 나타난다.
 도면/나무/천이 위치 이동하여 합쳐진다.
 보트 이미지 나타난다.
 6명이 보트에 탄다.
 마방진이 나타난다.
 패들버튼이 나타난다.
 보트/패들버튼 사라진다.
 6명이 이동한다.
 곰이작 나타난다.
 곰이작 상태변경(밝아진다.)
 보물상자 나타난다.
 */
