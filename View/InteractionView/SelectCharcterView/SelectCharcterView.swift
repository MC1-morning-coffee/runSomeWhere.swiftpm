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
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    private let SCRIPT_BOX_VIEW_BACKGROUND_IMAGE = "Background_Text"
    private let charcters: [enumCharcter] = [.walker, .coffee, .luna, .olive, .muho, .henry]
    
    private func handleSelectAnswer() {
        // here to logic
        globalStore.toggleIsSelectCharcterViewActive() // false
        globalStore.toggleIsPopupActive() // false
        globalStore.addScriptCount()
        globalStore.toggleIsTapAble() // true
    }
    
    private let gridColumns = [GridItem(),GridItem()]
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                let offset = CGFloat(16)
                
                // Background Image
                Image(SCRIPT_BOX_VIEW_BACKGROUND_IMAGE)
                    .zIndex(-1)
                    .offset(y: offset)
                LazyVGrid(columns: gridColumns) {
                    ForEach(Array(charcters.enumerated()), id: \.offset){ index, _charcters in
                        ButtonSelectCharcterView(charcter: _charcters, index: index) {
                            if _charcters == .coffee {
                                handleSelectAnswer()
                            }
                        }
                        .frame(minHeight: 48)
                    }
                    .offset(y: 16)
                    .padding(.horizontal, 24)
                    .frame(maxHeight: .infinity)
                }
                .frame(maxHeight: .infinity)
            }
            .padding(16)
            .frame(width: width, height: SCRIPT_BOX_HEIGHT)
            .background(CustomColor.scriptBox)
            .onTapGesture {
                print("SelectCharcter")
            }
        }
    }
}
