#!/usr/bin/env bash
port8000=true
port4430=true
exec 6<>/dev/tcp/127.0.0.1/8000 || port8000=false
exec 6>&- # close output connection
exec 6<&- # close input connection
exec 6<>/dev/tcp/127.0.0.1/4430 || port4430=false
exec 6>&- # close output connection
exec 6<&- # close input connection
if [ "$port8000" = false ]; then
    if [ "$port4430" = false ]; then
        bash ./.utils/start-proxy.sh
    else
        bash ./.utils/message.sh info "Port 4430 is currently occupied"
        bash ./.utils/message.sh info "Assuming proxy is already running"
    fi
else
    bash ./.utils/message.sh info "Port 8000 is currently occupied"
    bash ./.utils/message.sh info "Assuming proxy is already running"
fi