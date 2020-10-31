module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = {result: Int, operand: Int, operator: String}


init : Model
init =
  {result=0, operand=0, operator=""}



-- UPDATE


type Msg
  = Add
  | Subtract
  | Number
  | Sum
  | Reset


update : {msg: Msg, num: Int} -> Model -> Model
update args model =
  case args.msg of
    Number -> 
      if model.result == 0 then
        {result=args.num, operand=model.operand, operator=model.operator}
      else
        {result=model.result, operand=args.num, operator=model.operator}
    Add ->
      {result=model.result, operand=model.operand, operator="+"}
    Subtract ->
      {result=model.result, operand=model.operand, operator="-"}
    Reset ->
      {result=0, operand=0 , operator=""}
    
    Sum ->
      case model.operator of
         "" ->
           model
         "+" ->
           {result=model.result+model.operand, operand=model.operand, operator=""}
         "-" ->
           {result=model.result-model.operand, operand=model.operand, operator=""}
         _ ->
           model
    



-- VIEW


view : Model -> Html { msg : Msg, num : number }
view model =
  div []
    [ div [] [ text (String.fromInt model.result) ]
    , div [] [div [] [button [ onClick { msg= Number, num= 7} ] [ text "7"], button [onClick { msg= Number, num= 8}] [ text "8"], button [onClick { msg= Number, num= 9}] [ text "9"]] 
            , div [] [button [ onClick { msg= Number, num= 4} ] [ text "4"], button [onClick { msg= Number, num= 5}] [ text "5"], button [onClick { msg= Number, num= 6}] [ text "9"]] 
            , div [] [button [ onClick { msg= Number, num= 1} ] [ text "1"], button [onClick { msg= Number, num= 2}] [ text "2"], button [onClick { msg= Number, num= 3}] [ text "3"]] ]
    , button [ onClick { msg= Add, num= 0} ] [ text "+" ]
    , button [ onClick { msg= Subtract, num= 0}  ] [ text "-" ]
    , button [ onClick { msg= Sum, num= 0} ] [text "="]
    , button [ onClick { msg= Reset, num= 0}  ] [ text "Reset"]
    ]