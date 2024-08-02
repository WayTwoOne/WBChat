// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AnimeListQuery: GraphQLQuery {
  public static let operationName: String = "AnimeList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AnimeList { Page { __typename mediaList { __typename media { __typename title { __typename english native } coverImage { __typename extraLarge } description episodes } } } }"#
    ))

  public init() {}

  public struct Data: AnimeList.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AnimeList.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AnimeList.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AnimeList.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("mediaList", [MediaList?]?.self),
      ] }

      public var mediaList: [MediaList?]? { __data["mediaList"] }

      /// Page.MediaList
      ///
      /// Parent Type: `MediaList`
      public struct MediaList: AnimeList.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AnimeList.Objects.MediaList }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("media", Media?.self),
        ] }

        public var media: Media? { __data["media"] }

        /// Page.MediaList.Media
        ///
        /// Parent Type: `Media`
        public struct Media: AnimeList.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AnimeList.Objects.Media }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("title", Title?.self),
            .field("coverImage", CoverImage?.self),
            .field("description", String?.self),
            .field("episodes", Int?.self),
          ] }

          /// The official titles of the media in various languages
          public var title: Title? { __data["title"] }
          /// The cover images of the media
          public var coverImage: CoverImage? { __data["coverImage"] }
          /// Short description of the media's story and characters
          public var description: String? { __data["description"] }
          /// The amount of episodes the anime has when complete
          public var episodes: Int? { __data["episodes"] }

          /// Page.MediaList.Media.Title
          ///
          /// Parent Type: `MediaTitle`
          public struct Title: AnimeList.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AnimeList.Objects.MediaTitle }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("english", String?.self),
              .field("native", String?.self),
            ] }

            /// The official english title
            public var english: String? { __data["english"] }
            /// Official title in it's native language
            public var native: String? { __data["native"] }
          }

          /// Page.MediaList.Media.CoverImage
          ///
          /// Parent Type: `MediaCoverImage`
          public struct CoverImage: AnimeList.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AnimeList.Objects.MediaCoverImage }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("extraLarge", String?.self),
            ] }

            /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
            public var extraLarge: String? { __data["extraLarge"] }
          }
        }
      }
    }
  }
}
