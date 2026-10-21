#!/bin/sh
# Choose which design the site hosts.
#
#   scripts/use-version.sh            list the versions and show which one is live
#   scripts/use-version.sh <name>     host versions/<name>/index.html as site/index.html
#   scripts/use-version.sh <name> -f  switch even if site/index.html has unsaved edits
#
# Each design lives in versions/<name>/index.html and is edited there. site/ keeps the
# shared images, robots.txt and sitemap.xml; its index.html is a copy of the live version.
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
live_file="$root/site/index.html"

version_of() { sed -n 's/.*<meta name="portfolio-version" content="\([^"]*\)".*/\1/p' "$1" | head -n 1; }
live=$(version_of "$live_file")

if [ $# -eq 0 ]; then
  for dir in "$root"/versions/*/; do
    name=$(basename "$dir")
    if [ "$name" = "$live" ]; then echo "* $name (live)"; else echo "  $name"; fi
  done
  exit 0
fi

name=$1
force=${2:-}
source_file="$root/versions/$name/index.html"

if [ ! -f "$source_file" ]; then
  echo "No version called '$name'. Run scripts/use-version.sh to list them." >&2
  exit 1
fi

# Refuse to throw away edits made straight to site/index.html
if [ "$force" != "-f" ] && [ -n "$live" ] && [ -f "$root/versions/$live/index.html" ] \
  && ! cmp -s "$live_file" "$root/versions/$live/index.html"; then
  echo "site/index.html has edits that are not in versions/$live/index.html." >&2
  echo "Copy them there first (cp site/index.html versions/$live/index.html), or pass -f to discard them." >&2
  exit 1
fi

cp "$source_file" "$live_file"
echo "Now hosting: $name"
