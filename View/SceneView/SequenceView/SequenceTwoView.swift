//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct SequenceTwoView: View {
    
    var body: some View {
        HStack{
            Text("Scene Two View")
            AutoDoorView()
                .position(x: 195, y: 165)
            AutoDoorView()
        }
    }
}

struct SequenceTwoView_Previews: PreviewProvider{
    static var previews: some View{
        SequenceTwoView()
    }
}
