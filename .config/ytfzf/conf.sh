search_region=EC
fancy_subs=1
async_thumbnails=1
sub_link_count=2
thumbnail_quality=medium
thumbnail_viewer=kitty
fzf_preview_side=right
video_pref="bestvideo[height<=?720]+bestaudio/best"
#ytdl_pref="worst+bestaudio/best"
scrape=youtube

external_menu () {
    # border_color=#9aa5cefa
    #fuzzel -d -p "  " -w 90 -l 22
    #wofi --dmenu -i -p "  Play "
    bemenu -w 0.98 -l 20 -i -H 29 -p '  Play'\
        -b\
        --fn='Iosevka NF 13'\
        --tf=#C94C4C\
        --bdr=#C94C4C\
        --hb=#C94C4C\
        --nb=#161616\
        --hf=#000000
}
