public struct Transition: Codable, Hashable, Equatable, Sendable {

    public let target: String

    public let condition: String

    public init(target: String, condition: String) {
        self.target = target
        self.condition = condition
    }

}