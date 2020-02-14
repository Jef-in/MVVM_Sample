//
//  ArticleViewModel.swift
//  MVVM_Sample
//
//  Created by Jefin on 12/02/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    
    let articles : [Article]
    
}

struct ArticleViewModel {
    
    private let article : Article
    
    init(_ article:Article) {
        
        self.article = article
    }
    var title:String {
        
        return article.title
    }
    var description:String {
        
        return article.description
    }
    var urlToImage:String {
        
        return article.urlToImage
    }
}
