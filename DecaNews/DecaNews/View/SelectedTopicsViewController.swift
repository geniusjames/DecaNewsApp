//
//  SelectedTopicsViewController.swift
//  DecaNews
//
//  Created by Decagon on 30/01/2022.
//

import UIKit

final class SelectedTopicsViewController: UIViewController {

    @IBOutlet weak var gymFitnessButton: UIButton!
    @IBOutlet weak var recipesButton: UIButton!
    @IBOutlet weak var healthButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var natureButton: UIButton!
    @IBOutlet weak var entertainmentButton: UIButton!
    @IBOutlet weak var educationButton: UIButton!
    @IBOutlet weak var writingButton: UIButton!
    @IBOutlet weak var architectureButton: UIButton!
    @IBOutlet weak var photographyButton: UIButton!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var designButton: UIButton!
    @IBOutlet weak var businessButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    var buttonStore = [Int: Bool]()
    
    var coordinator: MainCoordinator?
    var viewModel: ViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        var buttons: [UIButton] = [musicButton, businessButton, designButton, bookButton, photographyButton,
                       architectureButton, writingButton, educationButton, entertainmentButton,
                       natureButton, travelButton, sportsButton, healthButton, recipesButton, gymFitnessButton]
        for button in buttons {
            buttonStore[button.tag] = false
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        }
        // Do any additional setup after loading the view.
    }
    
    @objc
    func buttonClicked(_ sender: Any) {
        guard let button = sender as? UIButton, let buttonState = buttonStore[button.tag]  else { return }
        if buttonState {
            buttonStore[button.tag] = false
            button.tintColor = UIColor(named: "grey")
            button.setTitleColor(UIColor(named: "lightBlack"), for: .normal)
        } else {
            buttonStore[button.tag] = true
            button.tintColor = UIColor(named: "lightBlack")
            button.setTitleColor(UIColor(named: "offWhite"), for: .normal)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func getStarted(_ sender: Any) {
    }
}
