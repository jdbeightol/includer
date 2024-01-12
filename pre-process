#!/bin/bash -e

function cleanup {
    rm "$tmpfile"
}

set -o pipefail

readonly INCLUDER="#include"

infile=${1:?missing input file}
outfile=${2:?missing output file}

if ! grep "^#include " "$infile" &>/dev/null; then
    cat "$infile" > "$outfile"
    exit 0
fi


tmpfile=$(mktemp)
trap cleanup EXIT
cat "$infile" > "$tmpfile"

grep "^#include .*$" "$infile" |
    while read i target; do
        matcher="^$INCLUDER $target$"
        if [[ ! -f "$target" ]]; then
            1>&2 echo "unknown file or invalid include: $matcher"
            exit 1
        fi
        1>&2 echo "including $target..."
        sed -i'' -e "\\\`$matcher\`{ \\\`$matcher\`{r $target
                }; d
                }" "$tmpfile"
    done 

cat "$tmpfile" > "$outfile"
