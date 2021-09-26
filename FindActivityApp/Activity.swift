//
//  Activity.swift
//  FindActivityApp
//
//  Created by Илья Нечаев on 26.09.2021.
//

struct Activity: Decodable {
    let activity: String?
    let type: String?
    let participants: Int?
    let price: Float?
    let accessibility: Float?
}
