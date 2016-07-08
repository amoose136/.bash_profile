# Fix colors and terminal display to something useful
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Define server aliases
servers[0]="newton=___REDACTED_USERNAME1___@newton.server.address.utk.edu" #modify these and add your own aliases for 
servers[1]="rhea=___REDACTED_USERNAME2____@rhea.server.address.gov..gov"
#ports in range 40000-40005 will be used for piping. 
export PIPEBACK=$(($RANDOM%5+40000)) 
#The reason we don't use the same ports all the time is to avoid refusals with multiple connected terminals.
# Define ssh behavior
function ssh() {
	input="$@"
	if [[ $(echo ${servers[@]} | tr ' ' '\n'| grep "$input=") ]]; then #This uses a complicated expression because bash 3.5 (the last version osx ships with) doesn't support associative arrays
		arg="$(echo ${servers[@]} | tr ' ' '\n'| grep $input= | sed s/$@=//)"
    	command ssh -R$PIPEBACK:localhost:22 $arg -t \
    	"bash --init-file <(echo \"export LOCAL_PWD=`pwd`;\
    		cd ~;\
    		source ~/.bash_profile;\
    		export PIPEBACK=$PIPEBACK;\
    		alias sshback='ssh -p$PIPEBACK:22 $USER@127.0.0.1';\
    		function scpb() \
    		{ \
    			scp -P$PIPEBACK \\`echo \$`@ $USER@127.0.0.1:`pwd`/\\`echo \$`@;\
    		}\")"
    	# Adds support for command scpb which accepts filenames as arguments and will send them to the directory the ssh shell was invoked from
 		# Also adds suppoer for command sshback which sshs back into the local host at the ~ directory
    else
    	#as fallback use standard ssh behavior
        command ssh "$@"
    fi
}

# Add support for qlk as quicklook commands
alias qlk="qlmanage -p $@ &> /dev/null"
# Better ls command
alias ls='ls -GFh'