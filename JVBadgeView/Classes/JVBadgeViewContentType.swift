import JVContentType
import JVView

public struct ContentTypeJVBadgeView: ContentType {
    public static var allTypes = Set<ContentTypeJVBadgeView>()
    
    public var contentTypeId: String?
    public var contentTypeJVLabelText: ContentTypeJVLabelText
    public var backgroundColor: UIColor
    
}
