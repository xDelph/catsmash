module Model exposing (Model, Status(..), ViewModel(..))

import Api.Model exposing (Cat, Vote)
import Browser.Navigation as Nav
import Routes exposing (Route)
import Url


type alias Model =
    ----- App -----
    { key : Nav.Key
    , url : Url.Url
    , route : Route

    ----- ViewModel -----
    , viewModel : ViewModel

    ----- TotalVotes ------
    , totalVotes : Int

    ----- AppStatus -----
    , status : Status
    }


type ViewModel
    = Mash (List Cat)
    | Leaderboard (List Vote)
    | BadUrl


type Status
    = Loading
    | Loaded
