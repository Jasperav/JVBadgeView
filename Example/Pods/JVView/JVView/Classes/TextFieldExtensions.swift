import JVView
import JVChangeableValue

public extension UITextField {
    func set(font: UIFont.TextStyle, placeholderText: String) {
        
        attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [.font : UIFont.preferredFont(forTextStyle: font),
                                                                                         .foregroundColor: UIColor.placeholderText])
        
        self.font = .preferredFont(forTextStyle: font)
        textColor = .label // Check if this is needed
        
        guard self.placeholder == nil || self.placeholder!.isEmpty else {
            // The user defined a custom placeholder text, don't overwrite it.
            return
        }
        
        self.placeholder = placeholderText
    }
    
    var string: String {
        return text!
    }
}

public protocol JVTextFieldHolder {
    var textField: JVTextField { get }
}

public extension Changeable where Self: JVTextFieldHolder {
    var isChanged: Bool {
        return textField.isChanged
    }
    
    func reset() {
        textField.text = textField.oldValue
    }
}
