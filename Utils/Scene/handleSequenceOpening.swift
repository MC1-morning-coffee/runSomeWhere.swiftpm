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
        case 1:
            globalStore.toggleIsFaceViewActive()
        case 7:
        globalStore.updateCurrentDetailImage(detailImage: .CBL)
            globalStore.toggleIsPopupActive()
        case 8:
            globalStore.updateCurrentDetailImage(detailImage: .Pouch)
//            globalStore.toggleIsPopupActive()
        case 9:
            globalStore.updateCurrentDetailImage(detailImage: .Keys)
            globalStore.toggleIsSelectCharcterViewActive()
    default:
        print("openingEvent is Ready")
    }
}
