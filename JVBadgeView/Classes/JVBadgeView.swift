import UIKit
import JVView
import JVConstraintEdges
import JVDebugProcessorMacros

open class JVBadgeView: UIView {
    
    public static let edges = ConstraintEdges(all: 5)
    
    public let contentType: ContentTypeJVBadgeView
    public let label: JVLabel
    
    public init(contentType: ContentTypeJVBadgeView, contentTypeJVLabel: ContentTypeJVLabel) {
        self.contentType = contentType
        self.label = JVLabel(contentType: contentTypeJVLabel)
        
        super.init(frame: .zero)
        
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        Unsupported()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
    }
}

extension JVBadgeView: ModelCreator {
    private func setup() {
        clipsToBounds = true
        backgroundColor = contentType.backgroundColor
        
        label.layout {
            $0.fill(toSuperview: self, edges: JVBadgeView.edges)
            
            $0.widthAnchor.constraint(greaterThanOrEqualTo: label.heightAnchor, multiplier: 1).isActive = true
            
            $0.contentHuggingAndCompressionResistance = 999
        }
        
        label.textAlignment = .center
        label.textColor = .white
    }
}
