import UIKit
import JVView
import JVConstraintEdges
import JVDebugProcessorMacros

open class JVBadgeView: UIView {
    
    public let contentType: ContentTypeJVBadgeView
    public let label: UILabel
    
    public init(contentType: ContentTypeJVBadgeView) {
        self.contentType = contentType
        self.label = UILabel(setup: contentType.textSetup)
        
        super.init(frame: .zero)
        
        layout()
        layoutLabel()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = min(bounds.height, bounds.width) / 2
    }
}

extension JVBadgeView: ViewLayout {
    private func layout() {
        clipsToBounds = true
        backgroundColor = contentType.backgroundColor
    }
    
    private func layoutLabel() {
        label.layout(in: self, edges: contentType.edges)
        label.layout(contentHuggingAndCompressionResistance: 999)
        label.textAlignment = .center
    }
}
