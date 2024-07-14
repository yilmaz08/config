MAIN_KBL="tr"
SECOND_KBL="us"

CURRENT=$(setxkbmap -print -verbose 10 | grep layout | awk '{print $2}')

if [ "$MAIN_KBL" == "$CURRENT" ]; then
    setxkbmap $SECOND_KBL;
elif [ "$SECOND_KBL" == "$CURRENT" ]; then
    setxkbmap $MAIN_KBL;
else
    setxkbmap $MAIN_KBL;
fi
