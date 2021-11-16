//
//  EditPresenter.swift
//  StoryboardPosts MVP
//
//  Created by Asadulla Juraev on 09/11/21.
//

import Foundation

protocol EditPresenterProtocol: EditRequestProtocol {
    func apiCallPost(id: Int)
    func apiEditPost(id: Int, post: Post)
}

class EditPresenter: EditPresenterProtocol{
    
    var interactor: EditInteractorProtocol!
    var routing: EditRoutingProtocol!
    
    var controller: BaseViewController!
    
    func apiCallPost(id: Int) {
        controller.showProgress()
        interactor.apiCallPost(id: id)
    }
    
    func apiEditPost(id: Int, post: Post) {
        controller.showProgress()
        interactor.apiEditPost(id: id, post: post)
    }
}
