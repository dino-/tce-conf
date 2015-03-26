-- License: BSD3 (see LICENSE)
-- Author: Dino Morelli <dino@ui3.info>

{- |
   Read a serialized (as in the Read typeclass) config data structure
   from a string

   This is handy for the case where you need a strongly-typed,
   possibly hierarchical configuration. It's not a revolutionary idea
   to use Read deserialization of a text file but I found it handy
   to support comments and also wrapping possible failure in Either.
-}
module TCE.Data.ReadConf
   ( readConfig )
   where

import Data.List ( isPrefixOf )


{- |
   Attempt to read a String into an instance of a data structure.
-}
readConfig :: (Read r) => String -> Either String r
readConfig contents =
   case (reads . removeComments $ contents) of
      [(c, _)    ] -> Right c
      ((_, x) : _) -> Left $ "ERROR parsing config data:\n" ++ x
      [          ] -> Left $ "ERROR parsing config data"


{- Auto-derived Read instancing has no idea how to handle Haskell source
   code commenting. This will strip out very simple -- style comments.
-}
removeComments :: String -> String
removeComments = unlines . map removeComment . lines
   where
      removeComment =
         unwords . (takeWhile (not . isPrefixOf "--")) . words
