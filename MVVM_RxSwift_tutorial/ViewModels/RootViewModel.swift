//
//  RootViewModel.swift
//  MVVM_RxSwift_tutorial
//
//  Created by wooyeong kam on 2021/06/10.
//

import Foundation
import RxSwift

final class RootViewModel {
    let title = "kamwoo News"
    
    private let articleService : ArticleServiceProtocol
    
    init(articleService : ArticleServiceProtocol) {
        self.articleService = articleService
    }
    
    // 의존성 주입 패턴
    func fetchArticles() -> Observable<[ArticleViewModel]> {
        return articleService.fetchNews().map{ $0.map{ ArticleViewModel(article: $0)}}
    }
}
