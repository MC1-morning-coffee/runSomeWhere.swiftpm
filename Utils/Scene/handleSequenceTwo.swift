//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import Foundation

func handleSequenceTwo(globalStore: GlobalStore){
    // write here your logic!
    let scriptCount = globalStore.scriptCount
    switch scriptCount {
        case 0:
            globalStore.resetUI()
            globalStore.toggleIsFaceViewActive() // false
            globalStore.updateCurrentDetailImage(detailImage: .Door)
            globalStore.toggleIsPopupActive() // true
//        ...
    default:
        print("sequence one is Ready")
    }
}
