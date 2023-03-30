//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/28.
//

import Foundation


/**
 `timeCount`초 후에 `completion`을 지연 동작 시키고 싶을 때 사용하는 클로저 함수
 */
public func setTimeoutClosure(timeCount: Int, completion: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(timeCount)) {
        completion()
    }
}
