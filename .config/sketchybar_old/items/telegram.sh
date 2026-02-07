sketchybar  --add   item telegram left \
            --set   telegram \
                    icon.font="Symbols Nerd Font:Regular:14.0" \
                    update_freq=60 \
                    script="$HOME/.config/sketchybar/plugins/telegram.sh" \
                    click_script="open -a Telegram" \
            --subscribe telegram system_woke
