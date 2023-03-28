//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/28.
//

import Foundation


public func setTimeoutClosure(timeCount: Int, completion: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(timeCount)) {
        completion()
    }
}
