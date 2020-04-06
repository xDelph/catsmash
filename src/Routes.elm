module Routes exposing (Route(..), matchers, parseUrl)

import Url exposing (Url)
import Url.Parser exposing (Parser(..), map, oneOf, parse, s, top)


type Route
    = MashRoute
    | LeaderboardRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map MashRoute top
        , map LeaderboardRoute (s "leaderboard")
        ]


parseUrl : Url -> Route
parseUrl url =
    url
        |> parse matchers
        |> Maybe.withDefault NotFoundRoute
