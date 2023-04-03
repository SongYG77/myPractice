//
//  Article.swift
//  MVVM_Practice
//
//  Created by h on 2022/06/17.
//

import Foundation
struct ArticleList : Decodable {
    let articles : [Article]
}

struct Article : Decodable {
    let title : String?
    let description : String?
    
}
