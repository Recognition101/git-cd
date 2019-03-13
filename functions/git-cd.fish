function git-cd -a path -d "Execute cd command from Git project root directory"
  if [ "$path" = "--help" ] || [ "$path" = "-h" ]
    _git_cd_help
    return
  end

  set -l is_git_project (git rev-parse --is-inside-work-tree)

  if [ -z "$is_git_project" ]
    return
  end

  set -l current_dir_from_git_project_root (git rev-parse --show-cdup)

  if [ -z "$current_dir_from_git_project_root" ] && [ -z "$path" ]
    return
  end

  eval "cd $current_dir_from_git_project_root$path"
end

function _git_cd_help
  echo "Usage:"
  echo "  git-cd [PATH]    Jump to [PATH] from Git project root directory"
  echo
  echo "Examples:"
  echo "  git-cd"
  echo "  git-cd path/to/dir"
end
