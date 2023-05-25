//
//  PeopleData.swift
//  nano2
//
//  Created by Febrian Daniel on 25/05/23.
//

import Foundation

struct PeopleData {
    static let peeps = [
        PeopleModel(
            id: "people1",
            displayName: "Anjai",
            interests: ["Badminton, Basket, Billiard"],
            descriptions: "Gw besok mau main badmin bro jam 11"
        ),
        PeopleModel(
            id: "people2",
            displayName: "Bro",
            interests: ["Futsal, Badminton"],
            descriptions: "Yuk futsal hari Sabtu ini"
        ),
        PeopleModel(
            id: "people3",
            displayName: "Sis",
            interests: ["Catur, Billiard"],
            descriptions: "Sini catur ama gua kalo berani"
        )
    ]
}
