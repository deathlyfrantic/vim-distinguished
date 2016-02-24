# Distinguished

A dark vim color scheme for 256-color terminals.

Originally by [Lokaltog](https://github.com/Lokaltog). There are about a billion forks of this theme but this one is
mine. I've made the following changes:

- GUI and terminal colors are identical.
- Comments are italic and have no background color.
- Added `g:distinguished_transparent_background` - set this to 1 if you want the background to be transparent rather
  than black. I use a background image in my terminal so I like this option. Defaults to 0, meaning the background is
  set to black.
- Added `g:distinguished_rainbow_parens` - set this to 1 if you want to use Distinguished colors in
  [kien/rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim). This just sets the
  `g:rbpt_colorpairs` dictionary using some colors from the theme. Defaults to 0, meaning the dictionary is not set.
- Added `g:distinguished_nerdtree_highlight` - set this to 1 if you want to use Distinguished colors in
  [NERDTree](https://github.com/scrooloose/nerdtree) to highlight filetypes. This uses a regex based on extensions to do
  the highlighting. Defaults to 0, meaning filetypes are not highlighted.
- Added the Distinguished theme for Airline to this repo. `:AirlineTheme distinguished` or `let g:airline_theme =
  'distinguished'`. There is a version of this is in the
  [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) repo but if I make changes
  they'll show up here.

Pull requests welcome!
