//
//  ViewController.swift
//  Example
//
//  Created by Bruno Muniz on 8/13/18.
//  Copyright © 2018 Bruno Muniz. All rights reserved.
//

import UIKit
import R87AttributedString

final class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var textView: UITextView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "TermsOfUse", ofType: "txt")
        let plainText = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        let attributedString = NSMutableAttributedString(string: plainText!)

        attributedString.r87_addAttribute(name: .foregroundColor, value: UIColor.red, betweenCharacters: "*")
        attributedString.r87_setAttributes(attributes: [.foregroundColor: UIColor.green], betweenCharacters: "#")
        attributedString.r87_addAttributes(attributes: [.font: UIFont.systemFont(ofSize: 25)], betweenCharacters: "$")
        attributedString.r87_removeAttribute(name: NSAttributedStringKey.font, betweenCharacters: "-")

        textView.attributedText = attributedString
    }
}

