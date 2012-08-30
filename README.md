Installation
============

1. Install MONACO.TTF font if your system does not have it
2. Replace ~/.vim with the contents of this repo
3. Run ./bootstrap.sh

Requirements
------------

The 'Command-T' module requires ruby, and also has a compilation step that may
require the ruby development package (e.g. apt-get install ruby-dev).

If you are running on Mac OSX, you'll want to use MacVim rather than the pre-
installed version.  It comes compiled with many useful/required options.

Comments
========

* Vundle for plugin management -- plugin files get distributed across various
  directories in .vim so it is hard to track them down and add/remove.  The
  pathogen and Vundle plug-ins resolve this issue by modifying the vim runtime
  path to look in self-contained 'bundle' directories, one per plug-in.  Vundle
  also handles downloading and installation of bundles automatically!
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

* # spaces vary for filetype (do just ruby, python, java, 4 default)
* Language-specific folding (python folding -- in video?, java), default
  based on indent
* Better highlight trailing whitespace
* Smarter autocomplete -- omnicomplete?
