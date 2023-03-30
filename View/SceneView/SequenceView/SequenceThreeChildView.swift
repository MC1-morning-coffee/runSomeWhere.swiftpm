//
//  SwiftUIView.swift
//
//
//  Created by 최민규 on 2023/03/30.
//

import SwiftUI

struct SequenceThreeChildView: View {
    
    @Binding
    var isPeopleMoving1: Bool
    
    @Binding
    var isDrawingActive: Bool
    
    @Binding
    var isWoodFabricActive: Bool
    
    @Binding
    var isWoodMove: Bool

    @Binding
    var isFabricMove: Bool

    @Binding
    var isDrawingMove: Bool
    
    @Binding
    var isBoatActive: Bool
    
    @Binding
    var isPeopleMoving2: Bool
    
    @Binding
    var isPeopleOnBoat: Bool
    
    @Binding
    var isMagicCircleOn: Bool
    
    @State private var isWoodMoveActive = false
    @State private var isFabricMoveActive = false
    @State private var isDrawingMoveActive = false

    var body: some View {
        if isPeopleMoving1 {
            CharacterView(objectName: walker.name, makeDirection: EnumDirection.Back_1, start: (50, 660), end: (0, -310))
            CharacterView(objectName: luna.name, makeDirection: EnumDirection.Back_1, start: (90, 660), end: (0, -250))
            CharacterView(objectName: coffee.name, makeDirection: EnumDirection.Back_1, start: (150, 660), end: (0, -220))
            CharacterView(objectName: muho.name, makeDirection: EnumDirection.Back_1, start: (210, 660), end: (0, -215))
            CharacterView(objectName: olive.name, makeDirection: EnumDirection.Back_1, start: (280, 660), end: (0, -260))
            CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_1, start: (340, 660), end: (0, -300))
        }
        
        if isDrawingActive {
            Image("Object_Drawing")
                .position(x: 60, y: 250)
        }
        
        if isWoodFabricActive {
            Image("Object_Wood")
                .position(x: 310, y: 200)
            Image("Image_Fabric")
                .position(x: 280, y: 300)
        }
        
        if isWoodMove {
            Image("Object_Wood")
                .position(x: 310, y: 200)
                .offset(x: (isWoodMoveActive ? -100 : 0), y: (isWoodMoveActive ? 100 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)){
                        isWoodMoveActive.toggle()
                    }
                }
        }
        if isFabricMove {
            Image("Image_Fabric")
                .position(x: 280, y: 300)
                .offset(x: (isFabricMoveActive ? -100 : 0), y: (isFabricMoveActive ? -30 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)){
                        isFabricMoveActive.toggle()
                    }
                }
        }
        if isDrawingMove {
            Image("Object_Drawing")
                .position(x: 60, y: 250)
                .offset(x: (isDrawingMoveActive ? 120 : 0), y: (isDrawingMoveActive ? 50 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)){
                        isDrawingMoveActive.toggle()
                    }
                }
        }
        
        if isBoatActive {
            ShipView()
        }
        
        if isPeopleMoving2 {
            CharacterView2(objectName: walker.name, makeDirection: EnumDirection.Back_1, start: (50, 350), end: (100, -30))
            CharacterView2(objectName: luna.name, makeDirection: EnumDirection.Back_1, start: (90, 410), end: (70, -80))
            CharacterView2(objectName: coffee.name, makeDirection: EnumDirection.Back_1, start: (150, 440), end: (30, -100))
            CharacterView2(objectName: muho.name, makeDirection: EnumDirection.Back_1, start: (210, 445), end: (-20, -115))
            CharacterView2(objectName: olive.name, makeDirection: EnumDirection.Back_1, start: (280, 400), end: (-70, -60))
            CharacterView2(objectName: henry.name, makeDirection: EnumDirection.Back_1, start: (340, 360), end: (-110, -10))
        }
        
        if isPeopleOnBoat {
                        ShipPeopleView()
                    }
        
        if isMagicCircleOn {
            Image("Object_Magic")
                .position(x: 195, y: 400)
        }
        
    }
}

