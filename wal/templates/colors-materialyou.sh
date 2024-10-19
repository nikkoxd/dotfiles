#!/bin/bash

src="{color4.strip}"
lightness_values=(0 10 20 40 60 80 100)

generate_tonal_palette() {{
    local role_name=$1
    local chroma=$2
    local hue_rotation=$3

    for lightness in "${{lightness_values[@]}}"; do
        var_name="${{role_name}}_${{lightness}}"

        if [ -z "$hue_rotation" ]; then
            color=$(pastel set chroma "$chroma" "$src" | pastel set lightness "$lightness" | pastel format hex | sed 's/#//')
        else
            color=$(pastel set chroma "$chroma" "$src" | pastel rotate "$hue_rotation" | pastel set lightness "$lightness" | pastel format hex | sed 's/#//')
        fi

        export "$var_name"="$color"
        pastel format hex "$color"
    done
}}

# Generate palettes for each color role
generate_tonal_palette "primary" 48
generate_tonal_palette "secondary" 16
generate_tonal_palette "tertiary" 24 60
generate_tonal_palette "neutral" 4
generate_tonal_palette "neutral_variant" 8

