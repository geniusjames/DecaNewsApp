//
//  Coordinator.swift
//  DecaNews
//
//  Created by Decagon on 16/01/2022.
//

import UIKit

typealias Observable<T> = ((T) -> Void)
typealias CoordinatorTransition = (() -> Void)

class Coordinator: NSObject {
    
    var didFinish: Observable<Coordinator>?
    
    var childCoordinators: [Coordinator] = []
    
    override init() { }
    
    func start() {}
    
    func finish() {
        didFinish?(self)
    }
    
    func pushCoordinator(_ coordinator: Coordinator) {
        // Start Coordinator
        coordinator.start()
        
        // Append to Child Coordinators
        childCoordinators.append(coordinator)
    }
    
    func popCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}

/*
 func startBookmarks() {
     let bookmarksCoordinator = BookmarksCoordinator()
     pushCoordinator(bookmarksCoordinator)
     window.rootViewController = bookmarksCoordinator.rootViewController
     window.makeKeyAndVisible()
     
     bookmarksCoordinator.didFinish = { [weak self] coordinator in
         self?.popCoordinator(coordinator)
         self?.startAuth()
     }
 }
 func startPasswordChange() {
     let changePasswordCoordinator = PasswordChangeCoordinator()
     pushCoordinator(changePasswordCoordinator)
     window.rootViewController = changePasswordCoordinator.rootViewController
     window.makeKeyAndVisible()
     
     changePasswordCoordinator.didFinish = { [weak self] coordinator in
         self?.popCoordinator(coordinator)
         self?.startAuth()
     }
 }
 
 func startWriteNews() {
     let writeNewsCoordinator = WriteNewsCoordinator()
     pushCoordinator(writeNewsCoordinator)
     window.rootViewController = writeNewsCoordinator.rootViewController
     window.makeKeyAndVisible()
     
     writeNewsCoordinator.didFinish = { [weak self] coordinator in
         self?.popCoordinator(coordinator)
         self?.startAuth()
     }
     
     func startComments() {
         let commentsCoordinator = CommentsCoordinator()
         pushCoordinator(commentsCoordinator)
         window.rootViewController = commentsCoordinator.rootViewController
         window.makeKeyAndVisible()
         
         commentsCoordinator.didFinish = { [weak self] coordinator in
             self?.popCoordinator(coordinator)
             self?.startAuth()
         }
         
     }
 }
}
 */
