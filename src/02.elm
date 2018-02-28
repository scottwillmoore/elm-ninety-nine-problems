module Main exposing (..)

import Html
import List
import Maybe


penultimate : List a -> Maybe a
penultimate xs =
    case xs of
        [] ->
            Nothing

        [ x ] ->
            Nothing

        [ x, y ] ->
            Just x

        y :: ys ->
            penultimate ys


penultimate2 : List a -> Maybe a
penultimate2 xs =
    case List.reverse xs of
        [] ->
            Nothing

        y :: ys ->
            List.head ys


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ penultimate [ 1, 2, 3, 4 ] == Just 3
            , penultimate [ 1, 2 ] == Just 1
            , penultimate [ 1 ] == Nothing
            , penultimate [] == Nothing
            , penultimate [ "a", "b", "c" ] == Just "b"
            , penultimate [ "a" ] == Nothing
            ]
