Installation
============

1. Install MONACO.TTF font if your system does not have it
2. Run ./bootstrap.sh

Requirements
------------

This configuration has mostly been tested on a Mac with MacVim. Other platforms
and Vim variants might have minor issues.

* golang - `brew install go`
* yarn - `brew install yarn`

Comments
========

* vim-plug for plugin management
* See vimrc for list of plug-ins installed
* The overall display is kept simple
    - no line numbers (use :<number> to jump to lines!)
    - no toolbar or menubar in gVim
* Key mappings -- Stay close to the home row!
    - 'leader' key is comma (so plug-in commands are mapped to things like ,t)
    - kd/dk mapped to Esc, exit INSERT mode by mashing those two keys
    - fj/jf mapped to autocomplete-word (it searches open buffers)
    - clear search register *and* search highlight with ./ (search
      highlighting is cool, but having it stick around is not; typing
      :noh sucks)
* Custom plugin key mappings
    - ,t opens NERD Tree file browser
    - ,f opens fuzzy-find-file ('Command-T' plugin)

TODO
====

* Evaluate Neovim
* In-buffer debugging
* number of spaces vary for filetype (do just ruby, python, java, 4 default)
* Language-specific folding (python folding -- in video?, java), default
  based on indent
* Smarter autocomplete -- omnicomplete?
