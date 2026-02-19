#!/bin/sh
echo updating addons.xml:
echo '<?xml version="1.0" encoding="UTF-8"?>' > addons.xml
echo '<addons>' >> addons.xml
for REPO in $(ls -1); do
    [ -d "${REPO}" ] || continue
    [ -f "${REPO}/addon.xml" ] || continue
    echo "  adding $REPO"
    cat "${REPO}/addon.xml" | grep -v '<?xml' >> addons.xml
done
echo '</addons>' >> addons.xml
echo creating addons.xml.md5
md5sum addons.xml|cut -d" " -f1 >addons.xml.md5
echo done
