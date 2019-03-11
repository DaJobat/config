# Jobat's bashrc
# Link with source ~/$JOBATCONF/.bashrc
alias g="git"
alias cls="clear"
alias ll="ls -lh --group-directories-first"

# stop the term from reacting to ctrl-d and disconnecting a session.
export IGNOREEOF=100
# make PS behave like BSD (i.e. not complain when i do ps -x)
export PS_PERSONALITY=bsd
set -o vi
