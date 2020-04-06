module Views.Leaderboard exposing (view)

import Api.Model exposing (Vote)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, id, style)
import Msg exposing (Msg(..))


view : List Vote -> Html Msg
view votes =
    div [ id "leaderboard" ]
        [ div [] <|
            List.map
                (\vote ->
                    div [ class "row" ]
                        [ div [ class "image", style "background-image" <| "url(" ++ vote.url ++ ")" ] []
                        , div [ class "votes" ]
                            [ text <|
                                String.fromInt vote.votes
                                    ++ (if vote.votes > 1 then
                                            " votes"

                                        else
                                            " vote"
                                       )
                            ]
                        ]
                )
                votes
        ]
