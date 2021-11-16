//
//  HomePresenter.swift
//  StoryboardPosts MVP
//
//  Created by Asadulla Juraev on 09/11/21.
//

import Foundation

protocol HomePresenterProtocol : HomeRequestProtocol {
    func apiPostList()
    func apiPostDelete(post: Post)
    
    func navigateCreateScreen()
    func navigateEditScreen(id: String)
}

class HomePresenter: HomePresenterProtocol{
    
    var interactor: HomeInteractorProtocol!
    var routing: HomeRoutingProtocol!
    
    var controller: BaseViewController!
    
    func apiPostList(){
        controller?.showProgress()
        interactor.apiPostList()
    }

    func apiPostDelete(post: Post){
        controller?.showProgress()
        interactor.apiPostDelete(post: post)
    }
    
    func navigateCreateScreen() {
        routing.navigateCreateScreen()
    }
    
    func navigateEditScreen(id: String) {
        routing.navigateEditScreen(id: id)
    }
    
}
