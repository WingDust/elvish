use readline-binding

# eval (zoxide init elvish | slurp)

# Setup for zoxide development.
use ./zoxide

epm:install github.com/zzamboni/elvish-completions
   #epm:install &silent-if-installed=$true \
       #github.com/zzamboni/elvish-completions \
       #github.com/zzamboni/elvish-modules \
       #github.com/xiaq/edit.elv \
  
   use github.com/zzamboni/elvish-completions/git
