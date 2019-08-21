//
//  PostsListInteractor.swift
//  Posts
//
//  Created by iOS Dev on 8/20/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation

class PostsListInteractor: PresenterToInteractorPostsListProtocol {
    var presenter: InteractorToPresenterPostsListProtocol?
    
    func loadPosts() {
        PostService.getPosts(){ (list, error)  in
            print("interactor working...")
            if error == nil {
                self.presenter?.postsSuccess(postList: list!)
            }else{
                self.presenter?.postsFailed()
            }
        }
    }
    

}
