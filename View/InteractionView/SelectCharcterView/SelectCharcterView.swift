//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

/**
 1. 스크립트 뷰를 덮는다.
 2. 클릭 시 무조건 `빨강`이  선택된다.
 */

extension enumCharcter {
    var personalColor: String {
        switch self {
        case .coffee:
            return "red"
        case .walker:
            return "green"
        case .luna:
            return "yellow"
        case .henry:
            return "blue"
        case .muho:
            return "orange"
        case .olive:
            return "purple"
        }
    }
    
    var personalUIColor: UIColor {
        switch self {
        case .coffee:
            return .red
        case .walker:
            return .green
        case .luna:
            return .yellow
        case .henry:
            return .blue
        case .muho:
            return .orange
        case .olive:
            return .purple
        }
    }
}

struct SelectCharcterView: View {
    // TODO: change device width
    var width = CGFloat(390)
    
    private let charcters: [[enumCharcter]] = [[.walker, .coffee], [.luna, .olive], [.muho, .henry]]
    
    private func handleSelectAnswer() {
        // here to logic
        print("hello coffee")
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(alignment: .leading) {
                    Spacer()
                    ForEach(charcters, id: \.self){ _charcters in
                        HStack(spacing: 0){
                            ButtonSelectCharcterView(charcter: _charcters[0]){
                                
                            }
                            Spacer()
                            ButtonSelectCharcterView(charcter: _charcters[1]){
                                if _charcters[1] == .coffee {
                                    handleSelectAnswer()
                                }
                            }
                        }
                        .frame(maxHeight: .infinity)
                        .border(.red, width: 1)
                    }
                    Spacer()
                }
                .border(.red, width: 1)
            }
            .padding(16)
            .frame(width: width, height: SCRIPT_BOX_HEIGHT)
            .border(.red, width: 1)
            .background(CustomColor.scriptBoxColor)
            .onTapGesture {
                print("SelectCharcter")
            }
        }
    
    }
}
