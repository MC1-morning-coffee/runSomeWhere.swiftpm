//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct SequenceTwoView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    
    
    @State
    var isAutoDoorButtonActive = false
    
    @State
    var isMainDoorOpen = false
    
    @State
    var isWrongDoorOpen = false
    
    @State
    var isWrongAutoDoorComing = false
    
    @State
    var isWrongDoorComeActive = false
    
    @State
    var isMainAutoDoorComing = false
    
    @State
    var isMainDoorComeActive = false
    
    @State
    var isCharacterMove = false
    
    @State
    var isDoorButtonClicked = false
    
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
            case 0 :
                isCharacterMove = true
                isWrongAutoDoorComing = true
                isWrongDoorComeActive = true
                isMainAutoDoorComing = true
                isMainDoorComeActive = true
            case 4:
                isAutoDoorButtonActive = true
            case 6:
                isAutoDoorButtonActive = false
                isDoorButtonClicked = true
            case 7:
                isAutoDoorButtonActive = true
                isDoorButtonClicked = false
                isWrongAutoDoorComing = false
                isWrongDoorOpen = true
            case 10:
                isMainAutoDoorComing = false
                isMainDoorOpen = true
            default:
                print("scriptCount", scriptCount)
        }
    }
    var body: some View {
        ZStack {
            Text("globalStore.scriptCount: \(globalStore.scriptCount)")
//            Text("Scene Two View")
            
            if isCharacterMove {
                CharacterView(objectName: "BigCoffee_", makeDirection: EnumDirection.Back_1, start: (170, 522), end: (0, 0))
                CharacterView(objectName: "BigMuho_", makeDirection: EnumDirection.Back_1, start: (220, 522), end: (0, 0))
            }
            if isWrongAutoDoorComing{
                        Image("Object_Door_Closed")
                        .position(x: 320, y: 165)
                        .offset(x: 0 , y: (isWrongDoorComeActive ? -650 : 0))
                        .onAppear {
                            withAnimation(.linear(duration: 3))
                            {
                                isWrongDoorComeActive.toggle()
                                
                            }
                        }
            }
            if isMainAutoDoorComing{
                        Image("Object_Door_Closed")
                        .position(x: 195, y: 165)
                        .offset(x: 0, y: (isMainDoorComeActive ? -650 : 0))
                        .onAppear {
                            withAnimation(.linear(duration: 3))
                            {
                                isMainDoorComeActive.toggle()
                                
                            }
                        }
            }
            if isAutoDoorButtonActive {
                Image("Object_DoorButton")
                    .position(x: 270, y: 380)
            }
            if isDoorButtonClicked{
                Image("Object_DoorButton_Dark")
                    .position(x: 270, y: 380)
            }
            if isMainDoorOpen {
                //center Door
                AutoDoorView()
                    .position(x: 195, y: 165)
            }
            if isWrongDoorOpen {
                //Right Door
                AutoDoorView()
                    .position(x: 320, y: 165)
            }
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
        })
    }
}

//struct SequenceTwoView_Previews: PreviewProvider{
//    static var previews: some View{
//        SequenceTwoView()
//    }
//}


/*시퀀스 투
 - Big_Coffee_Back_1/2 걷는다. (12걸음 뒤 자동 멈춤)
 Big_Muho_Back_1/2 걷는다. (12걸음 뒤 자동 멈춤)
 
 - Object_Door 맵에 나타난다.(3000ms, 도착지로부터 y = -650에서 출발)
 
 - Image_Door 팝업된다.
 
 - Imgae_Door 사라진다.
   Object_DoorButton 나타난다.
 
 - 오른쪽 자동문 열린다.
 
 - Quiz 2 팝업/사라진다.
 
 - 왼쪽 자동문 열린다.
 
 - Coffee/Muho 걷는다.
 */
