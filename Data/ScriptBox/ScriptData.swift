//
//  SceneScripts.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import Foundation

typealias Script = ([EnumSpeaker], String)

let SEQUENCE_OPENING_SCRIPTS: [Script] = [
    ([EnumSpeaker.system],
    "모든 것이 평화롭던 어느날..."
    ),
    ([EnumSpeaker.system],
    "외딴 섬에 떨어지게된 6명의 러너들,"
    ),
    ([EnumSpeaker.system],
    "그들에게는 이 섬을 탈출하기 위한 미션이 주어지는데..."
    ),
    ([EnumSpeaker.system],
    "쿠와아아앙!!!!!"
    ),
    ([EnumSpeaker.system],
    "하늘에서 갑자기 사람들이 떨어졌다!"
    ),
    ([EnumSpeaker.unknown],
    "아야..!"
    ),
    ([EnumSpeaker.unknown],
    "어라... 여기가 어디지...?"
    ),
    
    ([EnumSpeaker.unknown],
    "CB...L?? 뭘 어떻게 하라는거야..!!"
    )
    ,
    ([EnumSpeaker.unknown],
    "주머니에 열쇠가 들어있어!"
    ),
    ([EnumSpeaker.unknown],
    "어떤 열쇠를 고르지...?"
    ),
    ([EnumSpeaker.unknown],
    "저 앞에 문으로 나가야 하나봐...!"
    ),
    ([EnumSpeaker.system],
    "터벅터벅....."
    ),
    ([EnumSpeaker.unknown],
    "철컥... 문이 열렸다!"
    ),
    
    
    
]

let SEQUENCE_ONE_SCRIPTS: [Script] = [
    ([EnumSpeaker.system],
    "앗! 물이 쫄쫄 나오는 정수기에 앞이 막혀있다"
    ),
    ([EnumSpeaker.system],
    "걷는 중..."
    ),
    ([EnumSpeaker.system],
    "걷는 중..."
    ),
    ([EnumSpeaker.coffee],
    "커피: 저게 뭐지...?"
    ),
    ([EnumSpeaker.coffee],
    "커피: 앗! 물이 쫄쫄 나오는 정수기에 앞이 막혀있다..."
    ),
    ([EnumSpeaker.coffee],
    "커피: 이런... 얼른 지나가야 할텐데..."
    ),
    ([EnumSpeaker.coffee],
    "커피: 쫄쫄 나오는 정수기가 사라졌다...! 이건 껌easy!!"
    ),
    ([EnumSpeaker.system],
    "부스럭...부스럭..."
    ),
    ([EnumSpeaker.muho],
    "무호: 문제를 풀었구나 커피!! 같이 가자!!"
    ),
    ([EnumSpeaker.coffee],
    "커피: 그래, 같이 가자 무호!"
    ),
]

let SEQUENCE_TWO_SCRIPTS: [Script] = [
    ([EnumSpeaker.system],
    "앞에 자동문과 버튼이 있다."
    ),
]


let SEQUENCE_THREE_SCRIPTS: [Script] = [
    ([EnumSpeaker.walker],
    "워커: 다들 문제 풀고 온 거야?"
    ),
]

let SEQUENCE_ENDING_SCRIPTS: [Script] = [
    ([EnumSpeaker.muho],
    "무야호~~ 도착했다!"
    ),
    ([EnumSpeaker.unknown],
    "자 이제 열어볼까? 어떤 보물이지...?"
    ),
    ([EnumSpeaker.system],
    "6개의 열쇠를 꽂아서 보물상자를 열었다."
    ),
    ([EnumSpeaker.unknown],
    "어어어어!!!"
    ),
    ([EnumSpeaker.system],
    "강렬한 빛이 쏟아져나오며 여섯명이 또 다시 사라졌다."
    ),
]












