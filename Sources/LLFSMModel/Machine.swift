public struct Machine: Codable, Equatable, Hashable, Sendable {

    public let externalVariables: [ExternalVariable]

    public let globalVariables: [Variable]

    public let initialState: String

    public let name: String

    public let parameters: [Variable]

    public let returnables: [Variable]

    public let states: [State]

    public let suspendedState: String?

    public let variables: [Variable]

    public init(
        externalVariables: [ExternalVariable],
        globalVariables: [Variable],
        initialState: String,
        name: String,
        parameters: [Variable],
        returnables: [Variable],
        states: [State],
        suspendedState: String? = nil,
        variables: [Variable]
    ) {
        self.externalVariables = externalVariables
        self.globalVariables = globalVariables
        self.initialState = initialState
        self.name = name
        self.parameters = parameters
        self.returnables = returnables
        self.states = states
        self.suspendedState = suspendedState
        self.variables = variables
    }

}
