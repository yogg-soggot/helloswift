//
// Created by Avein on 06.02.2023.
//

import Foundation

enum TokenKey { // Assuming this is code gen from excel or something like that
    case onboarding, home, feed, profile
    case image, button, text, video
    case click, tap, scroll
}

enum Payload {
    case time, user
}
