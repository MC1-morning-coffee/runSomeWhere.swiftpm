//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/28.
//

import Foundation
import SwiftUI

typealias SafeAreaSize = (CGFloat, CGFloat)

/**
 safeArea의 사이즈를 구하는 함수
 */
func getSafeAreaSize() -> SafeAreaSize {
    var safeAreaSize: SafeAreaSize = (0, 0)
    
    let windowScene = UIApplication.self.shared.connectedScenes.first as? UIWindowScene
    
    safeAreaSize.0 =  windowScene?.windows.first?.safeAreaInsets.top ?? 0
    safeAreaSize.1 =  windowScene?.windows.first?.safeAreaInsets.bottom ?? 0
    
    return safeAreaSize
}
