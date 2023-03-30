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

