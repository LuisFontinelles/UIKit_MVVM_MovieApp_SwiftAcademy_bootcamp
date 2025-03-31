//
//  NetworkConstants.swift
//  MovieDetailsMVVM
//
//  Created by Luis Fontinelles on 04/03/25.
//

import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    public var apiKey: String {
        get {
            return "ce9d82ed2dff4e59a3768e9b8c4540cc"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
