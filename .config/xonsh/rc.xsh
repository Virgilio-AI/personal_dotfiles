import os
# configure the prompt
RepoName=$(basename -s .git $(git config --get remote.origin.url))[:-6]
$PROMPT = '{BOLD_WHITE}{env_name}{BOLD_PURPLE}{cwd}{BOLD_YELLOW}({curr_branch}) -- ' + RepoName +'\n{BOLD_RED}-->$'

# create an alias

aliases['ls'] = 'ls -a --color=auto'


aliases['rm']='rm -rfd'
aliases['cp']='cp -r'
aliases['umount']='umount -v'
aliases['mount']='mount -v'
aliases['grep']='grep --color'
aliases['lg']="lazygit"
aliases['gitsa']='git submodule add'
aliases['pbcopy']='xsel --clipboard --input'
aliases['pbpaste']='xsel --clipboard --output'
aliases['cpd']='pwd|pbcopy'
aliases['nv']="nvim"
aliases['neofetch']='neofetch --ascii $HOME/.config/zsh/Logo-ascii-art.txt'
aliases['dragon-drag-and-drop']="dragon"
aliases['pacman']='sudo pacman'
aliases['tree']='tree -a'
aliases['unrar']='unrar e'
aliases['create-notebook']='python $HOME/.local/bin/create-notebook.py'

#def _shutdown(args,stdin):
#	print("do you want to shut down")
#	chsh -s /usr/bin/zsh
#	# now shutdown with the given arguments
#	stri = ""
#	for a in args:
#		stri += a + " "
#	
#	sudo shutdown @(stri)
#
#def _reboot(args,stdin):
#	print("do you want to reboot? [y/n]")
#	chsh -s /usr/bin/zsh
#	# now reboot with the given arguments
#	stri = ""
#	for a in args:
#		stri += a
#		stri += " "
#
#	sudo reboot @(stri)
#
#aliases['shutdown']=_shutdown
#aliases['reboot']=_reboot

def _pmessage():
	print("do you want to shutdown? [y/n]")


aliases['sudo shutdown']=_pmessage
aliases['sudo reboot']=_pmessage


# check if $XONSHRC_INTERACTIVE is not set




if 'STARTED_X' not in ${...}:
	$SHELL="/usr/bin/xonsh"
	$ZDOTDIR=$HOME + "/.config/zsh"
	$PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig"
	$EDITOR="nvim"

	# create an array with the default values of the PATH variable
	arr = $PATH.__dict__['_l']
	# function to add all custom paths to the PATH variable
	def recurseFolder(path):
		for filename in os.listdir(path):
			f = os.path.join(path,filename)
			if os.path.isdir(f):
				arr.append(f)
				recurseFolder(f)
	# call the function
	recurseFolder($HOME + "/.local/bin")
	# set the new values for PATH
	$PATH.__dict__['_l'] = arr

	print("do you want to startx? [y/n]")
	ans = input()
	if ans == "y" or ans == "Y" or ans == "":
		$STARTED_X = True
		startx $HOME/.config/X11/xinitrc


