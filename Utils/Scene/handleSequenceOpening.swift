//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import Foundation

func handleSequenceOpening(globalStore: GlobalStore){
    let scriptCount = globalStore.scriptCount
    switch scriptCount {
        case 7:
            globalStore.updateCurrentDetailImage(detailImage: .CBL)
            globalStore.turnOnIsPopupActive()
        case 8:
            globalStore.updateCurrentDetailImage(detailImage: .Pouch)
        case 9:
            globalStore.updateCurrentDetailImage(detailImage: .Keys)
            globalStore.turnOffIsTapAble()
            globalStore.turnOnIsSelectCharcterViewActive()
        // case 10: 사용자가 버튼 클릭으로 상태 변경
    default:
        print("openingEvent is Ready")
    }
}

func handleSequenceSelectCharcter(globalStore: GlobalStore) {
    globalStore.turnOffIsSelectCharcterViewActive()
    globalStore.turnOffIsPopupActive() // false
    globalStore.addScriptCount()
    globalStore.turnOnIsTapAble()
}
