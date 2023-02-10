find ~/Library/Application\ Support/Google/Chrome/Default/Extensions -type f -name "manifest.json" -print0 | xargs -I {} -0 grep '"name":' "{}" | uniq
