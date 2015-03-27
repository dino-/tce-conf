import Data.Map ( lookup )
import Prelude hiding ( lookup )
import TCE.Data.KVConf ( parseToMap )

main = do
   conf <- parseToMap `fmap` readFile "kv-example.conf"
   print $ lookup "foo" conf
   print $ lookup "baz-blorp" conf
