module CollatzConjecture (collatz) where

-- Maybe a　型 Haskell には他言語でnullと呼ばれている値はない。
-- MaybeにはNothingとJustという２つのコンストラクタがある。
collatz :: Integer -> Maybe Integer
collatz xs 
    |xs <= 0 = Nothing
    |otherwise = Just (collatz' xs 0)
    where
    collatz' :: Integer -> Integer -> Integer
    collatz' 1 count = count
    collatz' xs count
        |even xs = collatz' (xs `div` 2) (count + 1)
        |otherwise = collatz' (xs * 3 + 1) (count + 1)


