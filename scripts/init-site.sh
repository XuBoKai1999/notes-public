#!/usr/bin/env bash

set -e

CONTENT_DIR="content"

echo "Initializing site structure..."

# -----------------------------
# 建立資料夾
# -----------------------------

mkdir -p "$CONTENT_DIR"

for dir in \
    "Physics" \
    "Mathematics" \
    "Computing" \
    "Research" \
    "Physics Essays" \
    "Essays" \
    "Journal"
do
    mkdir -p "$CONTENT_DIR/$dir"
done

# -----------------------------
# 建立 index.md
# -----------------------------

create_index () {
    local file="$1"

    if [[ ! -f "$file" ]]; then
        cat > "$file" <<EOF
---
title: $(basename "$(dirname "$file")")
---

# $(basename "$(dirname "$file")")
EOF
        echo "Created $file"
    else
        echo "Skip $file"
    fi
}

# content/index.md
if [[ ! -f "$CONTENT_DIR/index.md" ]]; then
cat > "$CONTENT_DIR/index.md" <<EOF
---
title: Home
---

# Home
EOF
echo "Created $CONTENT_DIR/index.md"
else
echo "Skip $CONTENT_DIR/index.md"
fi

# content/about.md
if [[ ! -f "$CONTENT_DIR/about.md" ]]; then
cat > "$CONTENT_DIR/about.md" <<EOF
---
title: About
---

# About
EOF
echo "Created $CONTENT_DIR/about.md"
else
echo "Skip $CONTENT_DIR/about.md"
fi

# 第一層 index
for dir in \
    "Physics" \
    "Mathematics" \
    "Computing" \
    "Research" \
    "Physics Essays" \
    "Essays" \
    "Journal"
do
    create_index "$CONTENT_DIR/$dir/index.md"
done

echo
echo "Done."
