import JVContentType
import JVView

public struct ContentTypeJVBadgeView: ContentType {
    public static var allTypes = Set<ContentTypeJVBadgeView>()
    
    public var contentTypeId: String?
    public var contentTypeJVLabel: ContentTypeJVLabel
    public var backgroundColor: UIColor
    
    public init(contentTypeId: String?, contentTypeJVLabel: ContentTypeJVLabel, backgroundColor: UIColor) {
        self.contentTypeId = contentTypeId
        self.contentTypeJVLabel = contentTypeJVLabel
        self.backgroundColor = backgroundColor
    }
    
}
