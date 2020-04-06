module Api.GraphqlRequest exposing (mutationAddVote, queryCats, queryTopFive, queryTotalVotes)

import Api.Model exposing (Cat, Vote)
import Api.Msg exposing (Msg(..))
import GeneratedGraphql.InputObject
import GeneratedGraphql.Mutation as Mutation
import GeneratedGraphql.Object
import GeneratedGraphql.Object.CatType as CatType
import GeneratedGraphql.Object.VoteUIType as VoteUIType
import GeneratedGraphql.Query as Query
import Graphql.Http
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, with)
import RemoteData



--===== QUERY ====--
---- get mash cats ----


queryCats : String -> Cmd Msg
queryCats api =
    Query.cats catsInfoSelection
        |> Graphql.Http.queryRequest api
        |> Graphql.Http.send (RemoteData.fromResult >> GotQueryResponseCats)


catsInfoSelection : SelectionSet Cat GeneratedGraphql.Object.CatType
catsInfoSelection =
    SelectionSet.succeed Cat
        |> with CatType.url
        |> with CatType.id



---- get leaderboard ----


queryTopFive : String -> Cmd Msg
queryTopFive api =
    Query.topFive topFiveInfoSelection
        |> Graphql.Http.queryRequest api
        |> Graphql.Http.send (RemoteData.fromResult >> GotQueryResponseTopFive)


topFiveInfoSelection : SelectionSet Vote GeneratedGraphql.Object.VoteUIType
topFiveInfoSelection =
    SelectionSet.succeed Vote
        |> with VoteUIType.catId
        |> with VoteUIType.votes
        |> with VoteUIType.url



---- get total votes ----


queryTotalVotes : String -> Cmd Msg
queryTotalVotes api =
    Query.totalVotes
        |> Graphql.Http.queryRequest api
        |> Graphql.Http.send (RemoteData.fromResult >> GotQueryResponseTotalVotes)



--===== MUTATION ====--
--- add vote ----


mutationAddVote : String -> String -> Cmd Msg
mutationAddVote api catId =
    Mutation.addVote (addVoteInput catId)
        |> Graphql.Http.mutationRequest api
        |> Graphql.Http.send (RemoteData.fromResult >> GotMutationResponseAddVote)


addVoteInput : String -> Mutation.AddVoteRequiredArguments
addVoteInput catId =
    Mutation.AddVoteRequiredArguments (GeneratedGraphql.InputObject.VoteInput catId)
