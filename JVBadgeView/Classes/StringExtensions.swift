public extension String {
    var contentTypeJVBadgeView: ContentTypeJVBadgeView {
        return ContentTypeJVBadgeView.getContentType(contentTypeId: self)
    }
}
