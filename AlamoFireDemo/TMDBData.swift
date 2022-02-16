//
//  TMDBMovie.swift
//  AlamoFireDemo
//
//  Created by comviva on 10/02/22.
//

import Foundation

//json are mostly converted to struct
//calling objects
struct TMDBMovie : Codable{
    var title : String
    var overview : String
    var release_date : String
    var vote_average : Double
    var poster_path : String
    var id : Int
}
//json containg array of objects
//calling array
struct TMDBResult : Codable {
    var results : [TMDBMovie]
}
