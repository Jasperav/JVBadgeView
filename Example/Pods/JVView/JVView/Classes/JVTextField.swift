import UIKit
import JVConstraintEdges
import JVChangeableValue
import JVInputValidator
import JVDebugProcessorMacros

open class JVTextField: UITextField, UITextFieldDelegate, ChangeableValues, InputValidateable {
    
    public var currentValue = ""
    public var oldValue = ""
    public var hasChanged: ((Bool) -> ())?
    
    /// Will actually block input of the user.
    public var validationBlockUserInput: ((String) -> (Bool))
    
    /// Won't block input of the user, but changes the validation state
    public var validationToChangeValidationState: ((String) -> (Bool))
    
    public var inputValidator = InputValidator(validationState: .valid)
    
    public var didReturn: (() -> ())?
    
    public init(setup: TextSetup = TextSetup(),
                placeholderText: String? = nil,
                validationBlockUserInput: @escaping ((String) -> (Bool)) = { _ in return false },
                validationToChangeValidationState: ((String) -> (Bool))? = nil) {
        self.validationBlockUserInput = validationBlockUserInput
        self.validationToChangeValidationState = validationToChangeValidationState ?? validationBlockUserInput
        
        super.init(frame: .zero)
        // enables dynamic font sizes
        adjustsFontForContentSizeCategory = true
        
        delegate = self
        text = setup.text()
        
        set(font: setup.font, placeholderText: placeholderText ?? "")
        
        assert(self.validationBlockUserInput(string))
        
        guard let text = text else { return }
        
        updateValidationState()
        assert(self.validationBlockUserInput(text))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newValue: String
        
        // https://stackoverflow.com/questions/25621496/how-shouldchangecharactersinrange-works-in-swift
        // With the newValue property, we also want to include the added/removed character
        if let text = self.text, let textRange = Range(range, in: text) {
            newValue = text.replacingCharacters(in: textRange, with: string)
        } else {
            newValue = ""
        }
        
        let pressedBackSpaceAndHasPlaceHolderText = newValue.isEmpty && placeholder != nil
        
        guard validationBlockUserInput(newValue) || pressedBackSpaceAndHasPlaceHolderText else { return false }
        
        currentValue = newValue
        
        updateValidationState()
        
        hasChanged?(isChanged)
        
        return true
    }
    
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        didReturn?()
        
        return true
    }
    
    private func updateValidationState() {
        inputValidator.update(isValid: validationToChangeValidationState(string))
    }
}
