module Api.Update exposing (update)

import Api.GraphqlRequest exposing (queryTotalVotes)
import Api.Msg exposing (Msg(..))
import Browser.Navigation as Nav
import Model exposing (Model, Status(..), ViewModel(..))
import RemoteData


update : Msg -> Model -> String -> ( Model, Cmd Msg )
update msg model api =
    case msg of
        GotQueryResponseCats response ->
            case response of
                RemoteData.Success data ->
                    ( { model | viewModel = Mash data, status = Loaded }, Cmd.none )

                _ ->
                    ( { model | status = Loaded }, Cmd.none )

        GotQueryResponseTopFive response ->
            case response of
                RemoteData.Success data ->
                    ( { model | viewModel = Leaderboard data, status = Loaded }, Cmd.none )

                _ ->
                    ( { model | status = Loaded }, Cmd.none )

        GotQueryResponseTotalVotes response ->
            case response of
                RemoteData.Success data ->
                    ( { model | totalVotes = data, status = Loaded }, Cmd.none )

                _ ->
                    ( { model | status = Loaded }, Cmd.none )

        GotMutationResponseAddVote response ->
            case response of
                RemoteData.Success _ ->
                    ( { model | status = Loading }, Nav.pushUrl model.key "leaderboard" )

                _ ->
                    ( { model | status = Loaded }, Cmd.none )
