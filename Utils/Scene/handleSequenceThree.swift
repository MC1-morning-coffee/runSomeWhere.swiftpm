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
            globalStore.turnOnIsFaceViewActive()
        case 6:
            globalStore.turnOffIsFaceViewActive()
            globalStore.toggleIsFaceViewActive() // false
        case 7:
            print("배가 만들어지는 이벤트 진행")
        case 8:
            globalStore.turnOnIsFaceViewActive()
//        case 14:
////            globalStore.toggleIsFaceViewActive() // false
//        case 16:
////            globalStore.toggleIsFaceViewActive() // true
        case 24:
        globalStore.updateCurrentDetailImage(detailImage: .Treasure)
        globalStore.turnOnIsPopupActive()
        case 25:
        globalStore.turnOffIsPopupActive()
    default:
        print("sequence one is Ready")
    }
}
