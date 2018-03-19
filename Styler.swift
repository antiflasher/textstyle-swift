//
//  Styler.swift
//  Styler
//
//  Created by Anton on 24/07/2017.
//  Copyright © 2017 Anton Lovchikov. All rights reserved.
//

import Foundation
import UIKit


/// The class allows to set and update styled text of UILabels by using easy API:
///
/// - `var styledText: NSAttributedString?`
/// - `func updateStyledText(_ newText: String)`

class StyledLabel : UILabel {
    
    /// Sets prepared styled text.
    ///
    /// You can compose `NSAttributedString` by yourself 
    /// or you can use plain `String` and attach a `TextStyle` to it.
    ///
    ///     "Hello world".with(mainTextStyle)
    
    var styledText : NSAttributedString? {
        didSet {
            self.attributedText = styledText
        }
    }
  
    
    
    /// Updates text using current `TextStyle`.
    /// - parameters:
    ///   - newText: Plain `String` to be set as text.
    ///              Current label `textStyle` will be applied automatically.
    ///
    /// Use this method if you need to update the text in the run time, but you don't want to deal with `textStyle` again.
    
    func updateStyledText(_ newText: String) {
        let attributedString = NSMutableAttributedString(string:newText)
        
        // Get current attributes
        let attributes = attributedText?.attributes(at:0, longestEffectiveRange:nil, in:attributedString.range)
        
        // Apply current attributes to the new string
        if let attributes = attributes {
            attributedString.addAttributes(attributes, range:NSMakeRange(0, attributedString.length))
            self.attributedText = attributedString
            
        } else {
            self.text = newText
        }
    }
}



/// The class allows to set and update styled text of UITextView by using easy API:
///
/// - `var styledText: NSAttributedString?`
/// - `func updateStyledText(_ newText: String)`

class StyledTextView: UITextView {
    
    /// Sets prepared styled text.
    ///
    /// You can compose `NSAttributedString` by yourself
    /// or you can use plain `String` and attach a `TextStyle` to it.
    ///
    ///     "Hello world".with(mainTextStyle)
    
    var styledText : NSAttributedString? {
        didSet {
            self.attributedText = styledText
        }
    }
    
    
    
    /// Updates text using current `TextStyle`.
    /// - parameters:
    ///   - newText: Plain `String` to be set as text.
    ///              Current text view `textStyle` will be applied automatically.
    ///
    /// Use this method if you need to update the text in the run time, but you don't want to deal with `textStyle` again.
    
    func updateStyledText(_ newText: String) {
        let attributedString = NSMutableAttributedString(string:newText)
        
        // Get current attributes
        let attributes = attributedText?.attributes(at:0, longestEffectiveRange:nil, in:attributedString.range)
        
        // Apply current attributes to the new string
        if let attributes = attributes {
            attributedString.addAttributes(attributes, range:NSMakeRange(0, attributedString.length))
            self.attributedText = attributedString
            
        } else {
            self.text = newText
        }
    }
}



/// The class allows to set and update styled text of UITextField by using easy API:
///
/// - `var styledText: NSAttributedString?`
/// - `func updateStyledText(_ newText: String)`
/// - `var styledPlaceholder: NSAttributedString?`
/// - `func updateStyledPlaceholder(_ newText: String)`

class StyledTextField: UITextField {
    
    
    /// Sets prepared style.
    ///
    /// Call it if you need to prepare the textField without setting initial text to it
    
    var style: TextStyle? {
        didSet {
            if let styleSecured = style {
                self.defaultTextAttributes = styleSecured.attributes()
            }
        }
    }
    
    
    
    /// Sets prepared styled text.
    ///
    /// You can compose `NSAttributedString` by yourself
    /// or you can use plain `String` and attach a `TextStyle` to it.
    ///
    ///     "Hello world".with(mainTextStyle)
    
    var styledText : NSAttributedString? {
        didSet {
            if let attrTextSecured = styledText {
                self.attributedText = attrTextSecured
                if attrTextSecured.string.count > 0 {
                    let attributes = attrTextSecured.attributes(at:0, longestEffectiveRange:nil, in:attrTextSecured.range)
                    var stringAttributes : [String : Any] = [:]
                    for attr in attributes {
                        stringAttributes[attr.key.rawValue] = attr.value
                    }
                    self.defaultTextAttributes = stringAttributes
                } else {
                    NSLog("To set a style without setting initial text, use UITextField.style attribute")
                }
            }
        }
    }
    
    
    
    /// Updates text using current `TextStyle`.
    /// - parameters:
    ///   - newText: Plain `String` to be set as text.
    ///              Current text field text `textStyle` will be applied automatically.
    ///
    /// Use this method if you need to update the text in the run time, but you don't want to deal with `textStyle` again.
    
    func updateStyledText(_ newText: String) {
        let attributedString = NSMutableAttributedString(string:newText)
        
        // Get current attributes
        let attributes = self.attributedText?.attributes(at:0, longestEffectiveRange:nil, in:attributedString.range)
        
        if let attributes = attributes {
            attributedString.addAttributes(attributes, range:NSMakeRange(0, attributedString.length))
            self.attributedText = attributedString
            
        } else {
            self.text = newText
        }
    }
    
    
    
    /// Sets prepared styled placeholder.
    ///
    /// You can compose `NSAttributedString` by yourself
    /// or you can use plain `String` and attach a `TextStyle` to it.
    ///
    ///     "Hello world".with(mainTextStyle)
    
    var styledPlaceholder : NSAttributedString? {
        didSet {
            if let attrTextSecured = styledPlaceholder {
                self.attributedPlaceholder = attrTextSecured
            }
        }
    }
    
    
    
    /// Updates placeholder using current `TextStyle`.
    /// - parameters:
    ///   - newText: Plain `String` to be set as placeholder.
    ///              Current text field placeholder `textStyle` will be applied automatically.
    ///
    /// Use this method if you need to update the placeholder in the run time, but you don't want to deal with `textStyle` again.
    
    func updateStyledPlaceholder(_ newPlaceholder: String) {
        let attributedString = NSMutableAttributedString(string:newPlaceholder)
        
        // Get current attributes
        let attributes = attributedText?.attributes(at:0, longestEffectiveRange:nil, in:NSRange(location: 0, length: attributedString.length))
        
        if let attributes = attributes {
            attributedString.addAttributes(attributes, range:NSMakeRange(0, attributedString.length))
            self.attributedPlaceholder = attributedString
            
        } else {
            self.placeholder = newPlaceholder
        }
    }
}



/// The class allows to set and update styled title of UIButton by using easy API:
///
/// - `func setStyledTitle(_ title: NSAttributedString, for state: UIControlState)`
/// - `func updateStyledTitle(_ newTitle: String, for state: UIControlState)`

class StyledButton : UIButton {
    
    /// Sets prepared styled title for state.
    ///
    /// - parameters:
    ///   - title: `NSAttributedString` with desired style applied
    ///   - state: `UIControlState`for which the title should be set
    ///
    /// You can compose `NSAttributedString` by yourself
    /// or you can use plain `String` and attach a `TextStyle` to it.
    ///
    ///     "Hello world".with(mainTextStyle)
    
    func setStyledTitle(_ title: NSAttributedString, for state: UIControlState) {
        self.setAttributedTitle(title, for:state)
    }
    
    
    
    /// Updates title using current `TextStyle`.
    /// - parameters:
    ///   - newTitle: Plain `String` to be set as title.
    ///               Current button title `textStyle` for given `state` will be applied automatically.
    ///   - state: `UIControlState`for which the title should be updated
    ///
    /// Use this method if you need to update the placeholder in the run time, but you don't want to deal with `textStyle` again.
    
    func updateStyledTitle(_ newTitle: String, for state: UIControlState) {
        let attributedString = NSMutableAttributedString(string:newTitle)
        
        // Get current attributes
        let attributes = self.attributedTitle(for:state)?.attributes(at:0, longestEffectiveRange:nil, in:NSRange(location: 0, length: attributedString.length))
        
        if let attributes = attributes {
            attributedString.addAttributes(attributes, range:NSMakeRange(0, attributedString.length))
            self.setAttributedTitle(attributedString, for:state)
            
        } else {
            self.setTitle(newTitle, for:state)
        }
    }
}



/// The extension allows to attach a `TextStyle` by using:
///
/// - `func with(_ style:TextStyle) -> NSAttributedString`

extension String {
    
    /// Attaches a `TextStyle` and composes an NSAttributedString.
    /// - parameters:
    ///   - style: A prepared `TextStyle`
    /// 
    /// - returns:
    ///   An NSAttributedString ready to be set as `attributedText`
    ///
    /// Use this method if you need to update the placeholder in the run time, but you don't want to deal with `textStyle` again.
    
    func with(_ style:TextStyle) -> NSAttributedString {
        return style.composeAttributedString(with:self)
    }
}



/// The struct storing styles you composed.

struct TextStyle : Hashable {
    
    var fontName : String
    // PostScript name. System font name by default
    
    var fontSize : CGFloat
    // In points. System size (17 points) by default
    
    fileprivate var font : UIFont
    // Composed font
    
    var lineSpacing : CGFloat
    // Absolute value in points (pick it right from a Sketch file).
    // Standard font line-height by default
    
    fileprivate var relativeLineSpacing : CGFloat
    // Relative value representing additional spacing value
    
    var characterSpacing : CGFloat
    // In points. 0 by default
    
    var textColor : UIColor
    // Black by default
    
    var backgroundColor : UIColor
    // Clear by default
    
    var underlineStyle : NSUnderlineStyle
    // None by default
    
    var strickingStyle : NSUnderlineStyle
    // None by default
    
    var alignment : NSTextAlignment
    // Natural by default
    
    
    
    /// Creates a `TextView` struct.
    /// - parameters:
    ///   - fontName: **PostScript** name. System font name by default
    ///   - fontSize: In points. System size (17 points) by default
    ///   - lineSpacing: **Absolute value** in points (pick it right from a Sketch file). Standard font line-height by default
    ///   - characterSpacing: Aka Kerning. 0 by default
    ///   - color: A prepared UIColor. Black by default
    ///   - alignment: An NSTextAlignment. Natural by default
    ///
    /// You can set only parameters you care about. Parameters you haven't provided will be set to the default values.
    
    init(fontName: String = UIFont.systemFont(ofSize:1).fontName,
         fontSize: CGFloat = UIFont.systemFontSize,
         lineSpacing: CGFloat? = nil,
         characterSpacing: CGFloat = 0,
         textColor: UIColor = UIColor.black,
         backgroundColor: UIColor = UIColor.clear,
         underlineStyle: NSUnderlineStyle = .styleNone,
         strickingStyle: NSUnderlineStyle = .styleNone,
         alignment : NSTextAlignment = .natural){
        
        self.fontName = fontName
        self.fontSize = fontSize
        
        let composedFont = UIFont(name:fontName, size:fontSize)
        self.font = (composedFont != nil) ? composedFont! : UIFont.systemFont(ofSize:UIFont.systemFontSize)
        
        // Prepare relative line spacing
        if let lineSpacing = lineSpacing {
            
            self.lineSpacing = lineSpacing
            
            if let lineHeight = UIFont(name:fontName, size:fontSize)?.lineHeight {
                self.relativeLineSpacing = lineSpacing - lineHeight
            } else {
                self.relativeLineSpacing = lineSpacing - 20 // Default value
            }
        } else {
            
            self.relativeLineSpacing = 0
            
            if let lineHeight = UIFont(name:fontName, size:fontSize)?.lineHeight {
                self.lineSpacing = lineHeight
            } else {
                self.lineSpacing = 20
            }
        }
        
        self.characterSpacing = characterSpacing
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.underlineStyle = underlineStyle
        self.strickingStyle = strickingStyle
        self.alignment = alignment
    }
    
    
    
    /// Changes fontSize property of the basic style
    mutating func fontName(_ fontName: String) -> TextStyle {
        self.fontName = fontName
        if let font = UIFont(name:fontName, size:fontSize) {
            self.font = font
        }
        return self
    }
    
    /// Changes fontSize property of the basic style
    mutating func fontSize(_ fontSize: CGFloat) -> TextStyle {
        self.fontSize = fontSize
        if let font = UIFont(name:self.font.fontName, size:fontSize) {
            self.font = font
        }
        return self
    }
    
    /// Changes lineSpacing property of the basic style
    mutating func lineSpacing(_ lineSpacing: CGFloat) -> TextStyle {
        self.lineSpacing = lineSpacing
        return self
    }
    
    /// Changes characterSpacing property of the basic style
    mutating func characterSpacing(_ spacing: CGFloat) -> TextStyle {
        self.characterSpacing = spacing
        return self
    }
    
    /// Changes textColor property of the basic style
    mutating func textColor(_ color: UIColor) -> TextStyle {
        self.textColor = color
        return self
    }
    
    /// Changes backgroundColor property of the basic style
    mutating func backgroundColor(_ backgroundColor: UIColor) -> TextStyle {
        self.backgroundColor = backgroundColor
        return self
    }
    
    /// Changes underlineStyle property of the basic style
    mutating func underlineStyle(_ underlineStyle: NSUnderlineStyle) -> TextStyle {
        self.underlineStyle = underlineStyle
        return self
    }
    
    /// Changes strickingStyle property of the basic style
    mutating func strickingStyle(_ strickingStyle: NSUnderlineStyle) -> TextStyle {
        self.strickingStyle = strickingStyle
        return self
    }
    
    /// Changes alignment property of the basic style
    mutating func alignment(_ alignment: NSTextAlignment) -> TextStyle {
        self.alignment = alignment
        return self
    }
}



// Technical stuff

extension String {
    fileprivate var range : NSRange {
        get {
            return NSRange(location: 0, length: self.count)
        }
    }
}

extension NSAttributedString {
    fileprivate var range : NSRange {
        get {
            return NSRange(location: 0, length: self.length)
        }
    }
}

extension TextStyle {
    
    fileprivate func composeAttributedString(with text:String) -> NSAttributedString {
        
        // Text preparation
        let attributedString = NSMutableAttributedString(string:text)
        
        // Compose text attributes
        let attributes = self.сomposeAttributes()
        
        // Apply attributes
        attributedString.addAttributes(attributes, range:NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    private func сomposeAttributes() -> [NSAttributedStringKey : Any] {
        
        var attributes : [NSAttributedStringKey : Any] = [:]
        
        // Apply font parameter
        attributes[NSAttributedStringKey.font] = self.font
        
        // Apply text color parameter
        attributes[NSAttributedStringKey.foregroundColor] = self.textColor
        
        // Apply background color parameter
        attributes[NSAttributedStringKey.backgroundColor] = self.backgroundColor
        
        // Apply undercrossing
        attributes[NSAttributedStringKey.underlineStyle] = self.underlineStyle.rawValue
        
        // Apply stricking
        attributes[NSAttributedStringKey.strikethroughStyle] = NSNumber(value: self.strickingStyle.rawValue)
        
        // Apply line spacing
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = self.relativeLineSpacing
        
        // Apply alignment
        paragraphStyle.alignment = self.alignment
        attributes[NSAttributedStringKey.paragraphStyle] = paragraphStyle
        
        // Apply character spacing
        attributes[NSAttributedStringKey.kern] = self.characterSpacing
        
        return attributes
        
    }
    
    func attributes() -> [String : Any] {
        let attributes = self.сomposeAttributes()
        var translatedAttrs: [String : Any] = [:]
        for (key, value) in attributes {
            translatedAttrs[key.rawValue] = value
        }
        return translatedAttrs
    }
    
    var hashValue: Int {
        get {
            let fontNameHash = fontName.hashValue
            let fontSizeHash = fontSize.hashValue
            let lineSpacingHash = lineSpacing.hashValue
            let relativeLineSpacingHash = relativeLineSpacing.hashValue
            let characterSpacingHash = characterSpacing.hashValue
            let textColorHash = textColor.hashValue
            let backgroundColorHash = backgroundColor.hashValue
            let underlineStyleHash = underlineStyle.hashValue
            let strickingStyleHash = strickingStyle.hashValue
            let alignmentHash = alignment.hashValue
            
            return fontNameHash + fontSizeHash + lineSpacingHash + relativeLineSpacingHash + characterSpacingHash + textColorHash + backgroundColorHash + underlineStyleHash + strickingStyleHash + alignmentHash
        }
    }
    
    static func == (lhs: TextStyle, rhs: TextStyle) -> Bool {
        return
            lhs.hashValue == rhs.hashValue
    }
}
