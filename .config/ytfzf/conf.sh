# APK con parche para MPV
# https://kitsunemimi.pw/tmp/mpv-android-2023-12-14.apk
termux_player () {
        am start --user 0 -a android.intent.action.VIEW -d "$1" is.xyz.mpv/.MPVActivity
}
url_handler=termux_player
