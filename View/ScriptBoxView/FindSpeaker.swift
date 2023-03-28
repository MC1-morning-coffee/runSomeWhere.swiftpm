//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import Foundation

func findSpeaker(scriptCount: Int) -> String {
    var speaker = ""
        
    for _ in SEQUENCE_OPENING_SCRIPTS {
        if SEQUENCE_OPENING_SCRIPTS[scriptCount].0.count > 1 {
            speaker = "\(SEQUENCE_OPENING_SCRIPTS[scriptCount].0[0]), \(SEQUENCE_OPENING_SCRIPTS[scriptCount].0[1])"
        }
        else {
            speaker = "\(SEQUENCE_OPENING_SCRIPTS[scriptCount].0[0])"
        }
    }
    return speaker
}
