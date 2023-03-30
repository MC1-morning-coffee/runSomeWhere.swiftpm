//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/30.
//

import SwiftUI

enum EnumBackgrundImage: CaseIterable {
    case opening
    case sequence1
    case sequence3
    case ending
}

extension EnumBackgrundImage {
    var srcName: String {
        switch self {
        case .opening:
            return "Background_Image1"
        case .sequence1:
            return "Background_Image2"
        case .sequence3:
            return "Background_Image3"
        case .ending:
            return "Background_Ending"
        }
    }
    
    var imgHeight: Int {
        switch self {
        case .opening:
            return 650
        case .sequence1, .sequence3:
            return 2600
        case .ending:
            return 2500
        }
    }
}

struct SceneBackgroundView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @State
    private var isBlurActive = true
    
    @State
    private var isLastSequenceImage = false
    
    @State
    var currentBg: EnumBackgrundImage = .opening {
        didSet {
            currentSceneHeight = currentBg.imgHeight
            currentSceneImage = currentBg.srcName
        }
    }
    
    @State
    private var currentSceneHeight = 0
    
    @State
    private var bgOffsetY = 0
    
    @State
    private var animationDuration = 3.0
    
    @State
    private var currentSceneImage = "" {
        didSet {
            print("currentSceneImage is ", currentSceneImage)
        }
    }
    

    @State
    private var isLastScript = false
    
    func handleCurrentBackground(scriptCount: Int) {
        switch globalStore.currentScene {
        case .opeaning:
            currentBg = .opening
            if scriptCount == 3 {
                isBlurActive = false
            }
            if scriptCount == 12 {
                globalStore.turnOffIsTapAble()
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = true
                }
                setTimeoutClosure(timeCount: 1000) {
                    globalStore.turnOnIsTapAble()
                }
            }
        case .sequence1:
            currentBg = .sequence1
            if scriptCount == 0 {
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = false
                    bgOffsetY = 650
                }
            }
            if scriptCount == 10 {
                globalStore.turnOffIsTapAble()
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = true
                    animationDuration = 0
                }
                setTimeoutClosure(timeCount: 500) {
                    globalStore.turnOffIsFaceViewActive()
                }
                setTimeoutClosure(timeCount: 1000) {
                    
                    globalStore.turnOnIsTapAble()
                }
            }
        case .sequence2:
            if scriptCount == 0 {
                bgOffsetY = bgOffsetY + 650
                globalStore.turnOffIsPopupActive()
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = false
                    animationDuration = 3.0
                }
            }
            
            if scriptCount == 2 {
                globalStore.turnOnIsPopupActive()
            }
            if scriptCount == 11 {
                globalStore.turnOffIsTapAble()
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = true
                }
                setTimeoutClosure(timeCount: 1000) {
                    globalStore.turnOnIsTapAble()
                }
            }
            
        case .sequence3:
            currentBg = .sequence3
            if scriptCount == 0 {
                bgOffsetY = 0
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = false
                }
            }
            if scriptCount == 9 {
                bgOffsetY = bgOffsetY + 350
            }
            
            if scriptCount == 19 {
                globalStore.turnOffIsTapAble()
            }
            if scriptCount == 21 {
                    globalStore.turnOnIsTapAble()
                    bgOffsetY = bgOffsetY + 300
            }
            if scriptCount == 25 {
                setTimeoutClosure(timeCount: 2000) {
                    isBlurActive = true
                    bgOffsetY = 0
                }
            }
            
        case .ending:
            currentBg = .ending
            if scriptCount == 0 {
                
                setTimeoutClosure(timeCount: 400) {
                    bgOffsetY = 0
                }
                isLastSequenceImage = true
                setTimeoutClosure(timeCount: 1000) {
                    isBlurActive = false
                    globalStore.turnOffIsTapAble()
                    animationDuration = 12
                    bgOffsetY -= 1800
                }
                setTimeoutClosure(timeCount: 12000) {
                    globalStore.turnOnIsTapAble()
                }
            }
            if scriptCount == 6 {
                isBlurActive = true
            }
            if scriptCount == 7 {
                isLastScript = true
            }
        }
    }

    var body: some View {
        ZStack(alignment: .bottom){
            
            /**
             실제 배경 이미지
             */
            Image(currentSceneImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 390, height: 650, alignment: isLastSequenceImage ? .top : .bottom)
                    .offset(y: CGFloat(bgOffsetY))
                    .animation(.linear(duration: animationDuration), value: bgOffsetY)
                    .alignmentGuide(.bottom) { d in
                          d[.bottom]
                      }
            /**
             가려지는 레이어
             */
            Rectangle()
                .zIndex(100)
                .background(isLastScript ? Color.white : Color.black)
                .frame(width: CGFloat(390), height: 650)
                .opacity(isBlurActive ?  1 : 0)
                .animation(.easeInOut(duration: 1), value: isBlurActive)
        }
        .edgesIgnoringSafeArea(.all)
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleCurrentBackground(scriptCount: currentCount)
        })
        .onReceive(globalStore.$paddleCount, perform: { currentCount in
            if bgOffsetY < 1550 {
                bgOffsetY = bgOffsetY + currentCount * 2
            }
            
            if currentCount > 40 {
                globalStore.addScriptCount()
            }
        })
    }
}
