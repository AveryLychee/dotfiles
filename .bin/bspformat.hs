#!/usr/bin/env runhaskell

import System.IO
import Control.Monad
import System.Process


main = do hSetBuffering stdin LineBuffering
          (_, Just bspcHandle, _, _) <- createProcess (proc "bspc" ["subscribe"]){ std_out = CreatePipe }
          -- bspcInfo <- runCommand "bspc subscribe"
          forever $ do hGetLine bspcHandle >>= putStrLn . format

format "" = ""
format s = let (current, rest) = break (==':') s
           in (case current of
             'O':occFocused     -> " [ " ++ occFocused    ++ " ] "
             'o':occUnfocused   -> "   " ++ occUnfocused  ++ "   "
             'F':freeFocused    -> " | " ++ freeFocused   ++ " | "
             'f':freeUnfocused  -> "   " ++ freeUnfocused ++ "   "
             'U':urgFocused     -> " [[" ++ urgFocused    ++ "]] "
             'u':urgUnfocused   -> " ! " ++ urgUnfocused    ++ " ! "
             'L':layout         -> "   " ++ layout
             _                  -> ""
             ) ++ format (fix rest)
        where
          fix (':':s) = s
          fix s = s
