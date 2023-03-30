//
//  File.swift
//  
//
//  Created by Sehui Oh on 2023/03/30.
//

import SwiftUI

struct testview: View {
    var body: some View {
        ZStack{
            Image("Background_Image2")
                .position(x:195, y:0)
            CharacterView(objectName: "BigCoffee_", makeDirection: EnumDirection.Back_1, start: (170, 522), end: (0, 0))
            CharacterView(objectName: "BigMuho_", makeDirection: EnumDirection.Back_1, start: (220, 522), end: (0, 0))
            Image("Object_DoorButton")
                .position(x: 270, y: 380)
            
        }
    }
}

struct testview_Previews: PreviewProvider {
    static var previews: some View {
        testview()
    }
}
