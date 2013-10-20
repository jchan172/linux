#!/bin/bash

echo "Setting git aliases..."
#read -p "Continue? Will overwrite any conflicting aliases... [yN]" yn

echo -e "\nCurrent git global email: "
git config --global user.email
read -p "What's your email for git?  " email
if [[ $email != "" ]]; then
    git config --global user.email "$email"
fi

echo -e "\nCurrent git global name: "
git config --global user.name
read -p "What's your name for git?  " name
if [[ $name != "" ]]; then
    git config --global user.name "$name"
fi

echo -e "\nTell git pull to automatically merge from the current branch"
git config --global branch.autosetupmerge true

# Don't do this for now because it doesn't work with older versions of git
#echo -e "\nUse the new Git 2.0 default setting of simple push (safest for beginners)"
#git config --global push.default simple

echo -e "\nSetup color syntax for git"
git config --global color.ui true

echo -e "\nUse a tab-width of 4 for git diff"
git config --global core.pager "less -x4"

echo -e "\ngit s ==> Status"
git config --global --unset-all alias.s
git config --global alias.s status

echo "git b ==> Branch (all)"
git config --global --unset-all alias.b
git config --global alias.b "branch -a"

echo "git ci ==> Commit"
git config --global --unset-all alias.ci
git config --global alias.ci commit

echo "git co ==> Checkout"
git config --global --unset-all alias.co
git config --global alias.co checkout

echo "git d ==> Diff"
git config --global --unset-all alias.d
git config --global alias.d "diff --word-diff"

echo "git ds ==> Diff Staged"
git config --global --unset-all alias.ds
git config --global alias.ds "diff --staged --word-diff"

echo "git f ==> Fetch"
git config --global --unset-all alias.f
git config --global alias.f fetch

echo "git lol ==> Better log"
git config --global --unset-all alias.lol
git config --global alias.lol "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short --all -10"

echo "git unstash ==> Unstash (git stash pop)"
git config --global --unset-all alias.unstash
git config --global alias.unstash "stash pop"

echo "git ignore ==> Assume a file is unchanged"
git config --global --unset-all alias.ignore
git config --global alias.ignore "update-index --assume-unchanged"

echo "git r/rebase ==> Pull and rebase"
git config --global --unset-all alias.rebase
git config --global --unset-all alias.r
git config --global alias.r "pull --rebase"
git config --global alias.rebase "pull --rebase"

echo -e "\nAll done."