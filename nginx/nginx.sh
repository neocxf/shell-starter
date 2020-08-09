#!/bin/sh
#
# nginx - this script starts and stops the nginx daemon
#
# chkconfig:   - 85 15
# description:  Nginx is an HTTP(S) server, HTTP(S) reverse \
#               proxy and IMAP/POP3 proxy server
# processname: nginx
# config:      $WORKDIR/nginx.conf
# pidfile:     $WORKDIR/logs/nginx.pid


nginx=$(which nginx)
prog=$(basename "$nginx")

sysconfig="/etc/sysconfig/$prog"
lockfile="/var/lock/subsys/nginx"
pidfile="/var/run/${prog}.pid"


# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
LUA_BASEDIR=$(dirname "$(readlink -n "$0")")
NGINX_CONF_FILE="${LUA_BASEDIR}/nginx.conf"

export LUA_BASEDIR

if [ -z "$resty_work_dir" ]; then
    WORKDIR=`pwd`

else
    WORKDIR=$resty_work_dir
    mkdir -p $WORKDIR
fi


[ -d $WORKDIR/logs/ ] || mkdir $WORKDIR/logs/
[ -d $WORKDIR/tmp/ ] || mkdir $WORKDIR/tmp/


start() {
    $nginx -p $WORKDIR -c $NGINX_CONF_FILE
}

stop() {
    $nginx -p $WORKDIR -s stop -c $NGINX_CONF_FILE
}

restart() {
    configtest_q || return 6
    stop
    start
}

reload() {
    configtest_q || return 6
    $nginx -p $WORKDIR -s reload -c $NGINX_CONF_FILE|| exit 7
}

configtest() {
    $nginx -t -c $NGINX_CONF_FILE
}

configtest_q() {
    $nginx -p $WORKDIR -t -q -c $NGINX_CONF_FILE
}

rh_status() {
    local port=`ps -ef | grep $prog | grep 'master process' | awk '{ print $2; }'`

    if [ -z $port ]; then
        echo "$prog stopped"
    else
        echo "$prog is running at [$port]"

        # uncomment to start nginx if stopped
        # systemctl start nginx
        # mail
    fi
}

rh_status_q() {
    rh_status >/dev/null 2>&1
}

logs() {
    tail -fn100 $WORKDIR/logs/error.log
}

reopen_logs() {
    rm -rf $WORKDIR/logs/error.log
    restart
    logs
}


case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    reopen_logs)
        reopen_logs
        ;;
    restart|configtest)
        stop
        start
        ;;
    test)
        nginx -p $WORKDIR -c $NGINX_CONF_FILE -t || exit 7
        ;;
    reload)
        reload
        ;;
    logs)
        logs
        ;;
    status|status_q)
        rh_$1
        ;;
    condrestart|try-restart)
        rh_status_q || exit 7
        restart
        ;;
    *)
        echo $"Usage: $0 {start|stop|reload|configtest|status|test|restart|reopen_logs}"
        exit 2
esac
