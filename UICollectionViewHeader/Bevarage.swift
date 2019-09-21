//
//  Bevarage.swift
//  CollectionViewHeader
//
//  Created by Banyar on 21/9/19.
//  Copyright © 2019 Banyar. All rights reserved.
//

import Foundation

struct Bevarage {
    
    var name : String
    var imageName : String
    
    static func generateBevarage() -> [[Bevarage]]  {
        
        let goldLabel = Bevarage(name: "Gold Label", imageName: "gold.jpg")
        let ballantine = Bevarage(name: "Ballantine's", imageName: "ball.jpg")
        let chivas = Bevarage(name: "Chivas Regal", imageName: "chi.jpg")
        
        let guiness = Bevarage(name: "Guinness", imageName: "Guinness.jpg")
        let asahi = Bevarage(name: "Asahi", imageName: "asahi.jpg")
        let tiger = Bevarage(name: "Tiger", imageName: "tiger.jpg")
        
        let beers = [guiness, asahi, tiger]
        let scotch = [goldLabel, ballantine, chivas]
        
        return [beers, scotch]
    }
}

