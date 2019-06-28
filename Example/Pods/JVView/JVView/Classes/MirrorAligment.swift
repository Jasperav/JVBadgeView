import UIKit
import JVCurrentDevice

public struct TextSetup {
    public var font: UIFont.TextStyle
    public var color: UIColor
    public var text: (() -> (String?))
    
    public init(font: UIFont.TextStyle = .body, color: UIColor = .label, text: String? = nil) {
        self.font = font
        self.color = color
        self.text = { return text }
    }
    
    public init(font: UIFont.TextStyle = .body, color: UIColor = .label, text: @escaping (() -> (String?))) {
        self.font = font
        self.color = color
        self.text = text
    }
}

// This isnt needed I think if the aligment is set to natural
public extension UILabel {
    
    convenience init(color: UIColor) {
        self.init(setup: TextSetup(color: color))
    }
    
    convenience init(text: String) {
        self.init(setup: TextSetup(text: text))
    }
    
    convenience init(font: UIFont.TextStyle) {
        self.init(setup: TextSetup(font: font))
    }
    
    convenience init(setup: TextSetup = TextSetup()) {
        self.init()
        
        update(setup: setup)
        
        // enables dynamic font sizes
        adjustsFontForContentSizeCategory = true
    }
    
    func mirrorAligmentIfRightToLeftLanguage() {
        if CurrentDevice.isRightToLeftLanguage {
            if textAlignment == .left {
                textAlignment = .right
            } else if textAlignment == .right {
                textAlignment = .left
            }
        }
    }
    
    func update(setup: TextSetup) {
        font = .preferredFont(forTextStyle: setup.font)
        textColor = setup.color
        text = setup.text()
    }
    
    // https://spin.atomicobject.com/2018/02/02/swift-scaled-font-bold-italic/
    // TODO: Check for performance problems: https://stackoverflow.com/questions/34954956/why-uifontdescriptorsize-is-x200-slower-than-uifontnamesize
    @discardableResult
    func change(traits: UIFontDescriptor.SymbolicTraits) -> UILabel {
        let descriptor = font.fontDescriptor.withSymbolicTraits(traits)
        
        font = UIFont(descriptor: descriptor!, size: 0) //size 0 means keep the size as it is
        
        return self
    }
    
}
