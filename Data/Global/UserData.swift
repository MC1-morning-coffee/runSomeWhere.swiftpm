//
//  UserData.swift
//
//
//  Created by Bokyung on 2023/03/28.
//

import Foundation

// User 각각 object들에 대한 정보를 저장하는 structure
struct User {
    var id: Int // 유저의 고유한 아이디
    var name: EnumSpeaker
    var direction: EnumDirection
    var isShown: Bool // true일때만 화면 상에 보여줌
    var coord: (Float, Float) // 오브젝트들의 위치
}


// 모든 user에 대한 정보
let henry = User(id: 1, name: EnumSpeaker.henry, direction: EnumDirection.front, isShown: false, coord: (100.0, 100.0))
let olive = User(id: 2, name: EnumSpeaker.olive, direction: EnumDirection.front, isShown: false, coord: (100.0, 100.0))
let luna = User(id: 3, name: EnumSpeaker.luna, direction: EnumDirection.front, isShown: true, coord: (100.0, 100.0))
let muho = User(id: 4, name: EnumSpeaker.muho, direction: EnumDirection.front, isShown: false, coord: (100.0, 100.0))
let coffee = User(id: 5, name: EnumSpeaker.coffee, direction: EnumDirection.front, isShown: false, coord: (100.0, 100.0))
let walker = User(id: 6, name: EnumSpeaker.walker, direction: EnumDirection.front, isShown: false, coord: (100.0, 100.0))

