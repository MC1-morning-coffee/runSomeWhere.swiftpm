//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import Combine
import SwiftUI

enum EnumScene: Int, CaseIterable {
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

enum EnumDetailImage: CaseIterable {
    case CBL
    case Pouch // 주머니에 열쇠가 들어있다.
    case Keys // 컬러스왑한 열쇠가 6개가 있다.
    case Redkey // 열쇠 중 1개(커피)를 선택한다.
    case Water
    case Door
}

// 이미지를 교체하기 위한 EnumDirection
enum EnumDirection: CaseIterable {
    case Front, Back_1, Back_2, Left, Right
}

class GlobalStore: ObservableObject {
    /**
     현재 Scene을 구분하기 위한 enum
     */
    @Published
    var currentScene = EnumScene.opeaning {
        didSet {
//            scriptCount = 0
            print("Scene is Change")
        }
    }
    /**
     현재 스크립트를 말하는 대상을 구분하기 위한 enum
     */
    @Published
    var currentSpeaker = EnumSpeaker.system
    /**
     현재 스크립트를 말하는 대상들을 알기 위한 enum 배열
     */
    @Published
    var currentFaces: [EnumSpeaker] = [EnumSpeaker.system]
    /**
     현재 디테일 이미지의 값을 변경하기 위한 변수
     */
    @Published
    var currentDetailImage: EnumDetailImage = .Pouch
    /**
    FaceView가 보여지는 상태인지 알기 위한 변수
     */
    @Published
    var isFaceViewActive = false
    /**
     현재 오브젝트의 디테일 이미지를 보여주는 팝업뷰가  열려있는지 확인하기 위한 변수
     */
    @Published
    var isPopupActive = false
    /**
     SelectCharcterView를 토글하기 위한 값
     */
    @Published
    var isSelectCharcterViewActive = false
    /**
     씬 별로 스크립트 진행도를 표현하기 위한 변수
     */
    @Published
    var scriptCount = 0 {
        didSet {
            print("scriptCount: ", scriptCount)
            currentFaces = currentScripts[scriptCount].0
        }
    }
    /**
     이벤트 중일 때 클릭해서 씬 넘어감 방지
     */
    @Published
    var isTapAble = true
    /**
     현재 씬
     */
    @Published
    var currentScripts = ALL_SCRIPTS[0]
    
    /**
     SafeArea의 값을 들고 있는 변수
     */
    @Published
    var safeAreaSize: SafeAreaSize = (0, 0) {
        didSet {
            print("safeArea top: ", safeAreaSize.0)
            print("safeArea btm: ", safeAreaSize.1)
        }
    }
    
    @Published
    var isQuizSequence = false
    
    
    func resetUI() {
        turnOffIsPopupActive()
        turnOffIsFaceViewActive()
        turnOnIsTapAble()
    }
    
    init() {
        print("globalStore is ready")
    }
}

protocol ObservableStore: ObservableObject {}

// currentSpeaker
extension GlobalStore: ObservableStore {
    
    func updateCurrentSpeaker(speaker: EnumSpeaker){
        currentSpeaker = speaker
    }
    
    func resetCurrentSpeaker(){
        currentSpeaker = EnumSpeaker.system
    }
}

// currentScene
extension GlobalStore {
    func updateCurrentScene (scene: EnumScene){
        currentScene = scene
        updateCurrnetScripts(sceneCount: scene.rawValue)
    }
}

// currentFaces
extension GlobalStore {
    func updateCurrentFaces(faces: [EnumSpeaker]) {
        currentFaces = faces
    }
}

// isFaceViewActive
extension GlobalStore {
    func toggleIsFaceViewActive() {
        isFaceViewActive.toggle()
    }
    
    func turnOnIsFaceViewActive() {
        isFaceViewActive = true
    }
    
    func turnOffIsFaceViewActive() {
        isFaceViewActive = false
    }
}

// isPopupActive
extension GlobalStore {
    func toggleIsPopupActive() {
        isPopupActive.toggle()
    }
    
    func turnOnIsPopupActive() {
        isPopupActive = true
    }
    
    func turnOffIsPopupActive() {
        isPopupActive = false
    }
}

// scriptCount
extension GlobalStore {
    func addScriptCount() {
        scriptCount += 1
    }
    
    func resetScriptCount() {
        scriptCount = 0
    }
}

extension GlobalStore {
    func updateCurrnetScripts(sceneCount: Int) {
        currentScripts = ALL_SCRIPTS[sceneCount]
    }
}

// safeAreaSize
extension GlobalStore {
    func updateSafeAreaSize(currentSafeAreaSize: SafeAreaSize) {
        safeAreaSize = currentSafeAreaSize
    }
}

// currentDetailImage
extension GlobalStore {
    func updateCurrentDetailImage(detailImage: EnumDetailImage) {
        currentDetailImage = detailImage
    }
}

// isSelectCharcterViewActive
extension GlobalStore {
    func toggleIsSelectCharcterViewActive() {
        isSelectCharcterViewActive.toggle()
    }
    
    func turnOnIsSelectCharcterViewActive() {
        isSelectCharcterViewActive = true
    }
    
    func turnOffIsSelectCharcterViewActive() {
        isSelectCharcterViewActive = false
    }
}

// isTapAble
extension GlobalStore {
    func toggleIsTapAble() {
        isTapAble.toggle()
    }
    
    func turnOnIsTapAble() {
        isTapAble = true
    }
    
    func turnOffIsTapAble() {
        isTapAble = false
    }
}

// isQuizSequence
extension GlobalStore {
    func toggleIsQuizSequence() {
        isQuizSequence.toggle()
    }
    
    func turnOnIsQuizSequence() {
        isQuizSequence = true
    }
    
    func turnOffIsQuizSequence() {
        isQuizSequence = false
    }
}
