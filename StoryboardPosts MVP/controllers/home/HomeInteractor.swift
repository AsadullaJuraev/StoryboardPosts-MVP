//
//  HomeInteractor.swift
//  StoryboardPosts VIPER
//
//  Created by Asadulla Juraev on 16/11/21.
//

import Foundation

protocol HomeInteractorProtocol{
    func apiPostList()
    func apiPostDelete(post: Post)
}

class HomeInteractor: HomeInteractorProtocol{

    var manager: HttpManagerProtocol!
    var response: HomeResponseProtocol!
    
    func apiPostList() {
        manager.apiPostList { result in
            self.response.onLoadPosts(posts: result)
        }
    }
    
    func apiPostDelete(post: Post) {
        manager.apiPostDelete(post: post) { result in
            self.response.onPostDelete(deleted: result)
        }
    }
}
