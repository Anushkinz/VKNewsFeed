//
//  FeedViewController.swift
//  VKNewsApp
//
//  Created by anushkinz on 5/3/22.
//

import UIKit

class FeedViewController: UIViewController {
    private let networkService = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        networkService.getFeed()
    }
    




}
