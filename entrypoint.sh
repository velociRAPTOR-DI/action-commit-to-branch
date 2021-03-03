#!/bin/sh -l

git_setup() {
  cat <<- EOF > $HOME/.netrc
		machine github.com
		login $GITHUB_ACTOR
		password $GITHUB_TOKEN
		machine api.github.com
		login $GITHUB_ACTOR
		password $GITHUB_TOKEN
EOF
  chmod 600 $HOME/.netrc

  git config --global user.email "$GITHUB_ACTOR@users.noreply.github.com"
  git config --global user.name "$GITHUB_ACTOR"
}

git_setup
git remote update
git fetch --all

git push origin --delete -f "${INPUT_BRANCH}"

git checkout -b "${INPUT_BRANCH}"

git add .
git commit -m "${INPUT_COMMIT_MESSAGE}"
git push --set-upstream origin "${INPUT_BRANCH}"
