//
//  Article.swift
//  MVVM_RxSwift_tutorial
//
//  Created by wooyeong kam on 2021/06/10.
//

import Foundation


struct ArticleResponse : Codable {
    let status : String?
    let totalResults : Int
    let articles : [Article]
}

// Codable : JSON 형식을 swift 구조체 형식으로 변형해준다.
struct Article : Codable {
    
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
}
