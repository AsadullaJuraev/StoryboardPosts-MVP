//
//  EditViewController.swift
//  StoryboardPosts MVP
//
//  Created by Asadulla Juraev on 09/11/21.
//

import UIKit

protocol EditRequestProtocol {
    func apiCallPost(id: Int)
    func apiEditPost(id: Int, post: Post)
}

protocol EditResponseProtocol{
        func onCallPost(post: Post)
        func onEditPost(status: Bool)
}

class EditViewController: BaseViewController, EditResponseProtocol {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var PostID: String = "1"
    var post : Post = Post()
    var presenter: EditRequestProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViper()
        presenter?.apiCallPost(id: Int(PostID)!)
    }
    
    @IBAction func buttonSend(_ sender: Any) {
        presenter?.apiEditPost(id: Int(PostID)!, post: Post(title: titleTextField.text!, body: bodyTextView.text!))
    }
    
    func initViews() {
        bodyLabel.text = "Body"
        titleLabel.text = "Title"
        DispatchQueue.main.async {
            self.bodyTextView.text = self.post.body!
            self.titleTextField.text = self.post.title!
        }
    }
    
    func configureViper(){
        let manager = HttpManager()
        let presenter = EditPresenter()
        let interactor = EditInteractor()
        let routing = EditRouting()
        
        presenter.controller = self
        
        self.presenter = presenter
        presenter.interactor = interactor
        presenter.routing = routing
        routing.viewController = self
        interactor.manager = manager
        interactor.response = self
    }
    
    func onCallPost(post: Post) {
        self.hideProgress()
        if post != nil {
            self.post = post
            initViews()
        }else{
            // error message
        }
    }
    
    func onEditPost(status: Bool) {
        self.hideProgress()
        if status{
            self.dismiss(animated: false, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }else{
            // error message
        }
    }

}
