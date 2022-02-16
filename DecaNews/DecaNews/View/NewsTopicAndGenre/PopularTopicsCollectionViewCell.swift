//
//  PopularTopicsCollectionViewCell.swift
//  DecaNews
//
//  Created by Decagon on 16/02/2022.
//
import UIKit

class PopularTopicsCollectionViewCell: UICollectionViewCell {
   @IBOutlet var circularView: UIView?
    @IBOutlet var cellBackgroundView: UIView?
    @IBOutlet var seeMoreButton: UIButton!
    @IBOutlet var newsSource: UILabel!
    @IBOutlet var sourceLogo: UILabel!
    @IBAction func seeMoreButtonAction(_ sender: Any) {
    }
    //    rgb(216,96,93)
    
    static let identifier = "PopularTopicsCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        circularView?.layer.borderWidth = 1
        circularView?.layer.borderColor = UIColor(red: 216/255, green: 96/255, blue: 93/255, alpha:  1).cgColor
        cellBackgroundView?.layer.borderWidth = 1
        cellBackgroundView?.layer.borderColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha:  1).cgColor
    }
    var newsSourceName = ""
    func setupMyView(with article: Article) {
        newsSourceName = newsSource.text ?? ""
        newsSourceName = article.source.name ?? "Yahoo"
        let firstLetterOfSourceName = newsSourceName.first?.description ?? ""
        sourceLogo.text = firstLetterOfSourceName
        }
    }

