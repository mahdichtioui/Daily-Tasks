//
//  PostsListRouter.swift
//  Posts
//
//  Created by iOS Dev on 8/20/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import UIKit

class PostsListRouter: PresenterToRouterPostsListProtocol {
    
    class func createPostsListModule(postsListRef: PostsViewController) {
        print("Routing")
        
//        let presenter: ViewToPresenterPostsListProtocol & InteractorToPresenterPostsListProtocol = PostsListPresenter()
//        let interactor: PresenterToInteractorPostsListProtocol = PostsListInteractor()
//        let router: PresenterToRouterPostsListProtocol = PostsListRouter()
//
//        postsListRef.postsPresenter = presenter
//        presenter.view = postsListRef
//        presenter.router = router
//        presenter.interactor = interactor
//        interactor.presenter = presenter
        
        let presenter: ViewToPresenterPostsListProtocol & InteractorToPresenterPostsListProtocol = PostsListPresenter()
        
        postsListRef.postsPresenter = presenter
        postsListRef.postsPresenter?.router = PostsListRouter()
        postsListRef.postsPresenter?.view = postsListRef
        postsListRef.postsPresenter?.interactor = PostsListInteractor()
        postsListRef.postsPresenter?.interactor?.presenter = presenter
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
