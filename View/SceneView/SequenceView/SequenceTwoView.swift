//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct SequenceTwoView: View {
    
    @State
    private var isAutoDoor1Open = false
    
    @State
    private var isAutoDoor2Open = false
    
    var body: some View {
        ZStack{
            Image("Background_Image2")
                .position(x:196.5, y:0)
            Text("Scene Two View")
            CharacterView(objectName: coffee.name, makeDirection: EnumDirection.Back_1, start: (-25.0, 160.0), end: (-25.0, 160.0))
            CharacterView(objectName: muho.name, makeDirection: EnumDirection.Back_1, start: (25.0, 160.0), end: (25.0, 160.0))
            //center Door
            AutoDoorView(isAnimating: $isAutoDoor1Open)
                .position(x: 195, y: 165)
            //Right Door
            AutoDoorView(isAnimating: $isAutoDoor2Open)
                .position(x: 320, y: 165)
        }
        .onAppear{
            setTimeoutClosure(timeCount: 2) {
                isAutoDoor1Open = true
            }
            setTimeoutClosure(timeCount: 4) {
                isAutoDoor2Open = true
            }
        }
    }
}

struct SequenceTwoView_Previews: PreviewProvider{
    static var previews: some View{
        SequenceTwoView()
    }
}
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
