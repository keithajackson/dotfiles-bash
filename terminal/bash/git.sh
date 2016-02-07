alias gst='git status'
alias gr='git remote -v'
alias gra='git remote add'
alias grr='git remote remove'
alias gc='git commit'
alias ga='git add'
alias gph='git push'
alias gd='git diff'
alias gco='git checkout'
alias glg='git log'
alias gpl='git pull'

# git clone && cd
gccd() {
  git clone "$@" | tee $tmp
  repo_name=$(awk -F\' '/Cloning into/ {print $2}' $tmp)
  rm $tmp
  printf "changing to directory %s\n" "$repo_name"
  cd "$repo_name"
}
