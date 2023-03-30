//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import SwiftUI

struct ButtonSelectCharcterView: View {
    
    var charcter: enumCharcter = .coffee
    var index: Int
    var completion: () -> Void = {print("Hello")}
    
    init(charcter: enumCharcter = .coffee, index: Int, completion: @escaping ()->Void) {
        self.charcter = charcter
        self.completion = completion
        self.index = index
    }
    
    var body: some View {
        Button {
            completion()
        } label: {
            CustomText(value: "\(index + 1). \(charcter.personalColor)")
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 0, maxWidth: .infinity ,maxHeight: .infinity)
    }
}

