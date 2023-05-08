
use n_util


use readline-binding
use path


# Setup for zoxide development.
use ./zoxide

use epm


epm:install github.com/zzamboni/elvish-completions 
epm:install github.com/zzamboni/elvish-modules
epm:install github.com/xiaq/edit.elv 

  
use github.com/zzamboni/elvish-completions/git
use github.com/zzamboni/elvish-completions/builtins
use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/ssh


#epm:install github.com/muesli/elvish-libs
use github.com/muesli/elvish-libs/theme/powerline
set edit:prompt-stale-transform = {|x| put $x }
set edit:rprompt-stale-transform = {|x| put $x }




epm:install &silent-if-installed=$true github.com/crinklywrappr/rivendell
epm:upgrade github.com/crinklywrappr/rivendell


# epm:install github.com/trieloff/elvish-completion
# use github.com/trieloff/elvish-completion/npx
# use github.com/trieloff/elvish-completion/npm



# use github.com/crinklywrappr/rivendell/test t
# # use github.com/crinklywrappr/rivendell/base b
# use github.com/crinklywrappr/rivendell/fun f
# use github.com/crinklywrappr/rivendell/lazy l
# use github.com/crinklywrappr/rivendell/rune r
# use github.com/crinklywrappr/rivendell/algo a
# use github.com/crinklywrappr/rivendell/vis v


# lazily graphing population data from the 2021 census

# var file = (a:lines NST-EST2021-alldata.csv)

# var f = {|line| s:split , $line | f:listify}

# var popkeys = ($f (l:first $file))

# l:drop 6 $file ^
# | l:each (f:comp $f (f:partial $f:zipmap~ $popkeys) (f:juxt (f:k NAME) (f:k POPESTIMATE2021)) $f:listify~) ^
# | l:take 20 ^
# | l:blast ^
# | v:barky &min=0

#         Alabama ████████
#          Alaska █
#         Arizona ███████████
#        Arkansas ████
#      California ███████████████████████████████████████████████████████████████
#        Colorado █████████
#     Connecticut █████
#        Delaware █
# District of Co… █
#         Florida ███████████████████████████████████
#         Georgia █████████████████
#          Hawaii ██
#           Idaho ███
#        Illinois ████████████████████
#         Indiana ███████████
#            Iowa █████
#          Kansas ████
#        Kentucky ███████
#       Louisiana ███████
#           Maine ██


epm:install github.com/aca/elvish-bash-completion/bash-completer
# use github.com/aca/elvish-bash-completion/bash-completer

# set edit:completion:arg-completer[ssh] = (bash-completer:new "ssh")
# set edit:completion:arg-completer[scp] = (bash-completer:new "scp")
# set edit:completion:arg-completer[curl] = (bash-completer:new "curl")
# set edit:completion:arg-completer[man] = (bash-completer:new "man")
# set edit:completion:arg-completer[killall] = (bash-completer:new "killall")
# set edit:completion:arg-completer[aria2c] = (bash-completer:new "aria2c")
# set edit:completion:arg-completer[ip] = (bash-completer:new "ip")
# set edit:completion:arg-completer[journalctl] = (bash-completer:new "journalctl")
# set edit:completion:arg-completer[tcpdump] = (bash-completer:new "tcpdump")
# set edit:completion:arg-completer[iptables] = (bash-completer:new "iptables")
# set edit:completion:arg-completer[tmux] = (bash-completer:new "tmux")
# set edit:completion:arg-completer[fd] = (bash-completer:new "fd")
# set edit:completion:arg-completer[rg] = (bash-completer:new "rg")
# set edit:completion:arg-completer[pueue] = (bash-completer:new "pueue")


# # builtin completions
# set edit:completion:arg-completer[which] = (bash-completer:new "which"  &bash_function="_complete type" &completion_filename="complete")




















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


# $n_util:append-path~  /Library/Java/JavaVirtualMachines/graalvm-ce-java19-22.3.1/Contents/Home/bin
var p = $E:PATH

set E:PATH = /Library/Java/JavaVirtualMachines/graalvm-ce-java19-22.3.1/Contents/Home/bin:$p

# prepend:fn:add-path-prepend() {
#     local path="$1"
#     if [[ -d "$path" ]]; then
#         echo "Adding $path to the front of Elvish's PATH"
#         export PATH="$path:$PATH"
#     else
#         echo "$path is not a valid directory"
#     fi
# }


# fn prepend-path {|x|
#   var p = $E:PATH
#   set E:PATH = (put $x:p)
# }

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






# elvish (~/.elvish/rc.elv)
eval (carapace _carapace|slurp)

















# set edit:insert:binding[Alt-x] = $edit:-instant:start~
fn file-manager { edit:navigation:start }


#                                     ╭─────╮
#                                     │ env │
#                                     ╰─────╯

# https://github.com/stylelint/vscode-stylelint/issues/384#issuecomment-1332931914
set E:NODE_PATH = (npm root --quiet -g)


#                                 ╭────────────╮
#                                 │ completion │
#                                 ╰────────────╯

# https://zzamboni.org/post/using-and-writing-completions-in-elvish/
# uninstall all  pip freeze > requirements.txt;pip uninstall -r requirements.txt -y #remove-all

fn cmddir {|cmd| cd (dirname (which $cmd)) }
