{ ... }: {
  programs.bash.enable = true;
  programs.bash.bashrcExtra = ''
    HTTP_PROXY_VAL=''${MY_HTTP_PROXY:-"http://httpproxy-headless.kubebrain.svc.pjlab.local:3128"}
    HTTPS_PROXY_VAL=''${MY_HTTPS_PROXY:-"http://httpproxy-headless.kubebrain.svc.pjlab.local:3128"}
    NO_PROXY_VAL=''${MY_NO_PROXY:-"127.0.0.1,10.0.0.0/8,100.96.0.0/12,.pjlab.org.cn,.pjh-service.org.cn,35.220.164.252"}
    proxy_on() {
        export http_proxy=$HTTP_PROXY_VAL
        export https_proxy=$HTTPS_PROXY_VAL
        export no_proxy=$NO_PROXY_VAL
        export HTTP_PROXY=$HTTP_PROXY_VAL
        export HTTPS_PROXY=$HTTPS_PROXY_VAL
        export NO_PROXY=$NO_PROXY_VAL
    }
    proxy_off() {
        unset http_proxy https_proxy no_proxy
        unset HTTP_PROXY HTTPS_PROXY NO_PROXY
    }
    proxy_on
  '';
}
