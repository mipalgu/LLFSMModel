public struct Variable: Equatable, Hashable, Codable, Sendable {

    public let defaultValue: String?

    public let name: String

    public let type: String

    public init(defaultValue: String? = nil, name: String, type: String) {
        self.defaultValue = defaultValue
        self.name = name
        self.type = type
    }

}