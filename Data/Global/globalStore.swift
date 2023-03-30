//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import Combine
import SwiftUI

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

enum EnumDetailImage: CaseIterable {
    case joljol
    case autodoor
    case key1 // 주머니에 열쇠가 들어있다.
    case key2 // 컬러스왑한 열쇠가 6개가 있다.
    case key3 // 열쇠 중 1개(커피)를 선택한다.
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
            scriptCount = 0
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
    var currentFaces: [EnumSpeaker] = [EnumSpeaker.coffee]
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
    @Published
    /**
     씬 별로 스크립트 진행도를 표현하기 위한 변수
     */
    var scriptCount = 0
    
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
}

// isPopupActive
extension GlobalStore {
    func toggleIsPopupActive() {
        isPopupActive.toggle()
    }
}

// scriptCount
extension GlobalStore {
    func addScriptCount() {
        scriptCount += 1
    }
}

// safeAreaSize
extension GlobalStore {
    func updateSafeAreaSize(currentSafeAreaSize: SafeAreaSize) {
        safeAreaSize = currentSafeAreaSize
    }
}
