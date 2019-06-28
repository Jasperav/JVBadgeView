import JVContentType
import JVView
import UIKit
import JVConstraintEdges

public struct ContentTypeJVBadgeView: ContentType {
    public static var allTypes = Set<ContentTypeJVBadgeView>()
    
    public var contentTypeId: String? = nil
    public let textSetup: TextSetup
    public let backgroundColor: UIColor
    public let edges: ConstraintEdges
    
    public init(textSetup: TextSetup, backgroundColor: UIColor, edges: CGFloat) {
        self.textSetup = textSetup
        self.backgroundColor = backgroundColor
        self.edges = ConstraintEdges(all: edges)
    }
    
}
