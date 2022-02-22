//
//  CommentViewModel.swift
//  DecaNews
//
//  Created by Decagon on 11/02/2022.
//

import Foundation

final class CommentViewModel {
//    var allComments = [CommentModel]()
    var persistence = FireStorePersistence(collectionName: "comments")
    let networkManager = NetworkManager()
    
//    func getComments(forArticle articleId: Int) -> [CommentModel] {
//        return readComments().filter{ comment in
//            return true
//            return comment.articleId == articleId
//        }
//    }
    
    init() {
    }
    
    func add(comment: CommentModel) {
        persistence.add(item: comment)
    }
    
    func readComments(completion: @escaping ([CommentModel]) -> Void) {
        let comments: [CommentModel] = persistence.read { result in
            completion(result)
        }
    }
    
    func addImage() {
    }
}
