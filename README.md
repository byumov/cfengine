# Brew formula for build old version of CFEngine on MacOS

## CFEngine Version
3.4.5

Based on [official brew formula](https://formulae.brew.sh/formula/cfengine)

## Installing

First, install old version of `openssl` and `gsed`

```bash
brew install rbenv/tap/openssl@1.0
brew install gsed
```

Then clone repo and install CFEngine


```bash
git clone git@github.com:byumov/cfengine.git
cd cfengine
brew install ./cfengine.rb
```
