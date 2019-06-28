import UIKit
import JVDebugProcessorMacros
import JVConstraintEdges

open class LoadableLabel: UIView {
    public enum State {
        case load, show(text: String)
    }

    public let activityIndicator = UIActivityIndicatorView(style: .medium)
    public let label: UILabel
    
    public init(textSetup: TextSetup, state: State) {
        self.label = UILabel(setup: textSetup)
        
        super.init(frame: .zero)
        
        layoutActivityIndicator()
        layoutLabel()
        
        change(state: state)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public func change(state: State) {
        switch state {
        case .load:
            label.text = " " // Empty the text and shrink the view
            label.isHidden = true
            
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .show(let text):
            label.text = text
            label.isHidden = false
            
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    public func change(text: String?) {
        if let text = text {
            change(state: .show(text: text))
        } else {
            change(state: .load)
        }
    }
}

extension LoadableLabel: ViewLayout {
    private func layoutLabel() {
        label.layout(in: self)
        label.layout(contentHuggingAndCompressionResistance: 998)
    }
    
    private func layoutActivityIndicator() {
        activityIndicator.layoutInMiddle(inView: self)
        activityIndicator.layout(compressionResistance: 999)
        activityIndicator.layoutSquare()
    }
}
