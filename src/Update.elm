module Update exposing (init, update)

import Api.GraphqlRequest exposing (mutationAddVote, queryCats, queryTopFive, queryTotalVotes)
import Api.Update as Api exposing (update)
import Browser
import Browser.Navigation as Nav
import Model exposing (Model, Status(..), ViewModel(..))
import Msg exposing (Msg(..))
import Routes exposing (Route(..))
import Url
import Views.Mash.Msg exposing (Msg(..))


api : String
api =
    "/api/graphql"


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg.Msg )
init _ url key =
    let
        model =
            ----- APP -----
            { key = key
            , url = url
            , route = NotFoundRoute

            ----- ViewModel -----
            , viewModel = BadUrl

            ----- TotalVotes ------
            , totalVotes = 0

            ----- AppStatus -----
            , status = Loading
            }
    in
    changeUrl model url


update : Msg.Msg -> Model -> ( Model, Cmd Msg.Msg )
update msg model =
    case msg of
        GraphqlMsg graphqlMsg ->
            let
                ( newModel, cmd ) =
                    Api.update graphqlMsg model api
            in
            ( newModel, Cmd.map GraphqlMsg cmd )

        MashMsg mashMsg ->
            case mashMsg of
                Vote catId ->
                    ( { model | status = Loading }, Cmd.map GraphqlMsg <| mutationAddVote api catId )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            if model.url.path /= url.path then
                changeUrl model url

            else
                ( model, Cmd.none )

        GoToMash ->
            ( model, Nav.pushUrl model.key "/" )

        GoToLeaderboard ->
            ( { model | status = Loading }, Nav.pushUrl model.key "leaderboard" )


changeUrl : Model -> Url.Url -> ( Model, Cmd Msg.Msg )
changeUrl model url =
    case Routes.parseUrl url of
        MashRoute ->
            ( { model
                | url = url
                , route = MashRoute
                , status = Loading
              }
            , Cmd.map GraphqlMsg <| Cmd.batch [ queryCats api, queryTotalVotes api ]
            )

        LeaderboardRoute ->
            ( { model
                | url = url
                , route = LeaderboardRoute
                , status = Loading
              }
            , Cmd.map GraphqlMsg <| queryTopFive api
            )

        NotFoundRoute ->
            ( { model | url = url, route = NotFoundRoute, viewModel = BadUrl }, Cmd.none )
