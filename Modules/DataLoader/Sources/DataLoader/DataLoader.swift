import Foundation
import Apollo

public class Network {
    public static let shared = Network()
    
    private init() {}
    
    public let url = "https://graphql.anilist.co"
    
    public lazy var apollo = ApolloClient(url: URL(string: url)!)
}
