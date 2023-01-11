use readline-binding

# eval (zoxide init elvish | slurp)

# Setup for zoxide development.
use ./zoxide

use epm


epm:install github.com/zzamboni/elvish-completions 
   #epm:install &silent-if-installed=$true \
       #github.com/zzamboni/elvish-completions \
       #github.com/zzamboni/elvish-modules \
       #github.com/xiaq/edit.elv \
  
   use github.com/zzamboni/elvish-completions/git


epm:install github.com/muesli/elvish-libs
use github.com/muesli/elvish-libs/theme/powerline
set edit:prompt-stale-transform = {|x| put $x }
set edit:rprompt-stale-transform = {|x| put $x }
