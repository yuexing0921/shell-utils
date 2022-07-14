#!/bin/bash
# chmod 777 delete-tag.sh
# Script to delete remote git tag

## remote all local tag
# git tag | xargs git tag -d

# Fetch the remote resources
git fetch

# Loop through all tag
for branch in $(git tag -l | sed /\*/d); do
        if [ -z "$(git log -1 --since='May 1, 2022' -s ${branch})" ]; then
                echo -e `git show --format="%ci %cr %an" ${branch} | head -n 1` \\t$branch
                remote_branch=$(echo ${branch} | sed 's#remotes/origin/##' )
                # To delete the branches uncomment the bellow git delete command
                git push origin --delete ${remote_branch}
        fi
done