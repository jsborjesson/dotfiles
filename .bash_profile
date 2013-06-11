# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# This loads NVM
[[ -s /Users/alcesleo/.nvm/nvm.sh ]] && . /Users/alcesleo/.nvm/nvm.sh 