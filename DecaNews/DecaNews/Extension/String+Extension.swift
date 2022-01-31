//
//  UITextField+Extension.swift
//  DecaNews
//
//  Created by Decagon on 30/01/2022.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        return self.contains("@") && self.contains(".")
    }
}
