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

maxProdFast :: [Int] -> Int -> Int
maxProdFast nums size | length nums < size = 0
maxProdFast nums 1 =
    maximum $ map (\n -> n * n) nums
maxProdFast nums size =
    go 0 nums $ scanList $ drop (size - 1) nums
  where
    go best _starts [] = best
    go best (start : starts) (end : ends) =
        go (choose best start end) starts ends
    choose best start (Scan mpos mneg) =
        if start >= 0
            then maybeProd best start mpos
            else maybeProd best start mneg
    maybeProd best num Nothing = best
    maybeProd best num1 (Just num2) = max best $ num1 * num2

scanList :: [Int] -> [Scan]
scanList = scanr scanInt emptyScan

scanInt :: Int -> Scan -> Scan
scanInt num (Scan Nothing neg) | num >= 0 = Scan (Just num) neg
scanInt num (Scan pos Nothing) | num < 0 = Scan pos (Just num)
scanInt num scan@(Scan (Just pos) neg)
    | num >= 0 =
        if num > pos then Scan (Just num) neg else scan
scanInt num scan@(Scan pos (Just neg))
    | num < 0 =
        if num < neg then Scan pos (Just num) else scan

scanProduct :: Int -> Scan -> Maybe Int
scanProduct num (Scan _pos Nothing) | num < 0 = Nothing
scanProduct num (Scan Nothing _neg) | num >= 0 = Nothing
scanProduct num (Scan _pos (Just neg)) | num < 0 = Just $ num * neg
scanProduct num (Scan (Just pos) _neg) | num >= 0 = Just $ num * pos

data Scan = Scan {maxPos :: Maybe Int, maxNeg :: Maybe Int} deriving (Show)

emptyScan :: Scan
emptyScan = Scan Nothing Nothing
