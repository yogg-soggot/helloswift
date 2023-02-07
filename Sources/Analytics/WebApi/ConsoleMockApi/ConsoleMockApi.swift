//
// Created by Avein on 06.02.2023.
//

import Foundation

class ConsoleMockApi : ExternalApi {
    func event(token: String, payload: Array<EventPayload>) {
        let payloadStringRep = payload.reduce("") {acc, item in acc + "\(item)" + "\n "}
        print("Sending event with token \"\(token)\" and payload: \n \(payloadStringRep)")
    }
}
