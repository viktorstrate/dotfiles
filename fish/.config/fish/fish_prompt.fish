
function prompt_git_branch
    set -l branch (
        begin
            git symbolic-ref HEAD; or \
            git rev-parse --short HEAD
        end ^/dev/null | sed -e 's|^refs/heads/||'
    )

    if test $branch
        echo -n -s (set_color brred)
        echo -n -s $branch ' '
    end
end

set fish_color_cwd_root 'red'

function fish_prompt --description 'Write out the prompt'
	set -l color_cwd
    set -l suffix
    set -l success

    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '$'
    end

    if test $status = 0
        set success "green"
    else
        set success "red"
    end

    # echo -n -s (set_color normal) "$USER "
    echo -n -s (set_color $color_cwd) (prompt_pwd) ' '
    echo -n -s (prompt_git_branch)
    echo -n -s (set_color $success) "$suffix "
end

function fish_greeting
    echo -s "Welcome " (whoami)
end
