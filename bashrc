# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias egrep="grep -E"

alias get-ip="hostname -I | awk '{print $1}'"

alias in="sudo dnf install"
alias dser="dnf search"

alias pa="php artisan $1"
alias startweb="sudo /opt/lampp/lampp startapache && sudo /opt/lampp/lampp startmysql"
alias stopweb="sudo /opt/lampp/lampp stopapache && sudo /opt/lampp/lampp stopmysql"

alias gs="git status"
alias gaa="git add ."
alias ga="git add"
alias gc="git commit -m"
alias gaac="git add . && git commit -m"
alias gck="git checkout"
alias gnb="git checkout -b"
alias gb="git branch"
alias gl="git log"

function gac () {
  message="${@: -1}"
  files=("${@:1:$#-1}")
  git add "${files[@]}" && git commit -m "$message"
}

# Pull the latest changes from a remote branch
# (current by default, or you can speficy which specific branch you'd like to pull from)
function gpull () {
  if [ -z "$1" ]
    then
      git pull origin `git rev-parse --abbrev-ref HEAD`
    else
      git pull origin $1
  fi
}

# Push the local changes to the remote branch
# (current branch by default, or you can specify a different one)
function gpush () {
  if [ -z "$1" ]
    then
      git push origin `git rev-parse --abbrev-ref HEAD`
    else
      git push origin $1
  fi
}


function cursor(){
  (nohup /usr/local/bin/cursor.AppImage "$@" > /dev/null 2>&1 &)
}

alias lvi="composer install && npm install"
alias lvcl="cp .env.example .env && lvi && pa key:generate"

alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

alias fp="fzf --preview 'cat {} | bat --style=numbers --color=always'"
alias cdf='cd "$(find $HOME -type d -not -path "*/\.*" | fzf)"'


alias pbcopy="xsel --clipboard"
alias pbpaste="xsel --clipboard --output"
alias post="~/apps/Postman/Postman"
