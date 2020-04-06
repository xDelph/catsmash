module Main exposing (main)

import Browser
import Model exposing (Model)
import Msg exposing (Msg(..))
import Update
import View



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = Update.init
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        , view = View.view
        , update = Update.update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
