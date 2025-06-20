module MaxProd where

import Control.Monad (guard, when)
import Data.Function ((&))
import Data.List (tails)

maxProd :: [Int] -> Int -> Int
maxProd nums size | length nums < size = 0
maxProd nums 1 =
    maximum $ map (\n -> n * n) nums
maxProd nums size =
    maximum $ getProducts nums size

-- get all products of pairs at the extremities of subsequences of this size
getProducts :: [Int] -> Int -> [Int]
getProducts nums size = do
    (start : rest) <- tails nums
    guard $ length rest >= size - 1
    end <- drop (size - 2) rest
    let product = start * end
    pure product
