sketchybar  --add   item discord left \
            --set   discord \
                    icon.font="Symbols Nerd Font:Regular:14.0" \
                    update_freq=60 \
                    script="$HOME/.config/sketchybar/plugins/discord.sh" \
                    click_script="open -a Discord" \
            --subscribe discord system_woke
