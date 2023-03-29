//
//  SceneScripts.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import Foundation

typealias Script = ([EnumSpeaker], String)

let SCRIPT_BOX_HEIGHT = CGFloat(194)

let SEQUENCE_OPENING_SCRIPTS: [Script] = [
    ([EnumSpeaker.unknown],
    "아야..!"
    ),
    ([EnumSpeaker.system],
    "어딘가에서 웅장한 목소리가 들려왔다."
    ),
    ([EnumSpeaker.system, EnumSpeaker.henry],
    "CBL을 완수하고 이 섬을 탈출하시오"
    ),
    ([EnumSpeaker.system],
    ""
    )
]

let SEQUENCE_ONE_SCRIPTS: [Script] = [
    ([EnumSpeaker.system],
    "앗! 물이 쫄쫄 나오는 정수기에 앞이 막혀있다"
    ),
]

let SEQUENCE_TWO_SCRIPTS: [Script] = [
    ([EnumSpeaker.system],
    "앞에 자동문과 버튼이 있다."
    ),
]

let SEQUENCE_THREE_SCRIPTS: [Script] = [
    ([EnumSpeaker.walker],
    "다들 문제 풀고 온 거야?"
    ),
]

let SEQUENCE_ENDING_SCRIPTS: [Script] = [
    ([EnumSpeaker.muho],
    "무야호~~ 도착했다!"
    ),
]


