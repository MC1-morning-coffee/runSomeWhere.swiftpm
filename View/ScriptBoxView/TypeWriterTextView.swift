//
//  File.swift
//  
//
//  Created by yusang on 2023/03/30.
//

import Foundation

import SwiftUI

struct TypeWriterTextView: View {
    private let text: String

    private let speed: TimeInterval

    @Binding var isStart: Bool

    @State private var textArray: String = ""

    init(_ text: String, speed: TimeInterval = 0.1, isStart: Binding<Bool>) {
        self.text = text
        self.speed = speed
        self._isStart = isStart
    }

    var body: some View {
        Text(textArray)
            .onChange(of: isStart) { _ in
                startAnimation()
            }
    }

    private func startAnimation() {
        DispatchQueue.global().async {
            let _ = text.map {
                Thread.sleep(forTimeInterval: speed)
                textArray += $0.description
            }
        }
    }
}
