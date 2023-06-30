// MachineTests.swift
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

@testable import LLFSMModel
import XCTest

/// Test class for ``Machine``.
final class MachineTests: XCTestCase {

    /// Some external variables.
    let externalVariables = [ExternalVariable(mode: .input, name: "Ext_X", type: "int")]

    /// Some global variables.
    let globals = [Variable(name: "Glob_X", type: "float")]

    /// Some parameters.
    let parameters = [Variable(name: "Par_X1", type: "int"), Variable(name: "Par_X2", type: "bool")]

    /// Some returnables.
    let returnables = [Variable(name: "Ret_y", type: "int")]

    /// Some states.
    let states = [
        State(
            actions: ["OnEntry": "y <- Ext_X"],
            externalVariables: ["Ext_X"],
            name: "Initial",
            transitions: [Transition(target: "Suspended", condition: "true")],
            variables: []
        ),
        State(
            actions: [:],
            externalVariables: [],
            name: "Suspended",
            transitions: [],
            variables: []
        )
    ]

    /// Some machine variables.
    let variables = [Variable(name: "x", type: "int")]

    /// Test that the machine can be initialised from it's stored properties.
    func testInit() {
        let machine = Machine(
            externalVariables: externalVariables,
            globalVariables: globals,
            initialState: "Initial",
            name: "M1",
            parameters: parameters,
            returnables: returnables,
            states: states,
            suspendedState: "Suspended",
            variables: variables
        )
        XCTAssertEqual(machine.externalVariables, externalVariables)
        XCTAssertEqual(machine.globalVariables, globals)
        XCTAssertEqual(machine.initialState, "Initial")
        XCTAssertEqual(machine.name, "M1")
        XCTAssertEqual(machine.parameters, parameters)
        XCTAssertEqual(machine.returnables, returnables)
        XCTAssertEqual(machine.states, states)
        XCTAssertEqual(machine.suspendedState, "Suspended")
        XCTAssertEqual(machine.variables, variables)
        let machine2 = Machine(
            externalVariables: externalVariables,
            globalVariables: globals,
            initialState: "Initial",
            name: "M1",
            parameters: [],
            returnables: [],
            states: states,
            variables: variables
        )
        XCTAssertEqual(machine2.externalVariables, externalVariables)
        XCTAssertEqual(machine2.globalVariables, globals)
        XCTAssertEqual(machine2.initialState, "Initial")
        XCTAssertEqual(machine2.name, "M1")
        XCTAssertEqual(machine2.parameters, [])
        XCTAssertEqual(machine2.returnables, [])
        XCTAssertEqual(machine2.states, states)
        XCTAssertNil(machine2.suspendedState)
        XCTAssertEqual(machine2.variables, variables)
    }

}
