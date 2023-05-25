//
//  PlacesModel.swift
//  nano2
//
//  Created by Febrian Daniel on 24/05/23.
//

import Foundation

struct PlacesModel: Hashable, Identifiable {
    let id: String
    let placeName: String
    let address: String
    let latitude: String
    let longitude: String
    let description: String
    let image: String
}
