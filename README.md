Fork of: https://github.com/Automattic/action-commit-to-branch
Built for use alongside: https://github.com/marketplace/actions/latex-compilation
# Commit and push to remote branch

This action will commit and push to a specific remote branch. This is achieved by remaking the branch each time, un-merged changes will be lost!

## Inputs

### `branch`

**Required** The branch name of the branch to commit and push to. 

If the branch does not already exist, it will be created for you. 

### `commit_message`

Custom commit message. **default** "Automated commit from action""

## Example usage
```
- name: Push to built branch
  uses: Automattic/action-commit-to-branch@master
  with:
    branch: 'master-built'
    commit_message: 'Build master'
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }} # Required
```
