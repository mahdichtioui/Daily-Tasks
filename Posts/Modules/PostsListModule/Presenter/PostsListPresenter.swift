//
//  PostsListPresenter.swift
//  Posts
//
//  Created by iOS Dev on 8/20/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation

class PostsListPresenter: ViewToPresenterPostsListProtocol {
    
    var view: PresenterToViewPostsListProtocol?
    
    var interactor: PresenterToInteractorPostsListProtocol?
    
    var router: PresenterToRouterPostsListProtocol?
    
    
    func fetchPosts() {
        print("Presenting...")
        interactor?.loadPosts()
    }
    
}

extension PostsListPresenter: InteractorToPresenterPostsListProtocol {
    func postsSuccess(postList: Array<Post>) {
        view?.onPostResponseSucces(postsList: postList)
    }
    
    func postsFailed() {
        view?.onPostResponseFailed(error: "Parsing Error")
    }
    
}
