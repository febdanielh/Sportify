//
//  PlacesData.swift
//  nano2
//
//  Created by Febrian Daniel on 24/05/23.
//

import Foundation

struct PlacesData {
    static let places = [
        PlacesModel(
            id: "places1",
            placeName: "Candra Wijaya International Badminton Centre",
            address: "Jade 1, Tangerang Selatan",
            latitude: "-6,272135250151961",
            longitude: "106,66967451351304",
            description: "Badminton Court",
            image: "cwbadminton"
        ),
        PlacesModel(
            id: "places2",
            placeName: "MS Indoor Soccer",
            address: "Kavling Ocean Walk, Serpong",
            latitude: "-6,293108927637489",
            longitude: "106,66806163584326",
            description: "Futsal Court",
            image: "msindoorsoccer"
        ),
        PlacesModel(
            id: "places3",
            placeName: "Stadiums Futsal",
            address: "Jl. Pondok Jagung Timur No.35, Tangerang Selatan",
            latitude: "-6,252938346831773",
            longitude: "106,66799333276231",
            description: "Futsal Court",
            image: "stadiumsfutsal"
        ),
        PlacesModel(
            id: "places4",
            placeName: "BIFO ARENA",
            address: "Jl. Kongsi Baru, Kabupaten Tangerang",
            latitude: "-6,263540657899131",
            longitude: "106,62648082732683",
            description: "Soccer Field",
            image: "bifoarena"
        ),
        PlacesModel(
            id: "places5",
            placeName: "Aim High Stadium",
            address: "RT.001/RW.001, Panunggangan, Tangerang",
            latitude: "-6,223741750134653",
            longitude: "106,6374069202246",
            description: "Sports Club",
            image: "aimhigh"
        )
    ]
}
