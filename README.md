# tce-conf


## Synopsis

Very simple config file reading


## Description

This package contains a module for reading very simple config files
of the key=value style. It supports blank lines and # comments,
but nothing else. The data is exposed as a Map


## Getting source

- Get the source with darcs: `$ darcs get http://hub.darcs.net/dino/tce-conf`
- If you're just looking, [browse the source](http://hub.darcs.net/dino/tce-conf)

And once you have it, building the usual way:

    $ cabal configure --enable-tests
    $ cabal build
    $ cabal test
    $ cabal haddock
    $ cabal install


## Contact

Dino Morelli <[dino@ui3.info](mailto:dino@ui3.info)>
