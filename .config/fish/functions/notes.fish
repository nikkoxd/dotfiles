#!/usr/bin/env fish

function notes
  set NOTES_DIR $HOME/Notes

  # Check dependencies
  for cmd in fd fzf
      if not type -q $cmd
          echo "Error: $cmd is not installed."
          exit 1
      end
  end

  # Find markdown files
  set files (fd -e md . $NOTES_DIR)

  if test (count $files) -eq 0
      echo "No markdown files found in $NOTES_DIR"
      exit 1
  end

  # Launch fzf
  set selected (printf "%s\n" $files | \
      fzf \
      --layout=reverse \
      --border \
      --prompt="notes > " \
      --preview '
          if type -q bat
              bat --style=plain --color=always {}
          else
              sed -n "1,200p" {}
          end
      ' \
      --preview-window=right:60%,border-left)

  if test -z "$selected"
      return 0
  end

  cd $NOTES_DIR

  # Open in editor
  if set -q EDITOR
      $EDITOR "$selected"
  else
      echo "EDITOR not set."
  end
end
