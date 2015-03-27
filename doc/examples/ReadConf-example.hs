import TCE.Data.ReadConf ( readConfig )

data Config = Config
   { foo :: String
   , bar :: Int
   , baz :: [String]
   , qux :: Bool
   }
   deriving Read

main = do
   econf <- readConfig `fmap` readFile "read-example.conf"
   either print
      (\c -> (print $ bar c) >> (print $ qux c))
      econf
