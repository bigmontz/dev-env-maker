@echo off

ECHO Configuring hooks path to %~dp0hooks
CALL git config --global core.hooksPath %~dp0hooks
ECHO Hooks configured

ECHO Configuring aliases
CALL git config --global --remove-section alias
CALL git config --global alias.co "checkout"
CALL git config --global alias.br "branch"
CALL git config --global alias.ci "commit"
CALL git config --global alias.st "status -s"
CALL git config --global alias.unstage "reset HEAD --"
CALL git config --global alias.last "log -1 HEAD"
CALL git config --global alias.lg "log --oneline"
CALL git config --global alias.glg "log --oneline --graph"
CALL git config --global alias.sync "^!(clear && git pull && git push && git st)"
CALL git config --global alias.ticket "^!(git unsetticket || true) && git config --local redmine.ticket $1"
CALL git config --global alias.getticket "config --local redmine.ticket"
CALL git config --global alias.unsetticket "config --local --unset redmine.ticket"
ECHO Aliases configured

ECHO Configuring autocrlf FALSE
CALL git config --global core.autocrlf false
ECHO autocrlf configured