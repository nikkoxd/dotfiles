#!/usr/bin/env fish

function projects
  set DEV_DIR $HOME/dev

  # Check dependencies
  for cmd in fd fzf git
      if not type -q $cmd
          echo "Error: $cmd is not installed."
          exit 1
      end
  end

  # Find top-level project directories
  set projects (fd . $DEV_DIR --max-depth 1 --type d --exclude .git)

  if test (count $projects) -eq 0
      echo "No projects found in $DEV_DIR"
      exit 1
  end

  # Launch fzf
  set selected (printf "%s\n" $projects | \
      fzf \
      --layout=reverse \
      --prompt="projects > " \
      --preview '
          echo "📁 Root Contents:"
          ls -A --color=always {1}
          echo
          if test -d {1}/.git
              echo "🌿 Git Status:"
              git -C {1} status -sb
          end
      ' \
      --preview-window=right:60%)

  if test -z "$selected"
    return 0
  end

  cd "$selected"

  # Open in editor
  if set -q EDITOR
      $EDITOR
  else
      echo "EDITOR not set."
  end
end
