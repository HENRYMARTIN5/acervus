alias lt='ls --human-readable --size -1 -S --classify'
alias showmnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias findh='history|grep'
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias cpv='rsync -ah --info=progress2'
function cl() {
    DIR="$*";
	# if no DIR given, go home
	if [ $# -lt 1 ]; then 
		DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
	ls -F --color=auto
}
alias md='mkdir -p'