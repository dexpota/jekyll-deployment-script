#!/usr/bin/env bash
#
# A deploying script for Jekyll websites generation. Clone the remote repository
# REMOTE_GIT and generate a static website inside TARGET_DIR.
#
# @author 		Fabrizio Destro <fabrizio@destro.dev>
# @copyright 	2019
# @license		GPL-3.0-or-later
# @references
#   https://developer.github.com/webhooks/
# @additional:
# 	You can use a tool like https://github.com/adnanh/webhook to execute this
# 	script

loge () {
	echo "$1"
}

if ! command -v git > /dev/null; then
	loge "git command not found"
	exit
fi

if ! command -v jekyll > /dev/null; then
	loge "jekyll command not found"
	exit
fi

echo "$REMOTE_GIT"
echo "$TARGET_DIR"

clone_directory=$(mktemp -d)

mkdir -p "$TARGET_DIR"

# Clone the website and publish it
git clone "$REMOTE_GIT" "$clone_directory"

cd "$clone_directory" || exit
bundle install
bundle exec jekyll build --source "$clone_directory" --destination "$TARGET_DIR"
