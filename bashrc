# ~/.bashrc: executed by bash(1) for non-login shells.
# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022
# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

####################### YYXL’s personal aliases ###########################

# sudo apt-get install tree
alias t='tree'

# WINDOWS SYSTEM BASHRC PATH WILL BE SET LATER
system=$(uname -s)
if [ "$system" == "Darwin" ]; then
   ### open bashrc and source it
   alias nb='nano ~/.bash_profile'
   # for vscode
   alias cb='code ~/.bash_profile'
   alias sb='source ~/.bash_profile'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
   ### open bashrc and source it
   alias nb='nano ~/.bashrc'
   # for vscode
   alias cb='code ~/.bashrc'
   alias sb='source ~/.bashrc'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
   ### open bashrc and source it
   alias nb='nano ~/.bashrc'
   # for vscode
   alias cb='code ~/.bashrc'
   alias sb='source ~/.bashrc'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
   ### open bashrc and source it
   alias nb='nano ~/.bashrc'
   # for vscode
   alias cb='code ~/.bashrc'
   alias sb='source ~/.bashrc'
fi

### check is there any symlink
# https://askubuntu.com/questions/522051/how-to-list-all-symbolic-links-in-a-directory
alias check-symlink='find . -type l -ls'

### find how many directory in the current directory
alias cdq='find . -mindepth 1 -maxdepth 1 -type d | wc -l'

source datagen_venv/bin/activate

# venv commands
alias d='deactivate'
alias a='source datagen_venv/bin/activate'

##### SOME KAFKA ALIASES ######
# https://gist.github.com/PardhuMadipalli/65c888243a192421f5a47e9c8ab14a38

export KAFKA_HOME=/kafka
# Start Kafka server
alias startKafka='$KAFKA_HOME/bin/kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties'
# List of topics with zookeeper of localhost
alias topics='$KAFKA_HOME/bin/kafka-topics.sh --list --bootstrap-server localhost:9092'
# Create a new consumer that reads from the starting from the topic. It uses localhost kafka broker.
# Example: readtopic topicName
readtopic () 
{
    $KAFKA_HOME/bin/kafka-console-consumer.sh --topic $1 --from-beginning --bootstrap-server localhost:9092
}
# use this to delete a topic
# Example: deletetopic topicName
deletetopic()
{
    $KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic $1
}
# Create a new cosnumer that reads from the current record of the topic. It uses localhost kafka broker.
# Example: readtopic topicName
readtopicnow(){
        $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1
}



