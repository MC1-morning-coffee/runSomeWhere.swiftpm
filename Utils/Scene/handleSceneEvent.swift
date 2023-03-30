//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import Foundation

func checkCurrnetScene(globalStore: GlobalStore){
    let scene = globalStore.currentScene
    switch scene {
    case .opeaning:
        handleSequenceOpening(globalStore: globalStore)
    case .sequence1:
        handleSequenceOne(globalStore: globalStore)
    case .sequence2:
        handleSequenceTwo(globalStore: globalStore)
    case .sequence3:
        handleSequenceThree(globalStore: globalStore)
    case .ending:
        handleSequenceEnding(globalStore: globalStore)
    }
}

/**
`globalStore.scriptCount`가 변할 때마다 발생하는 이벤트를 처리하기 위한 함수
 */
func handleSceneEvent(globalStore: GlobalStore) {
    checkCurrnetScene(globalStore: globalStore)
}
