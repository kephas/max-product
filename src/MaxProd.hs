module MaxProd where

maxProd :: [Int] -> Int -> Int
maxProd nums size =
    go (length nums) nums
  where
    go len nums' | len < size = 0
    go len nums' = undefined
