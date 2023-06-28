// State.swift
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

/// A state definition in a ``Machine``. Each state represents a collection of actions that are executed
/// in a ringlet. This state also contains transitions that cause the ``Machine`` to transition to another
/// state, and variables local to this state.
public struct State: Codable, Hashable, Equatable, Sendable {

    /// The actions within the state. Each key in the dictionary is the action name, while the value is the
    /// code that is executed in the action.
    public let actions: [String: String]

    /// The external variables this state accesses.
    public let externalVariables: Set<String>

    /// The name of the state.
    public let name: String

    /// The transitions from this state. These transitions use this state as the source.
    public let transitions: [Transition]

    /// The variables local to this state. These variables collectively called state variables are only
    /// accessible in this state.
    public let variables: [Variable]

    /// Creates a new state from it's stored properties.
    /// - Parameters:
    ///   - actions: The actions within the state.
    ///   - externalVariables: The external variables this state accesses.
    ///   - name: The name of the state.
    ///   - transitions: The transitions from this state.
    ///   - variables: The variables local to this state.
    /// - SeeAlso: ``Transition``, ``Variable``, ``ExternalVariable``.
    @inlinable
    public init(
        actions: [String: String],
        externalVariables: Set<String>,
        name: String,
        transitions: [Transition],
        variables: [Variable]
    ) {
        self.actions = actions
        self.externalVariables = externalVariables
        self.name = name
        self.transitions = transitions
        self.variables = variables
    }

}
