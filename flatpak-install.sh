#!/run/current-system/sw/bin/bash
# flatpak list --columns=application
# find flatpaks that are important
# add them to this variable

MY_FLATPAKS="
org.gimp.GIMP
md.obsidian.Obsidian
org.localsend.localsend_app
org.torproject.torbrowser-launcher
org.videolan.VLC
chat.simplex.simplex
"

#MY_FLATPAKS=(
#    org.gimp.GIMP
#    md.obsidian.Obsidian
#    )

flatpak install --assumeyes $MY_FLATPAKS
