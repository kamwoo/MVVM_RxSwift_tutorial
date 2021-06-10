//
//  ArticleViewModel.swift
//  MVVM_RxSwift_tutorial
//
//  Created by wooyeong kam on 2021/06/10.
//

import Foundation

struct ArticleViewModel {
    private let article : Article
    
    var imageUrl : String? {
        return article.urlToImage
    }
    
    var title : String? {
        return article.title
    }
    
    var description : String? {
        return article.description
    }
    
    init(article : Article){
        self.article = article
    }
}
