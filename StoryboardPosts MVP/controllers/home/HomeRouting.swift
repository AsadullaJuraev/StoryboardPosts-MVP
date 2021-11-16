//
//  HomeRouting.swift
//  StoryboardPosts MVP
//
//  Created by Asadulla Juraev on 16/11/21.
//

import Foundation

protocol HomeRoutingProtocol{
    func navigateCreateScreen()
    func navigateEditScreen(id: String)
}

class HomeRouting: HomeRoutingProtocol{
    weak var viewController: HomeViewController!
    
    func navigateCreateScreen() {
        viewController.callCreateViewController()
    }
    
    func navigateEditScreen(id: String) {
        viewController.callEditViewController(id: id)
    }
    
}
