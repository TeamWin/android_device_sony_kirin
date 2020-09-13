#!/sbin/sh

if ! timeout 10s sh -c 'until getprop vendor.sys.listeners.registered | grep -q ^true$; do sleep 0.1; done'; then
    setprop vendor.sys.listeners.registered true
fi
