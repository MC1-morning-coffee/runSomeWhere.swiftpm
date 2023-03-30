//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI


struct SequenceOpeningView: View {
    @EnvironmentObject var globalStore: GlobalStore
    //var test1 = 0
    var isHidden: Bool = false
        
    var body: some View {
        
        switch globalStore.scriptCount {
        case 2: CharacterView()
        default: Image(systemName: "b.circle.fill")
        }
        
        
//        switch globalStore.scriptCount {
//        case 7:
//            AnyView(testFunction())
//        default: ShipView()
//
//        }
    }
}

