{ ... }:

{

  networking = {

    hostName = "gaia";
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

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "pachi" ];
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  services.fail2ban.enable = true;

}
