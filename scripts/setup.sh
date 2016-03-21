# !/bin/bash
# author: dlatt
# Setup Script Kidmooc

INPUT_ARGS=$(getopt -n "$0" -o ha:p:u:l:k:s --long "help, HOST:, PORT:, USER, LOGFILE, KIDMOOC_ROOT, SERVER" -- "$@")

PORT=8081
HOST="0.0.0.0"
USER="student"
LOGFILE="kidmooc.log"
KIDMOOC_ROOT="/home/$USER/kidmooc/"
SERVER=false

eval set -- "$INPUT_ARGS"

while true ; do
  case $1 in
    -h|--help)
    cat << EOF

    Installation Script - kidmooc
    -------------------------------------------------------------------------------------
    # effect of default values:
    # HOST: 0.0.0.0
    # PORT: 8081
    # USER: student
    # LOGFILE: kidmooc.log

    USAGE:
    ----------------------------
    $0 [ -h | --help ] or
    $0 [ -a | --HOST ] value=[HOSTADDRESS]
    $0 [ -p | --PORT ] value=[PORTNUMBER]
    $0 [ -u | --USER value=[USERNAME]
    $0 [ -l | --LOGFILE ] value=[FILENAME].log
    -------------------------------------------------------------------------------------
    The ARG values may be specified like '--ARG "value"', '--ARG="value"', or '-x value'

EOF
  exit 0;;
    -a|--HOST)
    if [ -n "$2" ]; then
        HOST=$2
    fi
    shift 2;;
    --)
    shift
    break;;

    -p|--PORT)
    if [ -n "$2" ]; then
        PORT=$2
    fi
    shift 2;;
    --)
    shift
    break;;

    -u|--USER)
    if [ -n "$2" ]; then
        USER=$2
    fi
    shift 2;;
    --)
    shift
    break;;

   -l|--LOGFILE)
    if [ -n "$2" ]; then
        LOGFILE=$2.log
    fi
    shift 2;;
    --)
    shift
    break;;

    -k|--KIDMOOC_ROOT)
    if [ -n "$2" ]; then
       KIDMOOC_ROOT=$2
    fi
    shift 2;;
    --)
    shift
    break;;

    -s|--SERVER)
       SERVER=true
    shift 1;;
    --)
    shift
    break;;
  esac
done

if [ "$SERVER" = true ]; then
  cd $KIDMOOC_ROOT
  git reset --hard
  output=$(git pull 2>&1)
  if [ "$output" = "Already up-to-date." ]; then
    exit 1
  fi
  echo 'Killing existing PID of rails server'
  kill -INT $(cat tmp/pids/server.pid);

  echo 'pulling new master of kidmooc..'
fi

echo 'installing npm dependencies..'
npm install

echo 'installing new gems..'
bundler

echo 'distilling resources..'
node_modules/gulp/bin/gulp.js build

echo 'recreating db tables..'
rake db:reset
echo 'launching new server instance..'
nohup rails s -p $PORT -b $HOST > $LOGFILE 2>&1 &
