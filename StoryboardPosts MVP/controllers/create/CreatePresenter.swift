//
//  CreatePresenter.swift
//  StoryboardPosts MVP
//
//  Created by Asadulla Juraev on 09/11/21.
//

import Foundation

protocol CreatePresenterProtocol: CreateRequestProtocol {
    func apiCreatePost(post: Post)
    
}

class CreatePresenter: CreatePresenterProtocol{
    
    var interactor: CreateInteractorProtocol!
    var routing: CreateRoutingProtocol!
    
    var controller: BaseViewController!
    
    func apiCreatePost(post: Post) {
        controller.showProgress()
        interactor.apiCreatePost(post: post)
    }
    
}
