//
//  ViewController.swift
//  MVVM_Sample
//
//  Created by Jefin on 12/02/20.
//  Copyright © 2020 Jefin. All rights reserved.
//

import UIKit

class NewsList: UIViewController,UITableViewDataSource,UITableViewDelegate {

private var articleListViewModel:ArticleListViewModel!
    
@IBOutlet weak var NewsTable: UITableView!
 
var ArticlesArray = [Article]()
    
override func viewDidLoad() {
    
  super.viewDidLoad()
        
    InitialSetup()
        
}
    
func InitialSetup() {
        
GetNews()

}
    
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
return ArticlesArray.count

}
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
 let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
 cell.titleLabel.text = ArticlesArray[indexPath.row].title
cell.selectionStyle = .none
return cell
    
}
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

return 70

}
    
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
let Storyboard = UIStoryboard.init(name: "Main", bundle: nil)
let VC = Storyboard.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
VC.articleList = self.ArticlesArray
VC.SelectNewsItem = indexPath.row
self.navigationController?.pushViewController(VC, animated: true)

    
}

func GetNews() {
        
let UrlString = "https://newsapi.org/v2/top-headlines?country=in&apiKey=1e79d5f171d746a6b37be37a5909029d"
    
let url = URL(string: UrlString)
    
    URLSession.shared.dataTask(with: url!,completionHandler: {(data, response, err) in
        
        if(err != nil){
            
            print(err)
        }
        guard let data = data else {return}
        if let articles = try? JSONDecoder().decode(ArticleList.self, from: data).articles{
            self.articleListViewModel = ArticleListViewModel(articles: articles)
            self.ArticlesArray = self.articleListViewModel.articles
        print(self.articleListViewModel.articles[0].title)
            
        DispatchQueue.main.async {
            
            self.NewsTable.reloadData()
            
        }
        }
}).resume()
    
}
}
