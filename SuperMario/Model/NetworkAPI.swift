//
//  NetworkAPI.swift
//  SuperMario
//
//  Created by King Copones on 10/19/21.
//

import Foundation

//API: https://www.amiiboapi.com/api/amiibo/

// MARK: - Response
struct Response: Hashable, Codable {
    let amiibo: [Amiibo]
}

// MARK: - Amiibo
struct Amiibo: Hashable, Codable {
    let amiiboSeries: String
    let character, gameSeries, head: String
    let image: String
    let name: String
    let release: Release
    let tail: String
    let type: String
}

//enum AmiiboSeries {
//    case animalCrossing
//    case boxBoy
//    case chibiRobo
//    case diablo
//    case fireEmblem
//    case kirby
//    case legendOfZelda
//    case marioSportsSuperstars
//    case megaMan
//    case metroid
//    case monsterHunter
//    case monsterHunterRise
//    case others
//    case pikmin
//    case pokemon
//    case powerPros
//    case shovelKnight
//    case skylanders
//    case splatoon
//    case superMarioBros
//    case superNintendoWorld
//    case superSmashBros
//    case the8BitMario
//    case yoshiSWoollyWorld
//    case yuGiOh
//}

// MARK: - Release
struct Release: Hashable, Codable {
    let au, eu, jp, na: String?
}

