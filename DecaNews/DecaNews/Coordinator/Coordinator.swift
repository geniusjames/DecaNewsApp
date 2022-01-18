//
//  Coordinator.swift
//  DecaNews
//
//  Created by Decagon on 16/01/2022.
//

import UIKit

protocol Coordinator {
    var controller: UINavigationController { get set }
    func start()
}
