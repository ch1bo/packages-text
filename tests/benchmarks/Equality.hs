import System.Environment
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TL

text haystack = do
  ls <- (T.lines . T.decodeUtf8) `fmap` B.readFile haystack
  print . sum . map (\needle -> length . filter (==needle) $ ls) $ take 100 ls

lazyText haystack = do
  ls <- (TL.lines . TL.decodeUtf8) `fmap` BL.readFile haystack
  print . sum . map (\needle -> length . filter (==needle) $ ls) $ take 100 ls

string haystack = do
  ls <- lines `fmap` readFile haystack
  print . sum . map (\needle -> length . filter (==needle) $ ls) $ take 100 ls

main = do
  args <- getArgs
  case args of
    ["text",h] -> text h
    ["lazytext",h] -> lazyText h
    ["string",h] -> string h
