//
//  R87AttributedString.swift
//  R87AttributedString
//
//  Created by Bruno Muniz Azevedo Filho on 27/10/17.
//  Copyright © 2017 bmaf. All rights reserved.
//
import UIKit
extension NSMutableAttributedString {

	//MARK - Changing attributes
	/** Same as setAttributes:range: in NSAttributedString class but this method sets the attribute between certain characters.
	The following example sets red text color to the "This is a *red* word." text:
	attributedString.r87_setAttributes(attributes: [NSAttributedStringKey.foregroundColor : UIColor.red], betweenCharacters: "*")
	The result is: "This is a red word." where the red word's color is red.
	*/

	public func r87_setAttributes(attributes: Dictionary<NSAttributedStringKey, Any>, betweenCharacters: String) {
		let ranges: Array = self.r87_findRangesWithCharaters(charactersToFind: betweenCharacters)
		for obj in ranges {
			let thisValue: NSValue = obj as NSValue
			let range: NSRange = thisValue.rangeValue
			self.setAttributes(attributes, range: range)
		}
	}

	/** Same as addAttribute:value:range: in NSAttributedString class but this method adds the attribute between certain characters.
	The following example adds red text color to the "This is a *red* word." text:
	attributedString.r87_addAttribute(name: NSAttributedStringKey.foregroundColor, value: UIColor.red, betweenCharacters: "*")
	The result is: "This is a red word." where the red word's color is red.
	*/

	public func r87_addAttribute(name: NSAttributedStringKey, value: Any, betweenCharacters: String) {
		let ranges: Array = self.r87_findRangesWithCharaters(charactersToFind: betweenCharacters)
		for obj in ranges {
			let thisValue: NSValue = obj as NSValue
			let range: NSRange = thisValue.rangeValue
			self.addAttribute(name, value: value, range: range)
		}
	}

	/** Same as addAttributes:range: in NSAttributedString class but this method adds the attribute between certain characters.
	The following example adds red text color to the "This is a *red* word." text:
	attributedString.r87_addAttributes(attributes: [NSAttributedStringKey.foregroundColor : UIColor.red], betweenCharacters: "*")
	The result is: "This is a red word." where the red word's color is red.
	*/

	public func r87_addAttributes(attributes: Dictionary<NSAttributedStringKey, Any>, betweenCharacters: String) {
		let ranges: Array = self.r87_findRangesWithCharaters(charactersToFind: betweenCharacters)
		for obj in ranges {
			let thisValue: NSValue = obj as NSValue
			let range: NSRange = thisValue.rangeValue
			
			self.addAttributes(attributes, range: range)
		}
	}

	/** Same as removeAttribute:range: in NSAttributedString class but this method removes the attribute between certain characters.
	The following example removes red text color from the "This is a *red* word." text:
	attributedString.r87_removeAttribute(name: NSAttributedStringKey.foregroundColor, betweenCharacters: "*")
	The result is: "This is a red word." where the red word's color is not red any more.
	*/

	public func r87_removeAttribute(name: NSAttributedStringKey, betweenCharacters: String) {
		let ranges: Array = self.r87_findRangesWithCharaters(charactersToFind: betweenCharacters)
		for obj in ranges {
				let thisValue: NSValue = obj as NSValue
				let range: NSRange = thisValue.rangeValue
				self.removeAttribute(name, range: range)
		}
	}

	// Returns an array of NSValue object which contains NSRange structures.
	public func r87_findRangesWithCharaters(charactersToFind: String) -> Array<NSValue> {
		let resultArray = NSMutableArray()
		var insideTheRange: Bool = false
		var startingRangeLocation: Int = 0

		while self.mutableString.range(of: charactersToFind).location != NSNotFound {
			let charactersLocation: NSRange! = self.mutableString.range(of: charactersToFind)

			if !insideTheRange {
				startingRangeLocation = charactersLocation.location
				insideTheRange = true

				// remove characters
				self.mutableString.deleteCharacters(in: charactersLocation)
			}
			else {
				let range: NSRange! = NSMakeRange(startingRangeLocation, charactersLocation.location - startingRangeLocation)
				insideTheRange = false

				resultArray.add(NSValue.init(range: range))
				// remove characters
				self.mutableString.deleteCharacters(in: charactersLocation)
			}
		}
		return resultArray.copy() as! Array
	}
}
