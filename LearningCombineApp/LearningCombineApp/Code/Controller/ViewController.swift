//
//  ViewController.swift
//  LearningCombineApp
//
//  Created by Student23 on 30/08/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Clique aqui", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let lastPost: UILabel = {
        let lastPost = UILabel()
        lastPost.textColor = .white
        lastPost.translatesAutoresizingMaskIntoConstraints = false
        return lastPost
    }()
    
    ///Creating structure of subscriber
    lazy var lastPostSubscriber = Subscribers.Assign(object: lastPost, keyPath: \.text)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        
        ///Ad
        blogPostPublisher.subscribe(lastPostSubscriber)
        
        ///Adding views to main view
        [button, lastPost].forEach({ self.view.addSubview($0) })
        
        ///Button constraints
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: lastPost.topAnchor, constant: -30)
        ])
        
        ///Label LastPost constraints
        NSLayoutConstraint.activate([
            lastPost.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30),
            lastPost.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc func didClickButton() {
        let choosenNumOfBlogPost = Int.random(in: 0...3)
        choosenBlogPost(num: choosenNumOfBlogPost)
    }
    
    func choosenBlogPost(num: Int) {
        switch num {
        case 0:
            if let url = URL(string: "https://hackatruck.com.br") {
                ///Defining object to post in NotificationCenter
                let blogPost = BlogPost(title: "Hackatruck", url: url)
                ///Sending this object to the NotificationCenter in newBlogPost notification way. This will update the subscribers when activating the operator
                NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
            }
        case 1:
            if let url = URL(string: "https://www.eldorado.org.br") {
                let blogPost = BlogPost(title: "Instituto Eldorado", url: url)
                NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
            }
        case 2:
            if let url = URL(string: "https://www.ibm.com") {
                let blogPost = BlogPost(title: "IBM", url: url)
                NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
            }
        case 3:
            if let url = URL(string: "https://www.apple.com") {
                let blogPost = BlogPost(title: "Apple", url: url)
                NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
            }
        default:
            if let url = URL(string: "https://hackatruck.com.br") {
                let blogPost = BlogPost(title: "Hackatruck", url: url)
                NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
            }
        }
    }
}

