//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI
import AVFoundation
import Combine

struct SequenceThreeView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    let backgroundMusicFiles = ["BGM_Adventure_Explore"]
    let soundEffectFiles = ["Walk", "SFX_SeqThree_sounds_powerup10", "SFX_SeqThree_coin_cluster3", "SFX_SeqThree_menu_select4", "SFX_SeqThree_sound_mechanicalnoise4", "SFX_SeqThree_lowhealth_alarmloop6", "SFX_SeqThree_sounds_fanfare3"] // add the names of your sound effect files here
    let musicFileExtension = "wav" // add the extension of your music files here
    let musicFileExtension1 = "wav"
    
    let volume: Float = 0.1 // adjust this value to set the volume
    let volume1: Float = 0.3
    
    @State private var currentCount = 0
    @State private var backgroundMusicPlayer: AVPlayer?
    @State private var soundEffectPlayer: AVPlayer?
    @State private var currentPlayCount = 0
    
    @State
    var isPeopleMoving1 = false
    
    @State
    var isDrawingActive = false
    
    @State
    var isWoodFabricActive = false
    
    @State
    var isWoodMove = false
    
    @State
    var isFabricMove = false
    
    @State
    var isDrawingMove = false
    
    @State
    var isBoatActive = false
    
    @State
    var isPeopleMoving2 = false
    
    @State
    var isPeopleOnBoat = false
    
    @State
    var isMagicCircleOn = false
    
    @State
    var isPaddleOn = false
    
    @State
    var isPeopleMoving3 = false
    
    @State
    var isBoatMove = false
    
    @State
    var isGomissacMove = false
    
    @State
    var isGomissacColor = false
    
    @State
    var isLastScene = false
    
    @State private var isWoodMoveActive = false
    @State private var isFabricMoveActive = false
    @State private var isDrawingMoveActive = false
    @State private var isBoatMoveActive = false
    @State private var isGomissacMoveActive = false
    @State private var isGomissacColorActive = false
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
        case 0:
            isPeopleMoving1 = true
        case 4:
            isDrawingActive = true
        case 5:
            isWoodFabricActive = true
        case 7:
            isWoodFabricActive = false
            isDrawingActive = false
            isWoodMove = true
            isFabricMove = true
            isDrawingMove = true
        case 8:
            isBoatActive = true
            isWoodMove = false
            isFabricMove = false
            isDrawingMove = false
        case 9:
            isPeopleMoving1 = false
            isPeopleMoving2 = true
        case 10:
            isBoatActive = false
            isPeopleMoving2 = false
            isPeopleOnBoat = true
        case 12:
            isMagicCircleOn = true
        case 15:
            isMagicCircleOn = false
        case 19:
            isPaddleOn = true
        case 21:
            isPeopleOnBoat = false
            isPaddleOn = false
            isBoatMove = true
            isPeopleMoving3 = true
            
        case 22:
            //            isPeopleOnBoat = false
            //            isPaddleOn = false
            //            isBoatMove = true
            isGomissacMove = true
        case 23:
            isGomissacColor = true
            isBoatMove = false
        case 25:
            isLastScene = true
            isPeopleMoving3 = false
            setTimeoutClosure(timeCount: 2000) {
                isGomissacColor = false
                isLastScene = false
            }
        
 
            
        default:
            print("scriptCount", scriptCount)
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){            
            SequenceThreeChildView(isPeopleMoving1: $isPeopleMoving1, isDrawingActive: $isDrawingActive, isWoodFabricActive: $isWoodFabricActive,isWoodMove: $isWoodMove, isFabricMove: $isFabricMove, isDrawingMove: $isDrawingMove, isBoatActive: $isBoatActive, isPeopleMoving2: $isPeopleMoving2, isPeopleOnBoat: $isPeopleOnBoat, isMagicCircleOn: $isMagicCircleOn)
            
            if isPaddleOn {
                PaddleButtonView()
            }
            
            if isPeopleMoving3 {
                CharacterView2(objectName: walker.name, makeDirection:
                                isLastScene ? EnumDirection.Front :  EnumDirection.Back_1, start: (150, 320), end: (-100, 30))
                CharacterView2(objectName: luna.name, makeDirection:
                                isLastScene ? EnumDirection.Front :  EnumDirection.Back_1, start: (160, 330), end: (-70, 80))
                CharacterView2(objectName: coffee.name, makeDirection:
                                isLastScene ? EnumDirection.Front :  EnumDirection.Back_1, start: (180, 340), end: (-30, 100))
                CharacterView2(objectName: muho.name, makeDirection:
                                isLastScene ? EnumDirection.Front :  EnumDirection.Back_1, start: (190, 330), end: (20, 115))
                CharacterView2(objectName: olive.name, makeDirection:
                                isLastScene ? EnumDirection.Front :  EnumDirection.Back_1, start: (210, 340), end: (70, 60))
                CharacterView2(objectName: henry.name, makeDirection:
                                isLastScene ? EnumDirection.Front :  EnumDirection.Back_1, start: (230, 350), end: (110, 10))
            }
            
            if isLastScene {
                CharacterView2(objectName: walker.name, makeDirection:
                                EnumDirection.Front, start: (50, 400), end: (0,0))
                CharacterView2(objectName: luna.name, makeDirection:
                                EnumDirection.Front, start: (90, 460), end: (0,0))
                CharacterView2(objectName: coffee.name, makeDirection:
                                EnumDirection.Front, start: (150, 490), end: (0,0))
                CharacterView2(objectName: muho.name, makeDirection:
                                EnumDirection.Front, start: (210, 495), end: (0,0))
                CharacterView2(objectName: olive.name, makeDirection:
                                EnumDirection.Front, start: (280, 450), end: (0,0))
                CharacterView2(objectName: henry.name, makeDirection:
                                EnumDirection.Front, start: (340, 410), end: (0,0))
            }
            
            if isBoatMove {
                Image("Object_Boat")
                    .position(x: 195, y: 310)
                    .offset(x: 0, y: (isBoatMoveActive ? 500 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2)){
                            isBoatMoveActive.toggle()
                        }
                    }
            }
            
            if isGomissacMove {
                Image("Object_Gomissac_1")
                    .position(x: 195, y: -50)
                    .offset(x: 0, y: (isGomissacMoveActive ? 200 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2)){
                            isGomissacMoveActive.toggle()
                        }
                    }
            }
            
            if isGomissacColor {
                Image("Object_Gomissac_2")
                    .position(x: 195, y: 150)
                    .opacity((isGomissacColorActive ? 100 : 0))
                    .onAppear {
                        withAnimation(.linear(duration: 3)){
                            isGomissacColorActive.toggle()
                        }
                    }
            }
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
            
            switch currentCount {
            case 0 :
                let musicFileName = backgroundMusicFiles[0] // count starts at 1, but array index starts at 0
                let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                backgroundMusicPlayer?.volume = volume
                backgroundMusicPlayer?.play()
                
                let effectFileName = soundEffectFiles[0] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()

            case 4 :
                //backgroundMusicPlayer?.pause()
                
                let effectFileName = soundEffectFiles[1] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 5 :
                let effectFileName = soundEffectFiles[2] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 7 :
                let effectFileName = soundEffectFiles[3] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 12 :
                let effectFileName = soundEffectFiles[4] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 21 :
                let effectFileName = soundEffectFiles[0] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 22 :
                let effectFileName = soundEffectFiles[5] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 24 :
                let effectFileName = soundEffectFiles[6] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
                
            default:
                break
            }
        })
    }
}



/*시퀀스 쓰리
 6명이 나와서 걷는다(12걸음 뒤 자동 멈춤)
 도면이미지 나타난다.
 나무와 천 이미지 나타난다.
 도면/나무/천이 위치 이동하여 합쳐진다.
 보트 이미지 나타난다.
 6명이 보트에 탄다.
 마방진이 나타난다.
 패들버튼이 나타난다.
 보트/패들버튼 사라진다.
 6명이 이동한다.
 곰이작 나타난다.
 곰이작 상태변경(밝아진다.)
 보물상자 나타난다.
 */
