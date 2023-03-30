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
        case 2:
            globalStore.updateCurrentDetailImage(detailImage: .Water)
            globalStore.toggleIsPopupActive() // true
        case 3:
            globalStore.toggleIsFaceViewActive()
        case 4:
            globalStore.toggleIsPopupActive() // false
        case 6:
            globalStore.toggleIsFaceViewActive() // false
        case 7:
            globalStore.toggleIsFaceViewActive() // true
    default:
        print("sequence one is Ready")
    }
}
