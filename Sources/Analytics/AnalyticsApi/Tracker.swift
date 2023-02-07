//
// Created by Avein on 06.02.2023.
//

import Foundation

struct Analytics {
    static var api: ExternalApi? = nil
    public static func provider(key: TokenKey) -> TokenProvider {
        ConcatTokenProvider(currentToken: "\(key)")
    }
}

class PayloadTracker {
    init(tokenKey: String, payload: [EventPayload] = []) {
        self.tokenKey = tokenKey
        self.payload = payload
    }
    private let tokenKey: String
    private var payload: [EventPayload]

    func payload(key: Payload, value: String) -> PayloadTracker {
        let pl = EventPayload(param: "\(key)", value: value)
        payload.insert(pl, at: payload.count)
        return PayloadTracker(tokenKey: tokenKey, payload: payload)
    }
    func track() {
        trackWithLog(token: tokenKey, payload: payload)
    }
}

func trackWithLog(token: String, payload: [EventPayload]) {
    if let api = Analytics.api {
        api.event(token: token, payload: payload)
    } else {
        print("Initialize api first")
    }
}

extension String {
    func payload(key: Payload, value: String) -> PayloadTracker {
        PayloadTracker(tokenKey: self, payload: [EventPayload(param: "\(key)", value: value)])
    }
    func track() {
        trackWithLog(token: self, payload: [])
    }
}

prefix operator <|

prefix func <|(key: TokenKey) -> TokenProvider {
    Analytics.provider(key: key)
}