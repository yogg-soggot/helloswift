@main
public struct Showcase {
    public static func main() {
        Analytics.api = ConsoleMockApi()
        Analytics
                .provider(key: .onboarding)
                .next(key: .button)
                .token(key: .click)
                .payload(key: .time, value: "22:00")
                .payload(key: .user, value: "admin")
                .track()

        let token = <|.onboarding | .button |> .click
        _ = [.time => "22.22", .user => "Nikita"]
        token.track()
    }
}
