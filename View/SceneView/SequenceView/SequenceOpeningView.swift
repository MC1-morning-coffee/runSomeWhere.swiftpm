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
        switch globalStore.scriptCount {
        case 7 : FaceView()
            
        default: ShipView()
            
        }
        Text("Scene opening View")
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
