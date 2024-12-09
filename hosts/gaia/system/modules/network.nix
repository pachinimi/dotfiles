{ ... }:

{

  networking = {

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

networking.firewall.enable = false;
networking.nftables.enable = true;
networking.nftables.ruleset = ''
   table inet firewall {
       chain incoming {
         type filter hook input priority 0; policy drop;
         
         ct state vmap { established : accept, related : accept, invalid : drop }
         
         # Allow SSH
         tcp dport 22 ct state new tcp flags & (syn | ack) == syn counter accept
       }
       
       chain forward {
         type filter hook forward priority 0; policy accept;
       }
   }
       
   table ip router {
        chain postrouting {
          type nat hook postrouting priority srcnat; policy accept;
          oifname "enp1s0" counter masquerade
        }
   }
'';

}
