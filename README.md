# ConsoleUtils

This is a simple little command line utility library I use in some of my Elixir projects.

It's not really finished, TODOs are left here and there, but I'll update it as I need new functions from that lib.

## Installation

```elixir
def deps do
  [{:consoleUtils, github: "simonced/elixir-consoleutils", app: false}]
end
```

## DOC

sample usage:

```elixir
{status, file} = ConsoleUtils.Files.lsReverseOrder("folder", ".*")
|> ConsoleUtils.Files.chooseOneFileMenu()
```
No `/` at the end of the folder.

**Note** The second parameter of `lsReverseOrder` is not used yet.

## What's next

Well, it's not complete, far from that.
I might add many more things, but below are the one I care the most at the moment.

### TODO ASAP

- limit list of files to 8 or 9 (because 0 is used to exit)
- use the second parameter to filter the files to be listed (regex)
- allow to display in non-reverse order

### Improvements

- See if it's possible to list a limited number of files even when many are available.

The thing is that if we have 100 items, we plan to only display a couple (8 or 9 max).  
So loading a whole directory in an `Enum` to reverse it seems overkill.  
Maybe something with `Stream` and `reduce` in a good combinaison would do.
