# Brew formula for build old versions of CFEngine on MacOS

[https://cfengine.com](https://cfengine.com)

## CFEngine Versions

3.4.5

3.15.3 (current LTS)

Based on [official brew formula](https://formulae.brew.sh/formula/cfengine)


## Installing 3.15.3

```bash
git clone https://github.com/byumov/cfengine.git
cd cfengine
brew install ./cfengine@3.15.3.rb
```

## Installing 3.4.5

First, install old version of `openssl` and `gsed`

```bash
brew install rbenv/tap/openssl@1.0
```

Then clone repo and install CFEngine

```bash
git clone https://github.com/byumov/cfengine.git
cd cfengine
brew install ./cfengine@3.4.5.rb
```

## Disable auto update

```bash
brew pin cfengine
```
