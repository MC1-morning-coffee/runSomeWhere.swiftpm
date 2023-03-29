//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import SwiftUI

struct ButtonSelectCharcterView: View {
    
    var charcter: enumCharcter = .coffee
    
    var completion: () -> Void = {print("Hello")}
    
//    init(charcter: enumCharcter = .coffee, completion: @escaping ()->Void) {
//        self.charcter = charcter
//        self.completion = completion
//    }
    
    var body: some View {
        Button {
            completion()
        } label: {
            CustomText(value: charcter.personalColor)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(charcter.personalUIColor))
        .border(.blue)
        
    }
}

