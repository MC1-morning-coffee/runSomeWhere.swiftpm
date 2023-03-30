//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct SequenceTwoView: View {

    var body: some View {
        ZStack{
            Image("Background_Image2")
                .position(x:196.5, y:0)
            Text("Scene Two View")
            
            CharacterView(objectName: coffee.name, makeDirection: EnumDirection.Back_1, start: (-25.0, 150.0), end: (-25.0, 150.0))
            CharacterView(objectName: muho.name, makeDirection: EnumDirection.Back_1, start: (25.0, 150.0), end: (25.0, 150.0))
            //center Door
            AutoDoorView()
                .position(x: 195, y: 165)
            //Right Door
            AutoDoorView()
                .position(x: 320, y: 165)
            
        }
    }
}

struct SequenceTwoView_Previews: PreviewProvider{
    static var previews: some View{
        SequenceTwoView()
    }
}

/*시퀀스 투
 ..
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
