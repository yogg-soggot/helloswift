//
// Created by Avein on 06.02.2023.
//

import Foundation

struct Analytics {
    static var api: ExternalApi? = nil
    public static func provider(_ key: TokenKey) -> TokenProvider {
        ConcatTokenProvider(currentToken: "\(key)")
    }
    public static func token(_ key: TokenKey) -> String { "\(key)" }
}

class PayloadTracker {
    init(tokenKey: String, payload: [EventPayload] = []) {
        self.tokenKey = tokenKey
        self.payload = payload
    }
    private let tokenKey: String
    private var payload: [EventPayload]

    func payload(_ key: Payload, _ value: String) -> PayloadTracker {
        let pl = EventPayload(param: "\(key)", value: value)
        payload.insert(pl, at: payload.count)
        return PayloadTracker(tokenKey: tokenKey, payload: payload)
    }
    func send() {
        trackWithLog(token: tokenKey, payload: payload)
    }
}

extension String {
    func payload(_ key: Payload, _ value: String) -> PayloadTracker {
        PayloadTracker(tokenKey: self, payload: [EventPayload(param: "\(key)", value: value)])
    }
    func send() {
        trackWithLog(token: self, payload: [])
    }
}

func trackWithLog(token: String, payload: [EventPayload]) {
    if let api = Analytics.api {
        api.event(token: token, payload: payload)
    } else {
        print("Initialize api first")
    }
}
