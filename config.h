#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " \ue621 "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).

#define BLOCKS(X)             \
    X("", "setxkbmap -query | grep layout | awk '{ print $2 }'", 0, 11) \ 
    X("", "~/.local/dwm/dwmblocks-async/sb-wifi.sh", 5, 5) \ 
    X("", "~/.local/dwm/dwmblocks-async/sb-vol.sh", 0, 6) \ 
    X("", "~/.local/dwm/dwmblocks-async/sb-bri.sh", 0, 7) \ 
    X("", "~/.local/dwm/dwmblocks-async/sb-bat.sh", 10, 8) \ 
    X("", "~/.local/dwm/dwmblocks-async/sb-cpu.sh", 5, 12) \ 
    X(" ", "date '+%-d/%-m'", 60, 9) \
    X("󰥔 ", "date '+%H:%M:%S'", 1, 10)

/*    X("", "sb-disk", 1800, 3) \
    X("", "sb-memory", 10, 4) \
    X("", "sb-loadavg", 5, 5) \
    X("", "sb-mic", 0, 6)     \
    X("", "sb-record", 0, 7)  \
    X("", "sb-volume", 0, 8)  \
    X("", "sb-battery", 5, 9) \
    X("", "sb-date", 1, 10)*/

#endif  // CONFIG_H
