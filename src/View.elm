module View exposing (view)

import Browser
import Html exposing (div, img, text)
import Html.Attributes exposing (class, id, src)
import Html.Events exposing (onClick)
import Model exposing (Model, Status(..), ViewModel(..))
import Msg exposing (Msg(..))
import Views.Leaderboard as LeaderboardView
import Views.Mash.View as MashView


view : Model -> Browser.Document Msg
view model =
    { title = "CatMash"
    , body =
        [ div [ id "logo", onClick <| GoToMash ] [ img [ src "/logo.png" ] [] ]
        , div [ id "title-left" ] [ text "CAT" ]
        , div [ id "title-right" ] [ text "MASH" ]
        , case model.viewModel of
            Mash cats ->
                Html.map MashMsg <| MashView.view cats model.totalVotes

            Leaderboard votes ->
                LeaderboardView.view votes

            _ ->
                div [] [ text "Oops" ]
        , case model.viewModel of
            Mash cats ->
                div [ id "totalVotes" ]
                    [ div [ class "title", onClick GoToLeaderboard ] [ text "Voir les plus beaux chats" ]
                    , div [ class "total" ] [ text <| String.fromInt model.totalVotes ++ " votes" ]
                    ]

            _ ->
                text ""
        , div
            [ id <|
                case model.status of
                    Loading ->
                        "loading"

                    Loaded ->
                        "loaded"
            ]
            [ div [ class "lds-ellipsis" ] [ div [] [], div [] [], div [] [], div [] [] ]
            ]
        ]
    }
