//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/30.
//

import SwiftUI

struct QuizModalContainerView: View {
    var body: some View {
        // 모달 뷰를 중간까지만 띄우는 방법은 iOS16부터만 지원 가능..
        if #available(iOS 16.0, *) {
            QuizModalView()
        } else {
            // Fallback on earlier versions
            // iOS16보다 이전 버전이면 보내는 메시지 (모달뷰 기능이 안됨)
        }
    }
}
