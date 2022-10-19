#! /bin/sh

instance=$3
class=$2
id=${1?}

FLOATING_DESKTOP_ID=$(bspc query -D -d '^5')
desk_id=$(bspc query -D -d "${5:-focused}")

[ "$FLOATING_DESKTOP_ID" = "$desk_id" ] && echo "state=floating"

case $instance.$class in
    # *.Chromium) chromium ;;
    # *.Emacs) emacs ;;
    # *.Gimp) gimp ;;
    # *.Gitk) gitk ;;
    # *.Pidgin) pidgin ;;
    # *.Pinentry-gtk-2) pinentry_gtk_2 ;;
    # *.Signal) signal ;;
    # *.Spotify) spotify ;;
    # *.TelegramDesktop) telegram_desktop ;;
    # *.TigerVNC*) tigervnc ;;
    # *.XCalc) xcalc ;;
    # *.Xmessage) xmessage ;;
    # *.[Ff]irefox) firefox ;;
    # *.mpv) mpv ;;
    # *.thunderbird) thunderbird ;;
    # *.zoom*) zoom ;;
    # *org.remmina.Remmina) remmina ;;
    # [lL]ibre[oO]ffice*) libreoffice ;;
    # jetbrains-idea.jetbrains-idea) jetbrains_idea ;;
    # stj*.st) stj1 ;;
    # vmrc.Vmrc) vmrc ;;
    # weechatw.*) weechat ;;
    .)
        case $(exec ps -p "$(exec xdo pid "$id")" -o comm= 2>/dev/null) in
            spotify) echo "desktop=^5 state=floating" ;;
            slack) echo "desktop=^1" ;;
            *) exit 0 ;;
        esac
        ;;
esac