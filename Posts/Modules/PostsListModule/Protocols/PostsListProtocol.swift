//
//  PostsListProtocol.swift
//  Posts
//
//  Created by iOS Dev on 8/20/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation

protocol ViewToPresenterPostsListProtocol:class {
    
    var view: PresenterToViewPostsListProtocol? {get set}
    var interactor: PresenterToInteractorPostsListProtocol? {get set}
    var router: PresenterToRouterPostsListProtocol? {get set}
    
    func fetchPosts()
    
    
}

protocol PresenterToViewPostsListProtocol:class {
    func onPostResponseSucces(postsList: Array<Post>)
    func onPostResponseFailed(error: String)
}

protocol PresenterToRouterPostsListProtocol:class {
    
    static func createPostsListModule(postsListRef: PostsViewController)
    
}

protocol PresenterToInteractorPostsListProtocol:class {
    
    var presenter: InteractorToPresenterPostsListProtocol? {get set}
    func loadPosts()
    
}

protocol InteractorToPresenterPostsListProtocol:class {
    func postsSuccess(postList: Array<Post>)
    func postsFailed()
}
