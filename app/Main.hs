import Control.Monad (replicateM)
import Criterion.Main
import MaxProd
import System.Random.Stateful

main :: IO ()
main = do
    gen <- newIOGenM $ mkStdGen 0
    list10 <- uniformListRM 10 (-999, 999) gen
    list100 <- uniformListRM 100 (-999, 999) gen
    list1k <- uniformListRM 1000 (-999, 999) gen
    defaultMain
        [ bgroup
            "maxProd"
            [ bench "len=10,m=4" $ whnf (maxProd list10) 4
            , bench "len=100,m=4" $ whnf (maxProd list100) 4
            , bench "len=1k,m=4" $ whnf (maxProd list1k) 4
            ]
        ]

uniformListRM :: (StatefulGen g m, UniformRange a) => Int -> (a, a) -> g -> m [a]
uniformListRM n range gen = replicateM n (uniformRM range gen)
