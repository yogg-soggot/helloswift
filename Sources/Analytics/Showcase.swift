@main
public struct Showcase {
    public static func main() {
        Analytics.api = ConsoleMockApi()
        Analytics
                .provider(.onboarding)
                .next(.button)
                .token(.click)
                .payload(.time, "22:00")
                .payload(.user, "admin")
                .track()

        let token = <|.onboarding | .button |> .click
        _ = [.time => "22.22", .user => "Nikita"]
        token.track()
    }
}
