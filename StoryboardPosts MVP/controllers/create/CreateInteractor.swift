//
//  CreateInteractor.swift
//  StoryboardPosts MVP
//
//  Created by Asadulla Juraev on 16/11/21.
//

import Foundation

protocol CreateInteractorProtocol {
    
    func apiCreatePost(post: Post)
}

class CreateInteractor: CreateInteractorProtocol{
    
    var manager: HttpManagerProtocol!
    var response: CreateResponseProtocol!
    
    func apiCreatePost(post: Post) {
        manager.apiCreatePost(post: post) { result in
            self.response.onCreated(status: result)
        }
    }

}
