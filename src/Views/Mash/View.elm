module Views.Mash.View exposing (view)

import Api.Model exposing (Cat)
import Html exposing (Html, div)
import Html.Attributes exposing (class, id, style)
import Html.Events exposing (onClick)
import Views.Mash.Msg exposing (Msg(..))


view : List Cat -> Html Msg
view cats =
    div [ id "mash" ] <|
        List.map (\cat -> div [ class "cat", onClick <| Vote cat.id ] [ div [ style "background-image" <| "url(" ++ cat.url ++ ")" ] [] ]) cats
