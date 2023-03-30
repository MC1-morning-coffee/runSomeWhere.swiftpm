//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct AutoDoorView: View {
    //자동문 버튼 눌렀을 때 오른쪽 문이 열림
    @State private var isOpen = false
    
    var body: some View {
            ZStack {
                Image("Object_Door_Left")
                    //.position(x: 195, y: 165)
                    .offset(x: isOpen ? -40 : 0)
                Image("Object_Door_Right")
                    //.position(x: 195, y: 165)
                    .offset(x: isOpen ? 40 : 0)
                Image("Object_Door_Frame")
                    //.position(x: 195, y: 165)
            }
            .animation(.easeInOut(duration: 3), value: isOpen)
            .mask(
                Rectangle()
                    .frame(width: 100, height: 65)
                    //.position(x: 195, y: 165)
            )
            .onAppear {
                self.isOpen = true
            }
    }
}

/*struct AutoDoor_Previews: PreviewProvider{
    static var previews: some View{
        AutoDoorView()
    }
}*/
