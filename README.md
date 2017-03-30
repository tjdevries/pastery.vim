# pastery.vim

Making pasting into a tasty experience.

This is supposed to make doing some interesting paste combinations easier.

For example, if you have:

```
hello world
some text
here's more text
```

And you want to paste

```
foo
bar
baz
```

on the end of each line, then you can select the three lines you would like to yank, move your cursor to the first line where you'd like to paste, and then type `"$P` to paste onto the end of the line.

Once completed, it will look like:

```
hello world foo
some text bar
here's more text baz
```

You can set whether you want a leading space or not by doing:

```vim
" Set it to true or false
call pastery#leading_space(v:true)
```

This will put a leading space before you paste your items if set to true.

# Install

Use your favorite plugin manager

# Usage

By default, if you don't have anything mapped for these, I have it set to be:


```vim
" Paste what is in your v:register at the end of the line for each line you have yanked
nmap "$P <Plug>(pastery_default_end)
" Paste what is in your v:register at the column you are on for each line you have yanked
nmap "VP <Plug>(pastery_default_col)
```
