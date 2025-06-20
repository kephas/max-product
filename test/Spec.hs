{-# LANGUAGE QuasiQuotes #-}

import Control.Monad (forM_)
import Data.String.Interpolate (i)
import MaxProd
import Test.Hspec

specs :: [([Int], Int, Int)]
specs =
    [ ([], 1, 0)
    , ([1], 1, 1)
    , ([1, 2, 3, 4], 1, 16)
    , ([1, 2, -3, 4], 2, 8)
    , ([-1, -9, 2, 3, -2, -3, 1], 1, 81)
    , ([1, 3, -5, 5, 6, -4], 3, 20)
    , ([2, -1, 2, -6, 5, 2, -5, 7], 2, 35)
    ]

main :: IO ()
main = hspec $ do
    testAlg "naive algorithm" maxProd

testAlg :: String -> ([Int] -> Int -> Int) -> Spec
testAlg label f =
    describe label $ forM_ specs $ testSpec f

testSpec :: ([Int] -> Int -> Int) -> ([Int], Int, Int) -> Spec
testSpec f (nums, size, expected) =
    it [i|#{nums}, m=#{size}|] $ f nums size `shouldBe` expected
