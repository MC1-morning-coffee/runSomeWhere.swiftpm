//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import Combine

enum EnumScene: CaseIterable {
    case opeaning
    case sequence1
    case sequence2
    case sequence3
    case ending
}

enum EnumSpeaker: CaseIterable {
    case system
    case unknown
    case gomisac
    case coffee
    case walker
    case luna
    case henry
    case muho
    case olive
    case joljol
    case autodoor
}


enum EnumDirection: CaseIterable {
    case left, right, back, front
}

class GlobalStore: ObservableObject {
    /**
     현재 Scene을 구분하기 위한 enum
     */
    @Published
    var currentScene = EnumScene.opeaning

    /**
     현재 스크립트를 말하는 대상을 구분하기 위한 enum
     */
    @Published
    var currentSpeaker = EnumSpeaker.system
    
    @Published
    var isPopupActive = false

    @Published
    var scriptCount = 0
    
    init() {
        print("globalStore is ready")
    }
    
    func updateCurrentScene (scene: EnumScene){
        currentScene = scene
    }
}

protocol ObservableStore: ObservableObject {}

extension GlobalStore: ObservableStore {

    func updateCurrentSpeaker(speaker: EnumSpeaker){
        currentSpeaker = speaker
    }
    
    func resetCurrentSpeaker(){
        currentSpeaker = EnumSpeaker.system
    }
}
