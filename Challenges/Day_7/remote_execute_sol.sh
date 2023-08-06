if [ $# -ne 1 ]; then
    echo "Usage: ./remote_execute_sol.sh commands.sh"
    echo "Store all the commands to be executed in servers in commands.sh"
    exit 1
fi

commands=$1
parallel-ssh -h hosts.txt -P -I<./$1