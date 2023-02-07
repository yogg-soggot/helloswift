//
// Created by Avein on 07.02.2023.
//

import Foundation

infix operator =>

func =>(lhs: Payload, rhs: String) -> EventPayload {
    EventPayload(param: "\(lhs)", value: rhs)
}
