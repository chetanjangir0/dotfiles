#!/bin/bash

# Default output file
outfile="$1"
shift

# If no output provided, fallback
if [ -z "$outfile" ]; then
  outfile="merged.pdf"
fi

# Merge images into PDF in the order received
img2pdf "$@" -o "$outfile"

echo "✅ Created $outfile"
