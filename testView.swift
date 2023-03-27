//
//  testView.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/24.
//

import SwiftUI

struct TestView: View {
    
    // view가 붙을 때
    init(){
        print("hello")
    }
    
    var body: some View {
        HStack{
            Text("아무리 생각해도")
                .font(Font.custom("morris9", size: 32))
                .fontWeight(.bold)
                .padding()
                .border(.red, width: 1)
            Text("커피는 최고존엄")
                .font(Font.custom("morris9", size: 32))
                .border(.red, width: 1)
            Text("솔직히")
                .font(Font.custom("morris9", size: 32))
                .fontWeight(.bold)
                .padding()
                .border(.red, width: 1)
        }
        .border(.red, width: 2)
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
