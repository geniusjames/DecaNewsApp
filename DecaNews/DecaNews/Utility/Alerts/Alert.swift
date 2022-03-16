//
//  Alert.swift
//  DecaNews
//
//  Created by Geniusjames on 16/03/2022.
//

import UIKit

final class DisplayAlert {
    
    static func alert(message: String, title: String, view: UIViewController) {
       
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                view.present(alert, animated: true, completion: nil)
    }
}
