//
//  IndicatorLabel.swift
//  DecaNews
//
//  Created by Geniusjames on 22/01/2022.
//

import UIKit

class IndicatorLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        self.setup()
    }
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.setup()
    }
    private func setup() {
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
}
