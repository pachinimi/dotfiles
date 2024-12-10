{ ... }:

{

  networking = {
    firewall.enable = true;
    hostName = "gaia";
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

networking.firewall.extraCommands = ''
  # Set up SNAT on packets going from downstream to the wider internet
  iptables -t nat -A POSTROUTING -o wlp2s0 -j MASQUERADE

  # Accept all connections from downstream. May not be necessary
  iptables -A INPUT -i enp1s0 -j ACCEPT
'';

}
