-- For some reason, this solution doesn't pass, 
-- even though the test passes and 
-- I don't get any Data.Text errors in the my local enviroment.


module Bob (responseFor) where
import qualified Data.Text as T
import           Data.Text (Text)
import           Data.List
-- https://hackage.haskell.org/package/text-2.0/docs/Data-Text.html

upperCase :: Char -> Bool
upperCase inputchar = inputchar `elem` ['A'..'Z']

lowerCase :: Char -> Bool
lowerCase inputchar = inputchar `elem` ['a'..'z']

whiteSpace :: Char -> Bool
whiteSpace inputchar = inputchar `elem` [' ']

allUpperCase :: [Char] -> Bool
allUpperCase "" = False
allUpperCase str = x && y
    where   x = any upperCase str
            y = not (any lowerCase str)

isYell :: [Char] -> Bool
isYell str = allUpperCase str

isQuestion :: [Char] -> Bool
isQuestion "" = False
isQuestion s = isSuffixOf "?" s  
-- https://hackage.haskell.org/package/text-2.0/docs/Data-Text.html#g:21
-- isSuffixOf :: Text -> Text -> BoolSource#
-- O(n) The isSuffixOf function takes two Texts and returns True iff the first is a suffix of the second.
-- O(n) isSuffixOf 関数は、2 つの Texts を受け取り、最初の Texts が 2 番目の Texts の接尾辞である場合に True を返します。
isQuestionAndYell :: [Char] -> Bool
isQuestionAndYell "" = False
isQuestionAndYell s = isYell(s) && isQuestion(s)

isEmpty :: [Char] -> Bool
isEmpty "" = True
isEmpty s = all whiteSpace s

responseFor :: Text -> Text
responseFor xs
    | isQuestionAndYell ts = T.pack "Calm down, I know what I'm doing!"::Text
    | isQuestion ts        = T.pack "Sure."::Text
    | isYell ts            = T.pack "Whoa, chill out!"::Text
    | isEmpty ts           = T.pack "Fine. Be that way!"::Text
    | otherwise            = T.pack "Whatever."::Text
    where ts = T.unpack $ T.strip xs


-- 、あなたが "How are you? "などの
-- 質問をすると、"Sure. "と答えます。

-- あなたが彼に向かって大声で怒鳴れば（すべて大文字で表す）、彼は
-- 「Whoa, chill out!」と答えます

-- 彼は、あなたが彼に向かって質問を叫んだら、
--'Calm down, I know what I'm doing!'と答えます。

-- 彼は'Fine. もしあなたが実際に何も言わずに彼に話しかけたら、
--'Fine. Be that way!'と言うでしょう。

-- それ以外のことには「Whatever」と答える。

