@main
public struct Showcase {
    public static func main() {
        Analytics.api = ConsoleMockApi()
        Analytics
                .provider(key: .onboarding)
                .next(key: .button)
                .token(key: .click)
                .track()

        let token = <|.onboarding | .button |> .click
        token.track()
    }
}
