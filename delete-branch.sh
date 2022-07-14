#!/bin/bash
# chmod 777 delete-branch.sh
# Script to delete remote git branches
##

# Fetch the remote resources
git fetch

# Loop through all remote branches
for branch in $(git branch -a | grep -v HEAD | grep -v master | sed /\*/d); do
        if [ -z "$(git log -1 --since='April 1, 2022' -s ${branch})" ]; then
                echo -e `git show --format="%ci %cr %an" ${branch} | head -n 1` \\t$branch
                remote_branch=$(echo ${branch} | sed 's#remotes/origin/##' )
                # To delete the branches uncomment the bellow git delete command
                git push origin --delete ${remote_branch}
        fi
done