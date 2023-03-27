//
//  ScriptBoxView.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/26.
//

import SwiftUI

struct ScriptBoxView: View {
//    @Binding
//    var sceneCount: Int
//    
    var scripts = openingScripts2
    
    @State
    var scriptCount = 0
    
    var width: CGFloat
    
    func printScript(scriptDict: [speaker : String])->String{
        var returnValue = ""
        for (_, value) in scriptDict {
            returnValue = value;
        }
        return returnValue
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(spacing: 0){
                    VStack(alignment: .leading, spacing: 0){
//                        Text("말하는 사람")
//                            .font(.title3)
//                            .padding(.bottom, 8)
//                            .border(.red, width: 1)
                        Text(scripts[scriptCount])
                            .frame(width: width - 32)
                    }
                    Spacer()
                }
                .border(.red, width: 1)
                Spacer()
            }
            .border(.red, width: 1)
            Spacer()
        }
        .padding(16)
        .frame(width: width, height: 212)
        .border(.red, width: 1)
        .background(CustomColor.scriptBoxColor)
        .onTapGesture {
            self.scriptCount += 1
            print(scriptCount)
        }
    }
}

