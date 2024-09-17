#!/bin/sh
set -e

FILELIST="$@"

if [ "$FILELIST" = "" ]; then
    echo "did not specify files to fatten!"
    exit 1
fi

echo "$FILELIST"

apelinkpls () {
    OUTPUT="$1"
    OLDNAME_X86_64="$(basename -- "$2")"
    OLDNAME_AARCH64="$(basename -- "$3")"
    TARG_FOLD="$(dirname "$OUTPUT")"
    "$APELINK" -l "$COSMO/build/bootstrap/ape.elf" \
        -l "$COSMO/build/bootstrap/ape.aarch64" \
        -M "$COSMO/ape/ape-m1.c" \
        -o "$OUTPUT" \
        "$2" \
        "$3"
    cp "$2" "$TARG_FOLD/$OLDNAME_X86_64.x86_64"
    cp "$3" "$TARG_FOLD/$OLDNAME_AARCH64.aarch64"
}

for EXE in $FILELIST; do
    apelinkpls "$RESULTS"/bin/"$EXE".com "$COSMOS_X86_64"/bin/"$EXE" "$COSMOS_AARCH64"/bin/"$EXE"
done
