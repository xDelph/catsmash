-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module GeneratedGraphql.Object.VoteUIType exposing (catId, url, votes)

import GeneratedGraphql.InputObject
import GeneratedGraphql.Interface
import GeneratedGraphql.Object
import GeneratedGraphql.Scalar
import GeneratedGraphql.ScalarCodecs
import GeneratedGraphql.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Id of the cat
-}
catId : SelectionSet String GeneratedGraphql.Object.VoteUIType
catId =
    Object.selectionForField "String" "catId" [] Decode.string


{-| Number of votes
-}
votes : SelectionSet Int GeneratedGraphql.Object.VoteUIType
votes =
    Object.selectionForField "Int" "votes" [] Decode.int


{-| Url of the image
-}
url : SelectionSet String GeneratedGraphql.Object.VoteUIType
url =
    Object.selectionForField "String" "url" [] Decode.string
