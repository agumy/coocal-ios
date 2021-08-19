//
//  Menu.swift
//  coocal-ios
//
//  Created by agumy on 2021/08/19.
//

import Foundation

struct Menu: Codable, Identifiable {
    let id: String;
    let name: String;
    let author: String;
    let date: String?;
    let url: String;
    let shared: Bool;
    let ingredientList: [Ingredient];
}

struct Ingredient: Codable {
    let name: String;
    let amount: String;
    let hasThis: Bool;
}
