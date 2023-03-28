
use n_util


use readline-binding
use path


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



# ===================================================== env path
# Optional paths, add only those that exist
var optpaths = [
  # ~/.emacs.d/bin
  # /usr/local/opt/coreutils/libexec/gnubin
  # /usr/local/opt/texinfo/bin
  # /usr/local/opt/python/libexec/bin
  # /usr/local/go/bin
  # ~/Work/automated-security-helper

  /Library/Java/JavaVirtualMachines/graalvm-ce-java19-22.3.1/Contents/Home/bin

]
var optpaths-filtered = [(each {|p|
      if (path:is-dir $p) { put $p }
} $optpaths)]

$n_util:append-path~  /Library/Java/JavaVirtualMachines/graalvm-ce-java19-22.3.1/Contents/Home/bin

# set paths = [
#   # ~/bin
#   # $E:GOPATH/bin
#   $@optpaths-filtered
#   # /usr/local/bin
#   # /usr/local/sbin
#   # /usr/sbin
#   # /sbin
#   # /usr/bin
#   # /bin
# ]
