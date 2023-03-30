//
//  UserData.swift
//
//
//  Created by Bokyung on 2023/03/28.
//

import Foundation

enum enumCharcter {
    case coffee
    case walker
    case luna
    case henry
    case muho
    case olive
}

// User 각각 object들에 대한 정보를 저장하는 structure
struct User {
    var id: Int // 유저의 고유한 아이디
    var name: String
    var direction: EnumDirection
    var isShown: Bool // true일때만 화면 상에 보여줌
    var coord: (Float, Float) // 오브젝트들의 위치
}

// 모든 user에 대한 정보
var henry = User(id: 1, name: "Henry_", direction: EnumDirection.Front, isShown: false, coord: (100.0, 100.0))
var olive = User(id: 2, name: "Olive_", direction: EnumDirection.Front, isShown: false, coord: (100.0, 100.0))
var luna = User(id: 3, name: "Luna_", direction: EnumDirection.Back_1, isShown: true, coord: (100.0, 100.0))
var muho = User(id: 4, name: "Muho_", direction: EnumDirection.Front, isShown: false, coord: (100.0, 100.0))
var coffee = User(id: 5, name: "Coffee_", direction: EnumDirection.Front, isShown: false, coord: (100.0, 100.0))
var walker = User(id: 6, name: "Walker_", direction: EnumDirection.Front, isShown: false, coord: (100.0, 100.0))




