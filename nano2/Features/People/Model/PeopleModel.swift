//
//  PeopleModel.swift
//  nano2
//
//  Created by Febrian Daniel on 25/05/23.
//

import Foundation

struct PeopleModel: Hashable, Identifiable {
    let id: String
    let displayName: String
    let interests: [String]
    let descriptions: String
}
