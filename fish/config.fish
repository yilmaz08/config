export GPG_TTY=$(tty)

set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_title
    echo (fish_prompt_pwd_dir_length=0 prompt_pwd);
end

function __zoxide_pwd
    builtin pwd -L
end

if ! builtin functions --query __zoxide_cd_internal
    if builtin functions --query cd
        builtin functions --copy cd __zoxide_cd_internal
    else
        alias __zoxide_cd_internal='builtin cd'
    end
end

function __zoxide_cd
    __zoxide_cd_internal $argv
end

function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and command zoxide add -- (__zoxide_pwd)
end

if test -z $__zoxide_z_prefix
    set __zoxide_z_prefix 'z!'
end
set __zoxide_z_prefix_regex ^(string escape --style=regex $__zoxide_z_prefix)

function __zoxide_z
    set -l argc (count $argv)
    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
    else if set -l result (string replace --regex $__zoxide_z_prefix_regex '' $argv[-1]); and test -n $result
        __zoxide_cd $result
    else
        set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
        and __zoxide_cd $result
    end
end

function __zoxide_z_complete
    set -l tokens (commandline --current-process --tokenize)
    set -l curr_tokens (commandline --cut-at-cursor --current-process --tokenize)

    if test (count $tokens) -le 2 -a (count $curr_tokens) -eq 1
        # If there are < 2 arguments, use `cd` completions.
        complete --do-complete "'' "(commandline --cut-at-cursor --current-token) | string match --regex '.*/$'
    else if test (count $tokens) -eq (count $curr_tokens); and ! string match --quiet --regex $__zoxide_z_prefix_regex. $tokens[-1]
        # If the last argument is empty and the one before doesn't start with
        # $__zoxide_z_prefix, use interactive selection.
        set -l query $tokens[2..-1]
        set -l result (zoxide query --exclude (__zoxide_pwd) --interactive -- $query)
        and echo $__zoxide_z_prefix$result
        commandline --function repaint
    end
end
complete --command __zoxide_z --no-files --arguments '(__zoxide_z_complete)'

function __zoxide_zi
    set -l result (command zoxide query --interactive -- $argv)
    and __zoxide_cd $result
end

abbr --erase z &>/dev/null
alias z=__zoxide_z
alias cd=__zoxide_z

abbr --erase zi &>/dev/null
alias zi=__zoxide_zi
alias cdi=__zoxide_zi

function ranger
 	set tempfile (mktemp -t tmp.XXXXXX)
	command ranger --choosedir=$tempfile $argv
	set return_value $status

	if test -s $tempfile
		set ranger_pwd (cat $tempfile)
		if test -n $ranger_pwd -a -d $ranger_pwd
			builtin cd -- $ranger_pwd
		end
	end

	command rm -f -- $tempfile
	return $return_value
end

cat ~/.config/alias.sh | source
zoxide init fish | source
starship init fish | source
