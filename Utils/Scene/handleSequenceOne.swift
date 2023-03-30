//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import Foundation

func handleSequenceOne(globalStore: GlobalStore){
    // write here your logic!
    let scriptCount = globalStore.scriptCount
    switch scriptCount {
        case 3:
            globalStore.updateCurrentDetailImage(detailImage: .Water)
            globalStore.turnOnIsPopupActive()
        case 4:
            globalStore.turnOnIsFaceViewActive()
        case 5:
            globalStore.turnOffIsPopupActive()
        case 6:
            globalStore.turnOffIsFaceViewActive()
            globalStore.turnOnIsQuizSequence()
            globalStore.turnOffIsTapAble()
        // case 7: handleSequenceQuizOne() 실행될 것
    default:
        print("sequence one is Ready")
    }
}

func handleSequenceQuizOne(globalStore: GlobalStore) {
    globalStore.turnOnIsTapAble()
    globalStore.turnOffIsQuizSequence()
    globalStore.turnOnIsFaceViewActive()
    setTimeoutClosure(timeCount: 400) {
        globalStore.addScriptCount()
    }
}
