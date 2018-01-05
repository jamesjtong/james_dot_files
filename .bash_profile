CDPATH=/Users/james/Development/
#export PATH="$PATH:/usr/local/bin/mongod" homebrew already links it
export PATH=/Users/james/Development/code/activator-1.2.10-minimal:/Users/james/.local/bin:$PATH

# Configuring Our Prompt
# ======================
  # This function is called in your prompt to output your active git branch.
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
  if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
  fi

  # This function builds your prompt. It is called below
  function prompt {
    # Define some local colors
    local         RED="\[\033[0;31m\]" # This syntax is some weird bash color thing I never
    local   LIGHT_RED="\[\033[1;31m\]" # really understood
    local        CHAR="╄"
    # ╄♥ ☆ - Keeping some cool ASCII Characters for reference

    # Here is where we actually export the PS1 Variable which stores the text for your prompt
    export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \[\e[32m\]\W\[\e[0m\]\n\[\e[0;31m\]╄╄ \[\e[0m\]"
      PS2='> '
      PS4='+ '
    }

  # Finally call the function and our prompt is all pretty
  prompt

  # ITERM 2
  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

  # FOR ITERM 2 SHELL INTEGRATION bash: Place this in .bashrc.
  function iterm2_print_user_vars() {
    iterm2_set_user_var currentDir $(basename "$PWD")
  }


# Environment Variables
# =====================
  # Library Paths
  # These variables tell your shell where they can find certain
  # required libraries so other programs can reliably call the variable name
  # instead of a hardcoded path.
    # NODE_PATH
    # Node Path from Homebrew I believe
    # export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

    # PYTHON_SHARE
    # Python Shared Path from Homebrew I believe
    export PYTHON_SHARE='/usr/local/share/python'

    # at JET they call it local, change back to development later
    export NODE_ENV='local'
    # Those NODE & Python Paths won't break anything even if you
    # don't have NODE or Python installed. Eventually you will and
    # then you don't have to update your bash_profile

    # export DOCKER_TLS_VERIFY="1"
    # export DOCKER_HOST="tcp://192.168.99.100:2376"
    # export DOCKER_CERT_PATH="$HOME/.docker/machine/machines/dev1"
    # export DOCKER_MACHINE_NAME="dev1"

  # Configurations

    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    export GIT_MERGE_AUTOEDIT='no'

    # Editors
    # Tells your shell that when a program requires various editors, use sublime.
    # The -w flag tells your shell to wait until sublime exits
    
    export SVN_EDITOR="mvim -f"
    export GIT_EDITOR="mvim -f"
    export EDITOR="mvim -f"
    export VISUAL=$EDITOR
    export MYVIMRC_AFTER="$HOME/.vimrc.after"
    export MYVIMRC="$HOME/james_dot_files/.vimrc"
  # Paths

    # The USR_PATHS variable will just store all relevant /usr paths for easier usage
    # Each path is seperate via a : and we always use absolute paths.

    # A bit about the /usr directory
    # The /usr directory is a convention from linux that creates a common place to put
    # files and executables that the entire system needs access too. It tries to be user
    # independent, so whichever user is logged in should have permissions to the /usr directory.
    # We call that /usr/local. Within /usr/local, there is a bin directory for actually
    # storing the binaries (programs) that our system would want.
    # Also, Homebrew adopts this convetion so things installed via Homebrew
    # get symlinked into /usr/local
    export USR_PATHS="/usr/local/bin:/usr/local:/usr/local/sbin:/usr/bin"

    # Hint: You can interpolate a variable into a string by using the $VARIABLE notation as below.

    # We build our final PATH by combining the variables defined above
    # along with any previous values in the PATH variable.

    # Our PATH variable is special and very important. Whenever we type a command into our shell,
    # it will try to find that command within a directory that is defined in our PATH.
    # Read http://blog.seldomatt.com/blog/2012/10/08/bash-and-the-one-true-path/ for more on that.
    export PATH="$USR_PATHS:$PYTHON_SHARE:$PATH"

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

    export SPD_API_TOKEN="0j1baaw4hwmp49ii0328kpm9zhlodo"
    # If you go into your shell and type: $PATH you will see the output of your current path.
    # For example, mine is:
    # /Users/avi/.rvm/gems/ruby-1.9.3-p392/bin:/Users/avi/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/avi/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/avi/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin:/usr/local/share/python:/bin:/usr/sbin:/sbin:

# Helpful Functions
# =====================

# A function to CD into the desktop from anywhere
# so you just type desktop.
# HINT: It uses the built in USER variable to know your OS X username

# USE: desktop
#      desktop subfolder
function desktop {
  cd /Users/$USER/Desktop/$@
}

# A function to easily grep for a matching process
# USE: psg postgres
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# A function to extract correctly any archive based on extension
# USE: extract imazip.zip
#      extract imatar.tar
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

#turn docker-machine dev1 and controltower on
function dmo {
  machine_status=$(docker-machine ls | grep dev1 | awk '{print $3}')
  if [ $machine_status == Stopped ] || [ $machine_status == Saved ]
  then
    docker-machine start dev1

    ctrltower_status=$(docker ps | grep ctrltower_api | awk '{print "on"}')
    if [ $ctrltower_status == on ]
    then
      echo 'api_ctrltower is already on'
    else
      docker start ctrltower_db local_memcached ctrltower_api
    fi
  else
    echo "docker-machine is already on"
    ctrltower_status=$(docker ps | grep ctrltower_api | awk '{print "on"}')

    if [ $ctrltower_status == on ]
    then
      echo 'ctrltower_api is already on'
    else
      echo 'starting ctrltower_api'
      docker start ctrltower_db local_memcached ctrltower_api
    fi
  fi
}

# git clone and cd into dir
function gclone(){
    url=$1;
    reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
    git clone $url $reponame;
    cd $reponame;
}

function nombom() {
  local installer="npm"
  if [ -f ./yarn.lock ]; then
    installer="yarn"
  fi
  npm cache clear &&
    bower cache clean &&
    rm -rf node_modules bower_components &&
    $installer install &&
    bower install
}

# Aliases
# =====================
  # LS
  alias l='ls -lah'
  alias jtunnel="ssh -f -i ~/.ssh/id_rsa.pub ubuntu@jobs.rhinoserve.com -L 3310:master.db.int.rhinoserve.com:3306 -N"
  # Git
  alias gst="git status"
  alias gs="git status"
  alias gl="git pull"
  alias gp="git push"
  alias ga="git add"
  alias gd="git diff"
  alias gc="git commit -v"
  alias gca="git commit -v -a"
  alias gb="git branch"
  alias gba="git branch -a"
  alias gstale='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
  alias gprune="git remote prune origin"
  alias gclean='gstale && gprune'
  alias grmnew='git clean -fd'

  # VAGRANT

  alias vgs='vagrant global-status'
  # alias vagrantr="cd $HOME/cne/adminportal && vagrant up && vagrant provision && cd $HOME/cne/cneapi && vagrant up && vagrant provision && cd $HOME/cne/scene-two-backend && vagrant up && vagrant provision && cd $HOME/cne/playerservice && vagrant up && vagrant provision"
  alias vagrantr="cd $HOME/cne/adminportal && vagrant up db && vagrant provision db"

  #====== DOCKER
  # alias dip="boot2docker ip"
  # alias dra="docker rm -f $(docker ps -a -q)"


  #====== SSH Shortcuts
  alias rh="ssh ubuntu@jobs.rhinoserve.com"

  alias james-api="ssh ec2-user@54.88.231.130"
  alias git="hub"
  
# Final Configurations and Plugins
# =====================
  # Git Bash Completion
  # Will activate bash git completion if installed
  # via homebrew
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi

  # RVM
  # Mandatory loading of RVM into the shell
  # This must be the last line of your bash_profile always
  [[ -s "/Users/$USER/.rvm/scripts/rvm" ]] && source "/Users/$USER/.rvm/scripts/rvm"  # This loads RVM into a shell session.

