## Proxy relevant

# Change proxy setting for current shell env (you may have to change the url to make it works in your env)
alias proxy='export http_proxy=http://127.0.0.1:1081;export https_proxy=http://127.0.0.1:1081;'
alias unproxy='unset all_proxy;unset http_proxy; unset https_proxy'

# Change proxy setting in System Preferences
global_proxy() {
    if [ -n "$1" ]
    then
        networksetup -setwebproxystate "$1" on;networksetup -setsecurewebproxystate "$1" on; networksetup -setsocksfirewallproxystate "$1" on;
        networksetup -setautoproxystate "$1" off;
    else
        # sure, you can add more ala you need
        global_proxy 'USB 10/100/1000 LAN';
        global_proxy 'Wi-fi';
    fi
}
global_unproxy() {
    if [ -n "$1" ]
    then
        networksetup -setwebproxystate "$1" off;networksetup -setsecurewebproxystate "$1" off; networksetup -setsocksfirewallproxystate "$1" off;
        networksetup -setautoproxyurl "$1" http://127.0.0.1:8070/proxy.pac; # modify this url wrt to your need
    else
        global_unproxy "USB 10/100/1000 LAN"
        global_unproxy "Wi-fi"
    fi
}
