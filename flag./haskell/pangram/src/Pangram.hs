module Pangram (isPangram) where

import Data.Char (toLower)

alphabet = ['a'..'z']

isPangram :: String -> Bool
isPangram text = all (`elem` map toLower text ) alphabet

-- import Data.List (nub) 
-- /Reference/　Learn You a Haskell for Great Good ! C6.1 
-- I wanted to use　the point free.   length . nub はlengthとnubの関数合成で、 \xs -> length (nub xs)　と等価な関数である
-- https://hackage.haskell.org/package/base-4.16.0.0/docs/Data-Char.html
-- https://hackage.haskell.org/package/base-4.16.0.0/docs/Data-List.html
-- elem : 指定した要素がリストに含まれているかを調べる

