public struct State: Codable, Hashable, Equatable, Sendable {

    public let actions: [String: String]

    public let externalVariables: Set<String>

    public let name: String

    public let transitions: [Transition]

    public let variables: [Variable]

    public init(
        actions: [String: String],
        externalVariable: Set<String>,
        name: String,
        transitions: [Transition],
        variables: [Variable]
    ) {
        self.actions = actions
        self.externalVariables = externalVariable
        self.name = name
        self.transitions = transitions
        self.variables = variables
    }

}
