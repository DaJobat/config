# Jobat's bash_profile
# Link with source ~/$JOBATCONF/.bash_profile
alias g="git"
alias cls="clear"
alias ls="ls -h --file-type"
alias ll="ls -lh --group-directories-first"
alias fd="fdfind"
alias vs="vim -S Session.vim"

# stop the term from reacting to ctrl-d and disconnecting a session.
export IGNOREEOF=100
# make PS behave like BSD (i.e. not complain when i do ps -x)
export PS_PERSONALITY=bsd
export PS1="\u:\w$ "

# add in Go bin dir
export PATH=$PATH:/home/jobat/go/bin/
