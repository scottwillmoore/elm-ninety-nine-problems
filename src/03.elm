module Main exposing (..)

import Html
import List
import Maybe


elementAt : List a -> Int -> Maybe a
elementAt xs n =
    if n < 1 then
        Nothing
    else
        List.head (List.drop (n - 1) xs)


elementAt2 : List a -> Int -> Maybe a
elementAt2 xs n =
    if n < 1 then
        Nothing
    else
        case xs of
            [] ->
                Nothing

            y :: ys ->
                if n == 1 then
                    Just y
                else
                    elementAt2 ys (n - 1)


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
            [ elementAt [ 1, 2, 3, 4 ] 2 == Just 2
            , elementAt [ 1 ] 2 == Nothing
            , elementAt [ 1 ] 1 == Just 1
            , elementAt [] 2 == Nothing
            , elementAt [] (-1) == Nothing
            , elementAt [] 0 == Nothing
            , elementAt [ 1, 2, 3, 4 ] (-1) == Nothing
            , elementAt [ 1, 2, 3, 4 ] 0 == Nothing
            , elementAt [ 'a', 'b', 'c' ] 2 == Just 'b'
            ]
