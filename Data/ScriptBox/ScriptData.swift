//
//  SceneScripts.swift
//  runSomeWhere
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import Foundation

typealias Script = ([EnumSpeaker], String)

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
    "워커: 다들 문제 풀고 온 거야?"
    ),
    ([EnumSpeaker.luna],
     "루나: 다 끝난 줄 알았는데, 호수 때문에 못 지나가겠네?"
    ),
    ([EnumSpeaker.henry],
    "헨리: (너희 납치된거야…)"
    ),
    ([EnumSpeaker.muho],
    "무호: 어, 나 오는 길에 배 도면을 발견했는데…이걸로 뭘 할 수 있을까?"
    ),
    ([EnumSpeaker.olive],
    "올리브: 나는 천, 헨리는 나무를 발견했어!"
    ),
    ([EnumSpeaker.coffee],
    "커피 : 그럼 배를 만들어볼까?"
    ),
    ([EnumSpeaker.unknown],
    "뚝딱뚝딱......"
    ),
    ([EnumSpeaker.system],
    "배가 만들어졌다!"
    ),
    ([EnumSpeaker.muho],
    "무호: 다들 배에 타봐!"
    ),
    ([EnumSpeaker.olive],
    "올리브: 앗, 그런데 바람이 너무 세서 앞으로 갈 수가 없어!"
    ),
    ([EnumSpeaker.luna,
     EnumSpeaker.walker],
    "루나,워커: 우리가 풍향을 바꿔보자!"
    ),
    ([EnumSpeaker.luna,
     EnumSpeaker.walker],
    "워커와 루나가 주문을 외우기 시작했다."
    ),
    ([EnumSpeaker.luna,
     EnumSpeaker.walker],
    "워커: Import UIkit“var wind = “North”"
    ),
    ([EnumSpeaker.luna,
     EnumSpeaker.walker],
    "루나: wind = direction..."
    ),
    ([EnumSpeaker.system],
    "바람의 방향이 남풍으로 바뀌었다!"
    ),
    ([EnumSpeaker.henry],
    "헨리: 좋아! 그런데,, 노는 어떻게 젓지?"
    ),
    ([EnumSpeaker.coffee],
    "커피: (조용히 손을 들며..) 제가 한 번…해보겠습니다…"
    ),
    ([EnumSpeaker.coffee],
    "커피: 노는 이렇게 젓는겁니다."
    ),
    ([EnumSpeaker.unknown],
    "우와아아아아!!!!!!"
    ),
    ([EnumSpeaker.coffee],
    "커피: 꺅!! 저건 누구지?"
    ),
    ([EnumSpeaker.gomisac],
    "곰이작: (머리를 넘기며) CBL을 생각보다 잘 완수했군요…"
    ),
    ([EnumSpeaker.gomisac],
    "곰이작: 이건 우리가 주는 선물이니 섬을 탈출하면 열어보세요..축하합니다."
    ),
    ([EnumSpeaker.unknown],
    "와~드디어 탈출했다~!!!!"
    ),
    
]

let SEQUENCE_ENDING_SCRIPTS: [Script] = [
    ([EnumSpeaker.muho],
    "무야호~~ 도착했다!"
    ),
]
