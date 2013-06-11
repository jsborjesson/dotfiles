# Load all the files
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# init z
. `brew --prefix`/etc/profile.d/z.sh

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# This loads NVM
[[ -s /Users/alcesleo/.nvm/nvm.sh ]] && . /Users/alcesleo/.nvm/nvm.sh 