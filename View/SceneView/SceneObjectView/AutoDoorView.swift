//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct AutoDoorView: View {
    
    var body: some View {
        ZStack{
            Image("Object_Door_Frame")
                .resizable()
                .frame(width: 100, height: 65)
            Image("Object_Door_Left")
                .resizable()
                .frame(width: 100, height: 65)
            Image("Object_Door_Right")
                .resizable()
                .frame(width: 100, height: 65)
        }
    }
}

struct AutoDoor_Previews: PreviewProvider{
    static var previews: some View{
        AutoDoorView()
    }
}
