import UIKit
import JVView
import JVConstraintEdges

open class JVBadgeView: UIView {
    
    public static let edges = ConstraintEdges(all: 5)
    
    @IBInspectable public var contentTypeId: String = "" {
        didSet {
            contentType = contentTypeId.contentTypeJVBadgeView
            setContentType()
        }
    }
    
    public var contentType: ContentTypeJVBadgeView!
    public var label: JVLabel!
    
    public init(contentType: ContentTypeJVBadgeView) {
        self.contentType = contentType
        
        super.init(frame: .zero)
        
        setContentType()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open func setContentType() {
        clipsToBounds = true
        backgroundColor = contentType.backgroundColor
        
        label = JVLabel(contentType: contentType.contentTypeJVLabelText)
        
        label.fill(toSuperview: self, edges: JVBadgeView.edges)
        
        label.widthAnchor.constraint(greaterThanOrEqualTo: label.heightAnchor, multiplier: 1).isActive = true
        label.textAlignment = .center
        label.textColor = .white
        label.setContentHuggingAndCompressionResistance(999)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
    }
}
