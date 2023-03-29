//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/29.
//

import Foundation

//현재 텍스트를 말하는 사람을 찾는 함수
func findSpeaker(scriptCount: Int, scripts: [Script]) -> String {
    var speaker = ""
        
    for _ in scripts {
        //만약 말하는 사람이 한명 이상이라면 2명이 표시되게
        if scripts[scriptCount].0.count > 1 {
            speaker = "\(scripts[scriptCount].0[0]), \(scripts[scriptCount].0[1])"
        }
        //아니라면 1명이 표시되게
        else {
            speaker = "\(scripts[scriptCount].0[0])"
        }
    }
    //
    return speaker
}
