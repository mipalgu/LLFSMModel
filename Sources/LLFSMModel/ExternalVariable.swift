public struct ExternalVariable: Equatable, Hashable, Codable, Sendable {

    public enum Mode: String, Equatable, Hashable, Codable, Sendable {

        case input

        case inputOutput

        case output
    }

    public let defaultValue: String?

    public let mode: Mode

    public let name: String

    public let type: String

    public init(defaultValue: String? = nil, mode: Mode, name: String, type: String) {
        self.defaultValue = defaultValue
        self.mode = mode
        self.name = name
        self.type = type
    }

}