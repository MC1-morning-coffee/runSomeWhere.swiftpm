//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct SequenceThreeView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
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
        case 24:
            isLastScene = true
            isPeopleMoving3 = false
        case 25:
            isGomissacColor = false
            isLastScene = false
            
        default:
            print("scriptCount", scriptCount)
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Text("globalStore.scriptCount: \(globalStore.scriptCount)")
            
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
