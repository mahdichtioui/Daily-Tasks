//
//  ViewController.swift
//  Posts
//
//  Created by iOS Dev on 8/20/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listPosts : [Post] = []
    var postsPresenter: ViewToPresenterPostsListProtocol?    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Starting...")
        PostsListRouter.createPostsListModule(postsListRef: self)
        print("Start Fetching...")
        postsPresenter?.fetchPosts()

    }

}

extension PostsViewController: PresenterToViewPostsListProtocol {
    
    func onPostResponseSucces(postsList: Array<Post>) {
        self.listPosts = postsList
        self.tableView.reloadData()
        //print(listPosts)
    }
    
    func onPostResponseFailed(error: String) {
        print(error)
    }
}

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        cell.textLabel?.text = "task \(indexPath.row): \(self.listPosts[indexPath.row].title!)"
        
        return cell
    }
    
    
}

