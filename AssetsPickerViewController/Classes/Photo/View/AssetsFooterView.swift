//
//  AssetsPhotoFooterView.swift
//  Pods
//
//  Created by DragonCherry on 5/18/17.
//
//

import UIKit

open class AssetsPhotoFooterView: UICollectionReusableView {

    var contentInset: UIEdgeInsets? {
        didSet {
            var topInset: CGFloat = 0
            if let contentInset = self.contentInset {
                topInset = contentInset.bottom
            }
            self.topConstraint?.constant = topInset
        }
    }

    private var topConstraint: NSLayoutConstraint?

    private let countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(forStyle: .subheadline, weight: .semibold)
        label.textColor = .darkText
        return label
    }()

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        addSubview(countLabel)

        countLabel.translatesAutoresizingMaskIntoConstraints = false
        self.topConstraint = countLabel.topAnchor.constraint(equalTo: self.topAnchor)
        self.topConstraint?.isActive = true
        countLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        countLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }


    open func set(imageCount: Int, videoCount: Int) {
        var countText: String?
        if imageCount > 0 && videoCount > 0 {
            countText = String(
                format: String(key: "Footer_Items"),
                NumberFormatter.decimalString(value: imageCount), NumberFormatter.decimalString(value: videoCount))
        } else if imageCount > 0 {
            countText = String(
                format: String(key: "Footer_Photos"),
                NumberFormatter.decimalString(value: imageCount))
        } else if videoCount > 0 {
            countText = String(
                format: String(key: "Footer_Videos"),
                NumberFormatter.decimalString(value: videoCount))
        } else {
            countText = ""
        }
        countLabel.text = countText
    }
}
