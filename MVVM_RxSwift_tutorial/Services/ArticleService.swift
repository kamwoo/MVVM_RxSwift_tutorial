//
//  ArticleService.swift
//  MVVM_RxSwift_tutorial
//
//  Created by wooyeong kam on 2021/06/10.
//

import Foundation
import Alamofire
import RxSwift

// testing과 architecture의 재사용과 확장성을 높이기 위해 프로토콜로 사용
protocol ArticleServiceProtocol {
    func fetchNews() -> Observable<[Article]>
}

class ArticleService : ArticleServiceProtocol {
    
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in
            self.fetchNews{ (error, articles ) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let articles = articles {
                    observer.onNext(articles)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func fetchNews(completion : @escaping ((Error?, [Article]?) -> Void)) {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2021-05-10&sortBy=publishedAt&apiKey=e34febe364614031a28ce5d669caa1da"
        
        guard let url = URL(string: urlString) else
            { return completion(NSError(domain: "kam1741", code: 404, userInfo: nil), nil)}
        
        AF.request(url,
                   method: HTTPMethod.get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil).responseDecodable(of : ArticleResponse.self) { response in
                        if let error = response.error {
                            return completion(error, nil)
                        }
                        
                        if let articles = response.value?.articles {
                            return completion(nil, articles)
                        }
                    
                   }
    }
}
