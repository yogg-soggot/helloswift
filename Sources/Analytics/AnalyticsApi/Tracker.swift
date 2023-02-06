//
// Created by Avein on 06.02.2023.
//

import Foundation

struct Analytics {
    static var api: ExternalApi? = nil
    public static func token(key: TokenKey) -> TokenProvider {
        ConcatTokenProvider(currentToken: "\(key)")
    }
}

extension String {
    func track() {
        if let api = Analytics.api {
            api.event(token: self, payload: [])
        } else {
            print("Initialize api first")
        }
    }
}
