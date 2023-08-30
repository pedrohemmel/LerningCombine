//
//  NotificationNameExtension.swift
//  LearningCombineApp
//
//  Created by Student23 on 30/08/23.
//

import UIKit

extension Notification.Name {
    ///Creating a new notification way
    static let newBlogPost = Notification.Name("new_blog_post")
}

///Creating the publisher and associating to the newBlogPostNotification way
let blogPostPublisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost)
    ///This is our operator for when we post in the NotificationCenter in newBlogPost notification way, this map will be called
    .map { (notification) -> String? in
        ///Returning the title of the object sent to blogPostPublisher to the subscribers
        return (notification.object as? BlogPost)?.title ?? ""
    }
