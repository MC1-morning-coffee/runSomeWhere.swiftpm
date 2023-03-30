//
//  File.swift
//  
//
//  Created by 한영균 on 2023/03/30.
//
import SwiftUI

struct fileView: View {
    @State private var isShaking = false
    var body: some View {
        ZStack{
            Image("Background_Image1").offset(x: 0, y: -110)
            CharacterView(objectName: walker.name, makeDirection: EnumDirection.Back_1, start: (60.0, 570.0), end: (0.0, -420.0))
            CharacterView(objectName: luna.name, makeDirection: EnumDirection.Back_1, start: (114.0, 600.0), end: (0.0, -450.0))
            CharacterView(objectName: muho.name, makeDirection: EnumDirection.Back_1, start: (168.0, 580.0), end: (0.0, -430.0))
            CharacterView(objectName: coffee.name, makeDirection: EnumDirection.Back_1, start: (222.0, 560.0), end: (0.0, -410.0))
            CharacterView(objectName: olive.name, makeDirection: EnumDirection.Back_1, start: (276.0, 570.0), end: (0.0, -420.0))
            CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_1, start: (330.0, 540.0), end: (0.0, -390.0))
        }
    }
}
struct fileView_Previews: PreviewProvider {
    static var previews: some View {
        fileView()
    }
}

