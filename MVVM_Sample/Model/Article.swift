//
//  Article.swift
//  MVVM_Sample
//
//  Created by Jefin on 12/02/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation

struct ArticleList : Decodable{
    
    let  articles : [Article]
}

struct Article : Decodable {
    
    let title: String
    let description : String
    let urlToImage : String
}
