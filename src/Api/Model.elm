module Api.Model exposing (Cat, MutationResponse, QueryResponse, Vote)

import Graphql.Http
import RemoteData exposing (RemoteData)


type alias Cat =
    { url : String
    , id : String
    }


type alias Vote =
    { catId : String
    , votes : Int
    , url : String
    }


type alias QueryResponse a =
    RemoteData (Graphql.Http.Error a) a


type alias MutationResponse =
    RemoteData (Graphql.Http.Error (Maybe String)) (Maybe String)
