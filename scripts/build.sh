#!/usr/bin/env bash
#
# @author 		Fabrizio Destro <fabrizio@destro.dev>
# @copyright 	2019
# @license		GPL-3.0-or-later
#

loge () {
	echo "$0"
}

if command -v git > /dev/null; then
	loge "git command not found"
	exit
fi

if command -v jekyll > /dev/null; then
	loge "jekyll command not found"
	exit
fi

echo "$REMOTE_GIT"
echo "$TARGET_DIR"

# Clone the website and publish it
git clone https://github.com/dexpota/destro.me.git
# jekyll build --source ~/destro.me --destination ~/public_html
# rm -rf ~/destro.me
