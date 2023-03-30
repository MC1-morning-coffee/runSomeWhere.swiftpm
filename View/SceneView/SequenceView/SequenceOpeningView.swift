//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI


struct SequenceOpeningView: View {
    @EnvironmentObject var globalStore: GlobalStore
    
    var body: some View {
        Text("Scene opening View")
        // 캐릭터자체를 띄우는 뷰 -> 사람에 따라서 olive.name이런식으로 넣으면 됨 (UserData를 참고하면 됨!)
        CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_1, start: (10.0, 0.0), end: (10.0, -280.0))
    }
}

/*인트로 시작한다
 - Character 6명이 걸으며 나타난다.(12걸음 뒤 멈춤).
 
 - Image_CBL 팝업
 
 - Image_CBL 사라짐
 
 - Image_Pouch 팝업
 
 - Image_Pouch 사라짐
   Image_Keys 팝업
 
 - Image_Keys 팝업
   Image_Redkey 팝업
 
 - Character 6명이 이동한다.
 
 */
