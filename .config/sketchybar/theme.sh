THEME=$(/Applications/Ghostty.app/Contents/MacOS/ghostty +show-config | awk -F= '/theme/ { print $2 }' | sed 's/^[[:space:]]*//')
# shellcheck source=/dev/null
source "$HOME/.config/sketchybar/themes/$THEME.sh"

# BACKGROUND_COLOR=$(
#     ghostty +show-config |
#         awk -F= '/background/ { print $2 } ' |
#         sed 's/^[[:space:]]*//' |
#         head -n1 |
#         sed 's/^#/0xFF/'
# )
#
# BORDER_COLOR=$(
#     ghostty +show-config |
#         awk -F= '/border/ { print $2 } ' |
#         sed 's/^[[:space:]]*//' |
#         head -n1 |
#         sed 's/^#/0xFF/'
# )
#
# HIGHLIGHT_COLOR=$(
#     ghostty +show-config |
#         awk -F= '/palette = 4/ { print $2 } ' |
#         sed 's/^[[:space:]]*//' |
#         head -n1 |
#         sed 's/^#/0xFF/'
# )
#
# ICON_COLOR=$(
#     ghostty +show-config |
#         awk -F= '/^palette=4/ {
#             gsub(/^[ \t]+/, "", $2)
#             gsub(/^#/, "0xFF", $2)
#             print $2
#         }'
# )
#
# TEXT_COLOR=$(
#     ghostty +show-config |
#         awk -F= '/foreground/ { print $2 } ' |
#         sed 's/^[[:space:]]*//' |
#         head -n1 |
#         sed 's/^#/0xFF/'
# )
#
# export BACKGROUND_COLOR
# export BORDER_COLOR
# export HIGHLIGHT_COLOR
# export ICON_COLOR
# export TEXT_COLOR
