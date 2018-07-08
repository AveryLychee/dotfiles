#!/usr/bin/env runhaskell
module Main where

import Data.List (intersperse)
import System.Environment (getArgs)

data Options = Single | Double | LeftSingle | RightSingle | LeftRightSingle | BottomSingle | TopSingle | TopBottomSingle | Rounded deriving (Eq)

data Side = Top | Bottom | Left | Right

main = do args <- getArgs
          case args of
            [] -> putStrLn usage
            [string] -> mapM_ putStrLn $ map (box string) allOptions
            [string, arg] -> putStrLn $ box string $ argProcess arg

argProcess "s"   = Single
argProcess "d"   = Double
argProcess "r"   = Rounded
argProcess "ls"  = LeftSingle
argProcess "rs"  = RightSingle
argProcess "lrs" = LeftRightSingle
argProcess "bs"  = BottomSingle
argProcess "ts"  = TopSingle
argProcess "tbs" = TopBottomSingle
argProcess s     = error $ "unrecognised argument: " ++ s

allOptions = [Single , Double , LeftSingle , RightSingle , LeftRightSingle , BottomSingle , TopSingle , TopBottomSingle , Rounded]

usage = "Usage: box string [option]"

box text options = let padded = pad text
                       l = length . head . lines $ padded
                   in topline l options ++ "\n"
                      ++ concat (intersperse "\n" (map (mainline options) (lines padded))) ++ "\n"
                      ++ bottomline l options

pad s = pad' 0 s

pad' n s = if length s - (2 * n) > 50 then let (fst, rest) = splitAtSpace 50 s
                                               splitLength = length fst
                                           in "  " ++ fst ++ "  \n" ++ pad' splitLength rest
                            else if n > 0 then "  " ++ pad_complex n s ++ "  " else "  " ++ s ++ "  "


pad_complex 0 s = s
pad_complex n s
  | odd (length s) = pad_complex n (' ':s)
  | otherwise      = if length s < n - 1
                        then pad_complex n (" " ++ s ++ " ")
                         else if length s == n - 1 then s ++ " "
                                                       else s


splitAtSpace n s = if s !! n == ' ' then splitAt n s
                                    else splitAtSpace (n - 1) s



topline n options = tlc options ++ replicate n (hz Top options) ++ trc options
bottomline n options = blc options ++ replicate n (hz Bottom options) ++ brc options

mainline options s = let l = if any (==options) [Single, LeftSingle, LeftRightSingle, Rounded]  then '│' else '║'
                         r = if any (==options) [Single, RightSingle, LeftRightSingle, Rounded] then '│' else '║'
                     in l : s ++ [r]

tlc Single          = "┌"
tlc LeftSingle      = "╒"
tlc LeftRightSingle = "╒"
tlc TopSingle       = "╓"
tlc TopBottomSingle = "╓"
tlc Rounded         = "╭"
tlc _               = "╔"

trc Single          = "┐"
trc RightSingle     = "╕"
trc LeftRightSingle = "╕"
trc TopSingle       = "╖"
trc TopBottomSingle = "╖"
trc Rounded         = "╮"
trc _               = "╗"

hz _ Single            = '─'
hz Top TopSingle       = '─'
hz Bottom BottomSingle = '─'
hz _ TopBottomSingle   = '─'
hz _ Rounded           = '─'
hz _ _                 = '═'

blc Single          = "└"
blc LeftSingle      = "╘"
blc LeftRightSingle = "╘"
blc BottomSingle    = "╙"
blc TopBottomSingle = "╙"
blc Rounded         = "╰"
blc _               = "╚"

brc Single          = "┘"
brc RightSingle     = "╛"
brc LeftRightSingle = "╛"
brc BottomSingle    = "╜"
brc TopBottomSingle = "╜"
brc Rounded         = "╯"
brc _               = "╝"
