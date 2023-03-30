//
//  File.swift
//  
//
//  Created by Bokyung on 2023/03/29.
//

import Foundation


public func setTimeIntervalClosure(Count: Int ,completion: @escaping ()->()) {
    if Count < 13 { // 12만큼만 수행
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(250)) {
            completion()
            setTimeIntervalClosure(Count: Count + 1, completion: completion)
        }
    }

}
