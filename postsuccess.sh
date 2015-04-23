#!/bin/bash
echo "Hello"
if [ "$BRANCH" == "draft" ] && [ "$PULL_REQUEST" == false ]; then
    echo "draft"
    git checkout -B drafts 
    cp _drafts/`ls -t1 _drafts/ | head -n1` _posts/
    git add _posts/`ls -t1 _posts/ | head -n1`
    git commit -am "Autopublish from Shippable"
    git push -f -u origin master 
fi;
echo "Goodbye"