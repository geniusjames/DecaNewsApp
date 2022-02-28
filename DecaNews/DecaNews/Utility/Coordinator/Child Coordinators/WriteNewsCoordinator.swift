//
//  WriteNewsCoordinator.swift
//  DecaNews
//
//  Created by JustifiedTech on 2/21/22.

import UIKit

final class WriteNewsCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    override init() {
        navigationController = UINavigationController()
    }
    
    override func start() {
        loadWriteNewsRoot()
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }

    func navigateToPreview(_ news: NewsModel) {
        let viewController = UIStoryboard(name: "WriteNews", bundle: nil).instantiateViewController(withIdentifier: "PreviewController") as? PreviewController
               guard let viewController = viewController else { return }
        viewController.goBack = {
            self.goBack()
        }
        viewController.news = news
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func loadWriteNewsRoot() {
        guard let viewController = UIStoryboard(name: "WriteNews", bundle: nil)
                .instantiateViewController(withIdentifier: "WriteNewsViewController") as? WriteNewsViewController else {
                    return
                }
        viewController.navigateToPreview = { [weak self] in
            self?.navigateToPreview(viewController.news ?? NewsModel(title: "G", content: "hi", topic: "jj"))
        }
        navigationController.pushViewController(viewController, animated: true)
    }

}
