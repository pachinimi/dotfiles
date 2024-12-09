{ ... }:

{

  networking = {

    hostName = "navi";
    firewall.enable = true;
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
    networkmanager = {
      enable = true;
      dns = "none";
    };
  };

  services.dnscrypt-proxy2 = {
    enable = true;
    upstreamDefaults = true;
    settings = {
      server_names = [
        "cloudflare-security"
        "cloudflare-security-ipv6"
      ];
    };
  };

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };

}
