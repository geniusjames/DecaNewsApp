//
//  WriteNewsCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 2/21/22.
//

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
    
    func loadWriteNewsRoot() {
        guard let viewController = UIStoryboard(name: "WriteNews", bundle: nil)
                .instantiateViewController(withIdentifier: "WriteNewsViewController") as? WriteNewsViewController else {
                    return
                }
        
        viewController.didClickPreview = { [weak self] in
            self?.finish()
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
