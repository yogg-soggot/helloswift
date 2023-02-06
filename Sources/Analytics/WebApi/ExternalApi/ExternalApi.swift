//
// Created by Avein on 06.02.2023.
//

import Foundation

protocol ExternalApi {
    func event(token: String, payload: Array<EventPayload>)
}

struct EventPayload {
    let param: String
    let value: String
}
