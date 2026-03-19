function scheme
    argparse h/help l/light 'i/image=' 'r/runner=' -- $argv
    or return

    function __color_print_help
        echo "Usage: color [OPTIONS]"
        echo
        echo "Options:"
        echo "  -h, --help            Show this help message"
        echo "  -i, --image [image]   Image to generate colorscheme from"
        echo "  -l, --light           Use a light color scheme"
        echo "  -r, --runner [pywal or matugen]"
        echo "                        Select a runner to use"
    end

    if set -ql _flag_help
        __color_print_help
        return 0
    end

    if not set -q _flag_image
        echo "Error: No image specified"
        __color_print_help
        return 1
    end

    set -l light false
    if set -ql _flag_light
        set -l light true
    end

    set -l image ""
    set -ql _flag_image[1]
    and set image $_flag_image[-1]

    set -l runner pywal
    set -ql _flag_runner[1]
    and set runner $_flag_runner[-1]

    if not contains -- $runner pywal matugen
        echo "Error: Invalid runner specified"
        __color_print_help
        return 1
    end

    switch $runner
        case pywal
            if $light
                command wal -li "$image" --cols16 darken
            else
                command wal -i "$image" --cols16 lighten
            end
        case matugen
            if $light
                command matugen image "$image" --mode light --source-color-index 0
            else
                command matugen image "$image" --mode dark --source-color-index 0
            end

            set -l image (realpath "$image")
            set -l home (realpath "$HOME")
            set -l plist_path "$home/Library/Application Support/com.apple.wallpaper/Store/Index.plist"

            if test -f "$plist_path"
                set backup_path "$home/Library/Application Support/com.apple.wallpaper/Store/Index.plist.bak"
                cp "$plist_path" "$backup_path"
                echo "Backed up $plist_path to $backup_path"
                /usr/libexec/PlistBuddy -c "Set :AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///$image" "$plist_path"
                killall WallpaperAgent
            end
    end

    sketchybar --reload &
    osascript ~/.config/ghostty/reload.scpt &

    wait
    and return $status
end
