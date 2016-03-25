configure_git() {
    mkdir -p $PWD/stow/git
    if [ ! -f $PWD/templates/gitconfig -o -f $PWD/stow/git/.gitconfig ]; then
        echo -n ""
    else
        echo "Git config"
        echo "----------"
        git_name=$(grep `whoami` /etc/passwd | cut -d ':' -f 5 | cut -d ',' -f 1)
        read -p "Git name [$git_name]: " iname
        read -p "Git e-mail address: " git_email

        if [ !  -z $iname ]; then
            git_name=$iname
        fi

        cat $PWD/templates/gitconfig | sed "s/NAME/$git_name/;s/EMAIL/$git_email/" > $PWD/stow/git/.gitconfig
    fi
}
