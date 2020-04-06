module Api.Msg exposing (Msg(..))

import Api.Model exposing (Cat, MutationResponse, QueryResponse, Vote)


type Msg
    = GotQueryResponseCats (QueryResponse (List Cat))
    | GotQueryResponseTopFive (QueryResponse (List Vote))
    | GotQueryResponseTotalVotes (QueryResponse Int)
    | GotMutationResponseAddVote MutationResponse
