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
//3에 자동문 버튼 사진 나왔다가 4에서 사라져야 함
    // case 3:
//            globalStore.resetUI()
//            globalStore.toggleIsFaceViewActive() // false
//            globalStore.updateCurrentDetailImage(detailImage: .Door)
//            globalStore.toggleIsPopupActive() // true
//        ...
    default:
        print("sequence two is Ready")
    }
}
