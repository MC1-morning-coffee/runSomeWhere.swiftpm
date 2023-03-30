//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import Foundation

func handleSequenceThree(globalStore: GlobalStore){
    // write here your logic!
    let scriptCount = globalStore.scriptCount
    switch scriptCount {
        /**
         TODO: 스크립트에 맞춰서 변경하기
         */
        case 0:
            globalStore.resetUI()
            globalStore.toggleIsFaceViewActive() // true
        case 6:
            globalStore.toggleIsFaceViewActive() // false
        case 7:
            print("배가 만들어지는 이벤트 진행")
        case 8:
            globalStore.toggleIsFaceViewActive() // true
        case 14:
            globalStore.toggleIsFaceViewActive() // false
        case 16:
            globalStore.toggleIsFaceViewActive() // true
//        ...
    default:
        print("sequence one is Ready")
    }
}
