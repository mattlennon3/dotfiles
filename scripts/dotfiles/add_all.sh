#!/bin/bash
# Created on 2022-04-01 by Matt Lennon
#

# TODO: Derive from aliases
alias dotf='/usr/bin/git --git-dir=/Users/matt-dev/git/dots/my-symlinked-dotfiles/ --work-tree=/Users/matt-dev '


add_all() {
	out=$(dotf status -s)
	out=$("$out":0:3)
	echo $out
}

add_all
