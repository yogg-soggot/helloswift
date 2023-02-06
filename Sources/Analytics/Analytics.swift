@main
public struct Analytics {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(Analytics().text)
    }
}
