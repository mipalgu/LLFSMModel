// Machine.swift
// LLFSMModel
// 
// Created by Morgan McColl.
// Copyright © 2023 Morgan McColl. All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// 
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
// 
// 2. Redistributions in binary form must reproduce the above
//    copyright notice, this list of conditions and the following
//    disclaimer in the documentation and/or other materials
//    provided with the distribution.
// 
// 3. All advertising materials mentioning features or use of this
//    software must display the following acknowledgement:
// 
//    This product includes software developed by Morgan McColl.
// 
// 4. Neither the name of the author nor the names of contributors
//    may be used to endorse or promote products derived from this
//    software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// -----------------------------------------------------------------------
// This program is free software; you can redistribute it and/or
// modify it under the above terms or under the terms of the GNU
// General Public License as published by the Free Software Foundation;
// either version 2 of the License, or (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, see http://www.gnu.org/licenses/
// or write to the Free Software Foundation, Inc., 51 Franklin Street,
// Fifth Floor, Boston, MA  02110-1301, USA.
// 

/// A machine is an LLFSM definition. A basic machine contains a name, states, and variables of differing
/// scope. An intial state is also required specifying the state the machine is in at invocation. The machine
/// can also be *parameterized* by specifying a list of parameters and returnables. A machine may also be
/// *suspensible* by specifying a suspended state.
/// - SeeAlso: ``State``, ``Variable``, ``ExternalVariable``, ``Transition``.
public struct Machine: Codable, Equatable, Hashable, Sendable {

    /// The external variables accessible by this machine.
    public let externalVariables: [ExternalVariable]

    /// The global variables used in this machine.
    public let globalVariables: [Variable]

    /// The name of the initial state.
    public let initialState: String

    /// The name of the machine.
    public let name: String

    /// The parameters for this machine. This requires the machine to be *parameterised*.
    public let parameters: [Variable]

    /// The variables returned by this machine. This requires the machine to be *parameterised*.
    public let returnables: [Variable]

    /// All states in this machine.
    public let states: [State]

    /// The name of the state assumed when the machine suspends. A value of `nil` indicates that the machine
    /// is not *suspensible*.
    public let suspendedState: String?

    /// The variables local to this machine. These variables are collectively called *machine variables*.
    public let variables: [Variable]

    /// Initialise the machine from it's stored properties.
    /// - Parameters:
    ///   - externalVariables: The external variables accessible by this machine.
    ///   - globalVariables: The global variables used in this machine.
    ///   - initialState: The name of the initial state.
    ///   - name: The name of the machine.
    ///   - parameters: The parameters for this machine.
    ///   - returnables: The variables returned by this machine.
    ///   - states: The states in this machine.
    ///   - suspendedState: The name of the state assumed when the machine suspends.
    ///   - variables: The variables local to this machine.
    @inlinable
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
