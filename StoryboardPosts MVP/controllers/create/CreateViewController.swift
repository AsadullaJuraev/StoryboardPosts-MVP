//
//  CreateViewController.swift
//  StoryboardPosts MVP
//
//  Created by Asadulla Juraev on 09/11/21.
//

import UIKit

protocol CreateRequestProtocol{
    func apiCreatePost(post: Post)
}

protocol CreateResponseProtocol {
    func onCreated(status: Bool)
}

class CreateViewController: BaseViewController, CreateResponseProtocol {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var presenter: CreateRequestProtocol!
    var item = Post()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      initViews()
    }

    func initViews(){
        titleLabel.text = "Title"
        bodyLabel.text = "Body"
        configureViper()
        let add = UIImage(named: "ic_send")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: add, style: .plain, target: self, action: #selector(rightTapped))
    }

    func configureViper(){
        let manager = HttpManager()
        let presenter = CreatePresenter()
        let interactor = CreateInteractor()
        let routing = CreateRouting()
        
        presenter.controller = self
        
        self.presenter = presenter
        presenter.interactor = interactor
        presenter.routing = routing
        routing.viewController = self
        interactor.manager = manager
        interactor.response = self
    }
    
    @objc func rightTapped(){
        if titleField.text != "" && bodyTextView.text != "" {
            presenter?.apiCreatePost(post: Post(title: titleField.text!, body: bodyTextView.text!))
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
    }
    
    func onCreated(status: Bool) {
        if status {
            self.navigationController?.popViewController(animated: true)
        }else{
            // something went wrong! 😐
        }
        
    }

}
