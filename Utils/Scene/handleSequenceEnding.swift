//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import Foundation

func handleSequenceEnding(globalStore: GlobalStore){
    // write here your logic!
    let scriptCount = globalStore.scriptCount
    switch scriptCount {
        case 0:
            globalStore.resetUI()
        case 1:
            globalStore.toggleIsFaceViewActive() // false
        case 2:
            print("보물상자 디테일 팝업 뷰")
        case 3:
            print("MC2 쪽지")
        case 4:
            print("Fade away")
    default:
        print("sequence one is Ready")
    }
}
