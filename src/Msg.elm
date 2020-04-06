module Msg exposing (Msg(..))

import Api.Msg as Api exposing (Msg(..))
import Browser
import Url
import Views.Mash.Msg as Mash exposing (Msg(..))


type Msg
    = GraphqlMsg Api.Msg
    | MashMsg Mash.Msg
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GoToMash
    | GoToLeaderboard
