//
//  NewsDetailVC.swift
//  MVVM_Sample
//
//  Created by Jefin on 12/02/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import Foundation
import UIKit
class NewsDetailVC:UIViewController {

var articleList = [Article]()
var SelectNewsItem:Int!

@IBOutlet weak var TitleLabel: UILabel!
    
@IBOutlet weak var NewsTextView: UITextView!
    
@IBOutlet weak var NewsImage: CachedImageView!
    
override func viewDidLoad() {
    
 InitialSetup()
    
}
    
func InitialSetup() {

 self.TitleLabel.text = articleList[SelectNewsItem].title
 self.NewsTextView.text = articleList[SelectNewsItem].description
 
 if(self.articleList[SelectNewsItem].urlToImage != ""){
    
 self.NewsImage.loadImage(UrlString: articleList[SelectNewsItem].urlToImage)
  
}
}
    
}
