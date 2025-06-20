{-# LANGUAGE QuasiQuotes #-}

import Data.String.Interpolate (i)
import MaxProd
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "naive algorithm" $ do
        test maxProd [] 1 0

test :: ([Int] -> Int -> Int) -> [Int] -> Int -> Int -> Spec
test f nums size expected =
    it [i|#{nums}, m=#{size}|] $ f nums size `shouldBe` expected
