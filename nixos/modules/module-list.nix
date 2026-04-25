let
  # p2-h12 prototype: write-triggered lazy module loading.
  # Modules listed here are NOT eagerly merged into the option tree;
  # lib/modules.nix tolerates definitions under these prefixes without
  # a matching declaration (instead of the usual checkUnmatched error).
  # The end-state replaces this hand-written map with a readDir over
  # nixos/modules/by-prefix/ — see backlog/p2-h12.
  byPrefix = {
    "boot.plymouth"                                = ./system/boot/plymouth.nix;
    "boot.plymouth.tpm2-totp"                      = ./system/boot/plymouth-tpm2-totp.nix;
    "documentation.man.man-db"                     = ./misc/man-db.nix;
    "documentation.man.mandoc"                     = ./misc/mandoc.nix;
    "hardware.acpilight"                          = ./hardware/acpilight.nix;
    "hardware.apple"                              = ./hardware/apple-touchbar.nix;
    "hardware.bladeRF"                            = ./hardware/bladeRF.nix;
    "hardware.block"                              = ./hardware/iosched.nix;
    "hardware.brillo"                             = ./hardware/brillo.nix;
    "hardware.bumblebee"                          = ./hardware/video/bumblebee.nix;
    "hardware.ckb-next"                           = ./hardware/ckb-next.nix;
    "hardware.coral"                              = ./hardware/coral.nix;
    "hardware.cpu.x86"                             = ./hardware/cpu/x86-msr.nix;
    "hardware.decklink"                           = ./hardware/decklink.nix;
    "hardware.digitalbitbox"                      = ./hardware/digitalbitbox.nix;
    "hardware.facetimehd"                         = ./hardware/video/webcam/facetimehd.nix;
    "hardware.facter"                             = ./hardware/facter;
    "hardware.flipperzero"                        = ./hardware/flipperzero.nix;
    "hardware.flirc"                              = ./hardware/flirc.nix;
    "hardware.fw-fanctrl"                         = ./hardware/fw-fanctrl.nix;
    "hardware.glasgow"                            = ./hardware/glasgow.nix;
    "hardware.gpgSmartcards"                      = ./hardware/gpgsmartcards.nix;
    "hardware.hackrf"                             = ./hardware/hackrf.nix;
    "hardware.hid-fanatecff"                      = ./hardware/hid-fanatecff.nix;
    "hardware.infiniband"                         = ./hardware/infiniband.nix;
    "hardware.inputmodule"                        = ./hardware/inputmodule.nix;
    "hardware.intel-gpu-tools"                    = ./hardware/video/intel-gpu-tools.nix;
    "hardware.ipu6"                               = ./hardware/video/webcam/ipu6.nix;
    "hardware.keyboard.qmk"                        = ./hardware/keyboard/qmk.nix;
    "hardware.keyboard.teck"                       = ./hardware/keyboard/teck.nix;
    "hardware.keyboard.uhk"                        = ./hardware/keyboard/uhk.nix;
    "hardware.keyboard.zsa"                        = ./hardware/keyboard/zsa.nix;
    "hardware.kryoflux"                           = ./hardware/kryoflux.nix;
    "hardware.ksm"                                = ./hardware/ksm.nix;
    "hardware.ledger"                             = ./hardware/ledger.nix;
    "hardware.libftdi"                            = ./hardware/libftdi.nix;
    "hardware.libjaylink"                         = ./hardware/libjaylink.nix;
    "hardware.logitech"                           = ./hardware/logitech.nix;
    "hardware.mcelog"                             = ./hardware/mcelog.nix;
    "hardware.mwProCapture"                       = ./hardware/video/capture/mwprocapture.nix;
    "hardware.new-lg4ff"                          = ./hardware/new-lg4ff.nix;
    "hardware.nfc-nci"                            = ./hardware/nfc-nci.nix;
    "hardware.nitrokey"                           = ./hardware/nitrokey.nix;
    "hardware.onlykey"                            = ./hardware/onlykey/default.nix;
    "hardware.openrazer"                          = ./hardware/openrazer.nix;
    "hardware.opentabletdriver"                   = ./hardware/opentabletdriver.nix;
    "hardware.parallels"                          = ./virtualisation/parallels-guest.nix;
    "hardware.pcmcia"                             = ./hardware/pcmcia.nix;
    "hardware.raid"                               = ./hardware/raid/hpsa.nix;
    "hardware.saleae-logic"                       = ./hardware/saleae-logic.nix;
    "hardware.sane"                                = ./services/hardware/sane.nix;
    "hardware.sane.brscan4"                        = ./services/hardware/sane_extra_backends/brscan4.nix;
    "hardware.sane.brscan5"                        = ./services/hardware/sane_extra_backends/brscan5.nix;
    "hardware.sane.dsseries"                       = ./services/hardware/sane_extra_backends/dsseries.nix;
    "hardware.sata"                               = ./hardware/sata.nix;
    "hardware.sensor.hddtemp"                      = ./hardware/sensor/hddtemp.nix;
    "hardware.sensor.iio"                          = ./hardware/sensor/iio.nix;
    "hardware.sheep_net"                          = ./hardware/sheep-net.nix;
    "hardware.steam-hardware"                     = ./hardware/steam-hardware.nix;
    "hardware.system76"                           = ./hardware/system-76.nix;
    "hardware.tenstorrent"                        = ./hardware/tenstorrent.nix;
    "hardware.ubertooth"                          = ./hardware/ubertooth.nix;
    "hardware.uinput"                             = ./hardware/uinput.nix;
    "hardware.uni-sync"                           = ./hardware/uni-sync.nix;
    "hardware.usb-modeswitch"                     = ./hardware/usb-modeswitch.nix;
    "hardware.usbStorage"                         = ./hardware/usb-storage.nix;
    "hardware.wooting"                            = ./hardware/wooting.nix;
    "hardware.xone"                               = ./hardware/xone.nix;
    "hardware.xpad-noone"                         = ./hardware/xpad-noone.nix;
    "hardware.xpadneo"                            = ./hardware/xpadneo.nix;
    "i18n.inputMethod.fcitx5"                      = ./i18n/input-method/fcitx5.nix;
    "i18n.inputMethod.ibus"                        = ./i18n/input-method/ibus.nix;
    "i18n.inputMethod.kime"                        = ./i18n/input-method/kime.nix;
    "i18n.inputMethod.uim"                         = ./i18n/input-method/uim.nix;
    "networking.wireless.athUserRegulatoryDomain"  = ./hardware/network/ath-user-regd.nix;
    "networking.wireless.iwd"                      = ./services/networking/iwd.nix;
    "programs._1password"                        = ./programs/_1password.nix;
    "programs._1password-gui"                    = ./programs/_1password-gui.nix;
    "programs.alvr"                              = ./programs/alvr.nix;
    "programs.amnezia-vpn"                       = ./programs/amnezia-vpn.nix;
    "programs.appgate-sdp"                       = ./programs/appgate-sdp.nix;
    "programs.appimage"                          = ./programs/appimage.nix;
    "programs.arp-scan"                          = ./programs/arp-scan.nix;
    "programs.atop"                              = ./programs/atop.nix;
    "programs.atuin"                             = ./programs/atuin.nix;
    "programs.ausweisapp"                        = ./programs/ausweisapp.nix;
    "programs.autoenv"                           = ./programs/autoenv.nix;
    "programs.autojump"                          = ./programs/autojump.nix;
    "programs.bandwhich"                         = ./programs/bandwhich.nix;
    "programs.bash-my-aws"                       = ./programs/bash-my-aws.nix;
    "programs.bat"                               = ./programs/bat.nix;
    "programs.bazecor"                           = ./programs/bazecor.nix;
    "programs.bcc"                               = ./programs/bcc.nix;
    "programs.browserpass"                       = ./programs/browserpass.nix;
    "programs.calls"                             = ./programs/calls.nix;
    "programs.captive-browser"                   = ./programs/captive-browser.nix;
    "programs.cdemu"                             = ./programs/cdemu.nix;
    "programs.cfs-zen-tweaks"                    = ./programs/cfs-zen-tweaks.nix;
    "programs.chromium"                          = ./programs/chromium.nix;
    "programs.chrysalis"                         = ./programs/chrysalis.nix;
    "programs.cnping"                            = ./programs/cnping.nix;
    "programs.coolercontrol"                     = ./programs/coolercontrol.nix;
    "programs.corefreq"                          = ./programs/corefreq.nix;
    "programs.criu"                              = ./programs/criu.nix;
    "programs.dconf"                             = ./programs/dconf.nix;
    "programs.digitalbitbox"                     = ./programs/digitalbitbox/default.nix;
    "programs.direnv"                            = ./programs/direnv.nix;
    "programs.dmrconfig"                         = ./programs/dmrconfig.nix;
    "programs.droidcam"                          = ./programs/droidcam.nix;
    "programs.dublin-traceroute"                 = ./programs/dublin-traceroute.nix;
    "programs.dwl"                               = ./programs/wayland/dwl.nix;
    "programs.ente-auth"                         = ./programs/ente-auth.nix;
    "programs.extra-container"                   = ./programs/extra-container.nix;
    "programs.fcast-receiver"                    = ./programs/fcast-receiver.nix;
    "programs.firefox"                           = ./programs/firefox.nix;
    "programs.firejail"                          = ./programs/firejail.nix;
    "programs.fish"                              = ./programs/fish.nix;
    "programs.flashprog"                         = ./programs/flashprog.nix;
    "programs.flashrom"                          = ./programs/flashrom.nix;
    "programs.flexoptix-app"                     = ./programs/flexoptix-app.nix;
    "programs.fzf"                               = ./programs/fzf.nix;
    "programs.gamescope"                         = ./programs/gamescope.nix;
    "programs.geary"                             = ./programs/geary.nix;
    "programs.git-worktree-switcher"             = ./programs/git-worktree-switcher.nix;
    "programs.gpaste"                            = ./programs/gpaste.nix;
    "programs.gphoto2"                           = ./programs/gphoto2.nix;
    "programs.gpu-screen-recorder"               = ./programs/gpu-screen-recorder.nix;
    "programs.haguichi"                          = ./programs/haguichi.nix;
    "programs.hamster"                           = ./programs/hamster.nix;
    "programs.htop"                              = ./programs/htop.nix;
    "programs.hyprlock"                          = ./programs/wayland/hyprlock.nix;
    "programs.iay"                               = ./programs/iay.nix;
    "programs.idescriptor"                       = ./programs/idescriptor.nix;
    "programs.iftop"                             = ./programs/iftop.nix;
    "programs.iio-hyprland"                      = ./programs/iio-hyprland.nix;
    "programs.immersed"                          = ./programs/immersed.nix;
    "programs.iotop"                             = ./programs/iotop.nix;
    "programs.joycond-cemuhook"                  = ./programs/joycond-cemuhook.nix;
    "programs.k3b"                               = ./programs/k3b.nix;
    "programs.k40-whisperer"                     = ./programs/k40-whisperer.nix;
    "programs.kbdlight"                          = ./programs/kbdlight.nix;
    "programs.kclock"                            = ./programs/kclock.nix;
    "programs.ladybird"                          = ./programs/ladybird.nix;
    "programs.lazygit"                           = ./programs/lazygit.nix;
    "programs.liboping"                          = ./programs/liboping.nix;
    "programs.librepods"                         = ./programs/librepods.nix;
    "programs.mangowc"                           = ./programs/wayland/mangowc.nix;
    "programs.mdevctl"                           = ./programs/mdevctl.nix;
    "programs.mepo"                              = ./programs/mepo.nix;
    "programs.mininet"                           = ./programs/mininet.nix;
    "programs.minipro"                           = ./programs/minipro.nix;
    "programs.miriway"                           = ./programs/miriway.nix;
    "programs.mouse-actions"                     = ./programs/mouse-actions.nix;
    "programs.nautilus-open-any-terminal"        = ./programs/nautilus-open-any-terminal.nix;
    "programs.nbd"                               = ./programs/nbd.nix;
    "programs.neovim"                            = ./programs/neovim.nix;
    "programs.nethoscope"                        = ./programs/nethoscope.nix;
    "programs.nexttrace"                         = ./programs/nexttrace.nix;
    "programs.nix-ld"                            = ./programs/nix-ld.nix;
    "programs.nix-required-mounts"               = ./programs/nix-required-mounts.nix;
    "programs.nixbit"                            = ./programs/nixbit.nix;
    "programs.nncp"                              = ./programs/nncp.nix;
    "programs.noisetorch"                        = ./programs/noisetorch.nix;
    "programs.npm"                               = ./programs/npm.nix;
    "programs.ns-usbloader"                      = ./programs/ns-usbloader.nix;
    "programs.obs-studio"                        = ./programs/obs-studio.nix;
    "programs.oddjobd"                           = ./programs/oddjobd.nix;
    "programs.opengamepadui"                     = ./programs/opengamepadui.nix;
    "programs.openvpn3"                          = ./programs/openvpn3.nix;
    "programs.pay-respects"                      = ./programs/pay-respects.nix;
    "programs.plotinus"                          = ./programs/plotinus.nix;
    "programs.pmount"                            = ./programs/pmount.nix;
    "programs.pqos-wrapper"                      = ./programs/pqos-wrapper.nix;
    "programs.projecteur"                        = ./programs/projecteur.nix;
    "programs.proxychains"                       = ./programs/proxychains.nix;
    "programs.pulseview"                         = ./programs/pulseview.nix;
    "programs.qdmr"                              = ./programs/qdmr.nix;
    "programs.quark-goldleaf"                    = ./programs/quark-goldleaf.nix;
    "programs.regreet"                           = ./programs/regreet.nix;
    "programs.river-classic"                     = ./programs/wayland/river.nix;
    "programs.rog-control-center"                = ./programs/rog-control-center.nix;
    "programs.rush"                              = ./programs/rush.nix;
    "programs.rust-motd"                         = ./programs/rust-motd.nix;
    "programs.ryzen-monitor-ng"                  = ./programs/ryzen-monitor-ng.nix;
    "programs.schroot"                           = ./programs/schroot.nix;
    "programs.sedutil"                           = ./programs/sedutil.nix;
    "programs.skim"                              = ./programs/skim.nix;
    "programs.slock"                             = ./programs/slock.nix;
    "programs.sniffnet"                          = ./programs/sniffnet.nix;
    "programs.soundmodem"                        = ./programs/soundmodem.nix;
    "programs.starship"                          = ./programs/starship.nix;
    "programs.steam"                             = ./programs/steam.nix;
    "programs.streamcontroller"                  = ./programs/streamcontroller.nix;
    "programs.sway"                              = ./programs/wayland/sway.nix;
    "programs.sysdig"                            = ./programs/sysdig.nix;
    "programs.systemtap"                         = ./programs/systemtap.nix;
    "programs.tcpdump"                           = ./programs/tcpdump.nix;
    "programs.television"                        = ./programs/television.nix;
    "programs.throne"                            = ./programs/throne.nix;
    "programs.thunderbird"                       = ./programs/thunderbird.nix;
    "programs.tmux"                              = ./programs/tmux.nix;
    "programs.traceroute"                        = ./programs/traceroute.nix;
    "programs.trippy"                            = ./programs/trippy.nix;
    "programs.tsmClient"                         = ./programs/tsm-client.nix;
    "programs.turbovnc"                          = ./programs/turbovnc.nix;
    "programs.udevil"                            = ./programs/udevil.nix;
    "programs.usbtop"                            = ./programs/usbtop.nix;
    "programs.uwsm"                              = ./programs/wayland/uwsm.nix;
    "programs.vim"                               = ./programs/vim.nix;
    "programs.virt-manager"                      = ./programs/virt-manager.nix;
    "programs.vivid"                             = ./programs/vivid.nix;
    "programs.vscode"                            = ./programs/vscode.nix;
    "programs.wavemon"                           = ./programs/wavemon.nix;
    "programs.wayland"                           = ./programs/wayland/miracle-wm.nix;
    "programs.wayvnc"                            = ./programs/wayland/wayvnc.nix;
    "programs.weylus"                            = ./programs/weylus.nix;
    "programs.whois"                             = ./programs/whois.nix;
    "programs.winbox"                            = ./programs/winbox.nix;
    "programs.wireshark"                         = ./programs/wireshark.nix;
    "programs.wshowkeys"                         = ./programs/wshowkeys.nix;
    "programs.xastir"                            = ./programs/xastir.nix;
    "programs.xfs_quota"                         = ./programs/xfs_quota.nix;
    "programs.xonsh"                             = ./programs/xonsh.nix;
    "programs.xppen"                             = ./programs/xppen.nix;
    "programs.xscreensaver"                        = ./programs/xscreensaver/xscreensaver.nix;
    "programs.xscreensaver.sonar"                  = ./programs/xscreensaver/sonar.nix;
    "programs.xss-lock"                          = ./programs/xss-lock.nix;
    "programs.yazi"                              = ./programs/yazi.nix;
    "programs.yubikey-manager"                   = ./programs/yubikey-manager.nix;
    "programs.zmap"                              = ./programs/zmap.nix;
    "programs.zoom-us"                           = ./programs/zoom-us.nix;
    "programs.zsh"                                 = ./programs/zsh/zsh.nix;
    "programs.zsh.autosuggestions"                 = ./programs/zsh/zsh-autosuggestions.nix;
    "programs.zsh.ohMyZsh"                         = ./programs/zsh/oh-my-zsh.nix;
    "programs.zsh.syntaxHighlighting"              = ./programs/zsh/zsh-syntax-highlighting.nix;
    "programs.zsh.zsh-autoenv"                     = ./programs/zsh/zsh-autoenv.nix;
    "services._3proxy"                           = ./services/networking/3proxy.nix;
    "services.a2boot"                            = ./services/network-filesystems/a2boot.nix;
    "services.acme-dns"                          = ./services/networking/acme-dns.nix;
    "services.acpid"                             = ./services/hardware/acpid.nix;
    "services.activemq"                          = ./services/amqp/activemq/default.nix;
    "services.actual"                            = ./services/web-apps/actual.nix;
    "services.adguardhome"                       = ./services/networking/adguardhome.nix;
    "services.aerospike"                         = ./services/databases/aerospike.nix;
    "services.aesmd"                             = ./services/security/aesmd.nix;
    "services.agate"                             = ./services/web-servers/agate.nix;
    "services.agorakit"                          = ./services/web-apps/agorakit.nix;
    "services.airsonic"                          = ./services/misc/airsonic.nix;
    "services.akkoma"                            = ./services/web-apps/akkoma.nix;
    "services.alerta"                            = ./services/monitoring/alerta.nix;
    "services.alice-lg"                          = ./services/networking/alice-lg.nix;
    "services.alps"                              = ./services/web-apps/alps.nix;
    "services.amazon-cloudwatch-agent"           = ./services/monitoring/amazon-cloudwatch-agent.nix;
    "services.amule"                             = ./services/networking/amuled.nix;
    "services.ananicy"                           = ./services/misc/ananicy.nix;
    "services.angrr"                             = ./services/misc/angrr.nix;
    "services.anki-sync-server"                  = ./services/misc/anki-sync-server.nix;
    "services.anubis"                            = ./services/networking/anubis.nix;
    "services.anuko-time-tracker"                = ./services/web-apps/anuko-time-tracker.nix;
    "services.apcupsd"                           = ./services/monitoring/apcupsd.nix;
    "services.arbtt"                             = ./services/monitoring/arbtt.nix;
    "services.archisteamfarm"                    = ./services/games/archisteamfarm.nix;
    "services.aria2"                             = ./services/networking/aria2.nix;
    "services.armagetronad"                      = ./services/games/armagetronad.nix;
    "services.arsenik"                           = ./services/hardware/arsenik.nix;
    "services.asterisk"                          = ./services/networking/asterisk.nix;
    "services.asusd"                             = ./services/hardware/asusd.nix;
    "services.atd"                               = ./services/scheduling/atd.nix;
    "services.atftpd"                            = ./services/networking/atftpd.nix;
    "services.athens"                            = ./services/development/athens.nix;
    "services.atticd"                            = ./services/networking/atticd.nix;
    "services.atuin"                             = ./services/misc/atuin.nix;
    "services.audiobookshelf"                    = ./services/web-apps/audiobookshelf.nix;
    "services.authelia"                          = ./services/security/authelia.nix;
    "services.auto-cpufreq"                      = ./services/hardware/auto-cpufreq.nix;
    "services.auto-epp"                          = ./services/hardware/auto-epp.nix;
    "services.autobrr"                           = ./services/misc/autobrr.nix;
    "services.autofs"                            = ./services/misc/autofs.nix;
    "services.automatic-timezoned"               = ./services/system/automatic-timezoned.nix;
    "services.automx2"                           = ./services/mail/automx2.nix;
    "services.automysqlbackup"                   = ./services/backup/automysqlbackup.nix;
    "services.autorandr"                         = ./services/misc/autorandr.nix;
    "services.autossh"                           = ./services/networking/autossh.nix;
    "services.autossh-ng"                        = ./services/networking/autossh-ng.nix;
    "services.autosuspend"                       = ./services/misc/autosuspend.nix;
    "services.autotierfs"                        = ./services/autotierfs.nix;
    "services.awstats"                           = ./services/logging/awstats.nix;
    "services.ax25.axlisten"                       = ./services/networking/ax25/axlisten.nix;
    "services.ax25.axports"                        = ./services/networking/ax25/axports.nix;
    "services.ayatana-indicators"                = ./services/desktops/ayatana-indicators.nix;
    "services.babeld"                            = ./services/networking/babeld.nix;
    "services.bacula-fd"                         = ./services/backup/bacula.nix;
    "services.baikal"                            = ./services/web-apps/baikal.nix;
    "services.bamf"                              = ./services/desktops/bamf.nix;
    "services.bazarr"                            = ./services/misc/bazarr.nix;
    "services.bcg"                               = ./services/misc/bcg.nix;
    "services.beanstalkd"                        = ./services/misc/beanstalkd.nix;
    "services.bee"                               = ./services/networking/bee.nix;
    "services.beesd"                             = ./services/misc/bees.nix;
    "services.below"                             = ./services/monitoring/below.nix;
    "services.bentopdf"                          = ./services/web-apps/bentopdf.nix;
    "services.bepasty"                           = ./services/misc/bepasty.nix;
    "services.beszel.agent"                        = ./services/monitoring/beszel-agent.nix;
    "services.beszel.hub"                          = ./services/monitoring/beszel-hub.nix;
    "services.biboumi"                           = ./services/networking/biboumi.nix;
    "services.bind"                              = ./services/networking/bind.nix;
    "services.bird"                              = ./services/networking/bird.nix;
    "services.bird-lg"                           = ./services/networking/bird-lg.nix;
    "services.bitbox-bridge"                     = ./services/hardware/bitbox-bridge.nix;
    "services.bitcoind"                          = ./services/networking/bitcoind.nix;
    "services.bitlbee"                           = ./services/networking/bitlbee.nix;
    "services.bitmagnet"                         = ./services/torrent/bitmagnet.nix;
    "services.bitwarden-directory-connector-cli" = ./services/security/bitwarden-directory-connector-cli.nix;
    "services.blackfire-agent"                   = ./services/development/blackfire.nix;
    "services.blendfarm"                         = ./services/misc/blenderfarm.nix;
    "services.blockbook-frontend"                = ./services/networking/blockbook-frontend.nix;
    "services.bloop"                             = ./services/development/bloop.nix;
    "services.bluemap"                           = ./services/web-apps/bluemap.nix;
    "services.bluesky-pds"                       = ./services/web-apps/bluesky-pds.nix;
    "services.boinc"                             = ./services/computing/boinc/client.nix;
    "services.bonsaid"                           = ./services/desktops/bonsaid.nix;
    "services.bookstack"                         = ./services/web-apps/bookstack.nix;
    "services.borgbackup"                        = ./services/backup/borgbackup.nix;
    "services.borgmatic"                         = ./services/backup/borgmatic.nix;
    "services.bosun"                             = ./services/monitoring/bosun.nix;
    "services.botamusique"                       = ./services/audio/botamusique.nix;
    "services.bpftune"                           = ./services/system/bpftune.nix;
    "services.brltty"                            = ./services/hardware/brltty.nix;
    "services.broadcast-box"                     = ./services/video/broadcast-box.nix;
    "services.btrbk"                             = ./services/backup/btrbk.nix;
    "services.buffyboard"                        = ./services/hardware/buffyboard.nix;
    "services.buildbot-master"                   = ./services/continuous-integration/buildbot/master.nix;
    "services.buildbot-worker"                   = ./services/continuous-integration/buildbot/worker.nix;
    "services.buildkite-agents"                  = ./services/continuous-integration/buildkite-agents.nix;
    "services.byedpi"                            = ./services/networking/byedpi.nix;
    "services.c2fmzq-server"                     = ./services/web-apps/c2fmzq-server.nix;
    "services.cachefilesd"                       = ./services/network-filesystems/cachefilesd.nix;
    "services.cachix-watch-store"                = ./services/system/cachix-watch-store.nix;
    "services.caddy"                             = ./services/web-servers/caddy/default.nix;
    "services.cage"                              = ./services/wayland/cage.nix;
    "services.calibre-server"                    = ./services/misc/calibre-server.nix;
    "services.calibre-web"                       = ./services/web-apps/calibre-web.nix;
    "services.canaille"                          = ./services/security/canaille.nix;
    "services.canto-daemon"                      = ./services/misc/canto-daemon.nix;
    "services.cassandra"                         = ./services/databases/cassandra.nix;
    "services.castopod"                          = ./services/web-apps/castopod.nix;
    "services.cato-client"                       = ./services/networking/cato-client.nix;
    "services.centrifugo"                        = ./services/networking/centrifugo.nix;
    "services.certmgr"                           = ./services/security/certmgr.nix;
    "services.certspotter"                       = ./services/monitoring/certspotter.nix;
    "services.cfdyndns"                          = ./services/misc/cfdyndns.nix;
    "services.cgminer"                           = ./services/misc/cgminer.nix;
    "services.changedetection-io"                = ./services/web-apps/changedetection-io.nix;
    "services.chhoto-url"                        = ./services/web-apps/chhoto-url.nix;
    "services.chisel-server"                     = ./services/networking/chisel-server.nix;
    "services.chromadb"                          = ./services/databases/chromadb.nix;
    "services.chrony"                            = ./services/networking/ntp/chrony.nix;
    "services.cjdns"                             = ./services/networking/cjdns.nix;
    "services.clamav"                            = ./services/security/clamav.nix;
    "services.clickhouse"                        = ./services/databases/clickhouse.nix;
    "services.clight"                            = ./services/x11/clight.nix;
    "services.clipcat"                           = ./services/misc/clipcat.nix;
    "services.clipmenu"                          = ./services/misc/clipmenu.nix;
    "services.cloudflare-ddns"                   = ./services/networking/cloudflare-ddns.nix;
    "services.cloudflare-dyndns"                 = ./services/networking/cloudflare-dyndns.nix;
    "services.cloudflare-warp"                   = ./services/networking/cloudflare-warp.nix;
    "services.cloudflared"                       = ./services/networking/cloudflared.nix;
    "services.cloudlog"                          = ./services/web-apps/cloudlog.nix;
    "services.cntlm"                             = ./services/networking/cntlm.nix;
    "services.cockpit"                           = ./services/monitoring/cockpit.nix;
    "services.cockroachdb"                       = ./services/databases/cockroachdb.nix;
    "services.cocoon"                            = ./services/web-apps/cocoon.nix;
    "services.code-server"                       = ./services/web-apps/code-server.nix;
    "services.coder"                             = ./services/web-apps/coder.nix;
    "services.collabora-online"                  = ./services/web-apps/collabora-online.nix;
    "services.commafeed"                         = ./services/web-apps/commafeed.nix;
    "services.confd"                             = ./services/misc/confd.nix;
    "services.consul"                            = ./services/networking/consul.nix;
    "services.convos"                            = ./services/web-apps/convos.nix;
    "services.coredns"                           = ./services/networking/coredns.nix;
    "services.corerad"                           = ./services/networking/corerad.nix;
    "services.corosync"                          = ./services/cluster/corosync/default.nix;
    "services.corteza"                           = ./services/development/corteza.nix;
    "services.coturn"                            = ./services/networking/coturn.nix;
    "services.couchdb"                           = ./services/databases/couchdb.nix;
    "services.cpuminer-cryptonight"              = ./services/misc/cpuminer-cryptonight.nix;
    "services.cpupower-gui"                      = ./services/desktops/cpupower-gui.nix;
    "services.crab-hole"                         = ./services/networking/crab-hole.nix;
    "services.create_ap"                         = ./services/networking/create_ap.nix;
    "services.croc"                              = ./services/networking/croc.nix;
    "services.cross-seed"                        = ./services/torrent/cross-seed.nix;
    "services.crossfire-server"                  = ./services/games/crossfire-server.nix;
    "services.crossmacro"                        = ./services/desktops/crossmacro.nix;
    "services.crowdsec"                          = ./services/security/crowdsec.nix;
    "services.crowdsec-firewall-bouncer"         = ./services/security/crowdsec-firewall-bouncer.nix;
    "services.cryptpad"                          = ./services/web-apps/cryptpad.nix;
    "services.cyrus-imap"                        = ./services/mail/cyrus-imap.nix;
    "services.dae"                               = ./services/networking/dae.nix;
    "services.dante"                             = ./services/networking/dante.nix;
    "services.darkhttpd"                         = ./services/web-servers/darkhttpd.nix;
    "services.dashy"                             = ./services/web-apps/dashy.nix;
    "services.datadog-agent"                     = ./services/monitoring/datadog-agent.nix;
    "services.davfs2"                            = ./services/network-filesystems/davfs2.nix;
    "services.davis"                             = ./services/web-apps/davis.nix;
    "services.davmail"                           = ./services/mail/davmail.nix;
    "services.dawarich"                          = ./services/web-apps/dawarich.nix;
    "services.db-rest"                           = ./services/misc/db-rest.nix;
    "services.ddccontrol"                        = ./services/hardware/ddccontrol.nix;
    "services.ddclient"                          = ./services/networking/ddclient.nix;
    "services.ddns-updater"                      = ./services/networking/ddns-updater.nix;
    "services.deconz"                            = ./services/networking/deconz.nix;
    "services.deluge"                            = ./services/torrent/deluge.nix;
    "services.dendrite"                          = ./services/matrix/dendrite.nix;
    "services.dependency-track"                  = ./services/web-apps/dependency-track.nix;
    "services.devmon"                            = ./services/misc/devmon.nix;
    "services.devpi-server"                      = ./services/misc/devpi-server.nix;
    "services.dex"                               = ./services/web-apps/dex.nix;
    "services.deye-dummycloud"                   = ./services/home-automation/deye-dummycloud.nix;
    "services.dgraph"                            = ./services/databases/dgraph.nix;
    "services.diod"                              = ./services/network-filesystems/diod.nix;
    "services.discourse"                         = ./services/web-apps/discourse.nix;
    "services.displayManager.cosmic-greeter"       = ./services/display-managers/cosmic-greeter.nix;
    "services.displayManager.dms-greeter"          = ./services/display-managers/dms-greeter.nix;
    "services.displayManager.gdm"                  = ./services/display-managers/gdm.nix;
    "services.displayManager.lemurs"               = ./services/display-managers/lemurs.nix;
    "services.displayManager.ly"                   = ./services/display-managers/ly.nix;
    "services.displayManager.plasma-login-manager" = ./services/display-managers/plasma-login-manager.nix;
    "services.displayManager.sddm"                 = ./services/display-managers/sddm.nix;
    "services.distccd"                           = ./services/development/distccd.nix;
    "services.dnscache"                          = ./services/networking/dnscache.nix;
    "services.dnscrypt-proxy"                    = ./services/networking/dnscrypt-proxy.nix;
    "services.dnsdist"                           = ./services/networking/dnsdist.nix;
    "services.dnsproxy"                          = ./services/networking/dnsproxy.nix;
    "services.dockerRegistry"                    = ./services/misc/docker-registry.nix;
    "services.docling-serve"                     = ./services/misc/docling-serve.nix;
    "services.documize"                          = ./services/web-apps/documize.nix;
    "services.docuseal"                          = ./services/web-apps/docuseal.nix;
    "services.docuum"                            = ./services/admin/docuum.nix;
    "services.doh-proxy-rust"                    = ./services/networking/doh-proxy-rust.nix;
    "services.doh-server"                        = ./services/networking/doh-server.nix;
    "services.dokuwiki"                          = ./services/web-apps/dokuwiki.nix;
    "services.dolibarr"                          = ./services/web-apps/dolibarr.nix;
    "services.domoticz"                          = ./services/misc/domoticz.nix;
    "services.dovecot2"                          = ./services/mail/dovecot.nix;
    "services.dragonflydb"                       = ./services/databases/dragonflydb.nix;
    "services.drasl"                             = ./services/web-apps/drasl.nix;
    "services.draupnir"                          = ./services/matrix/draupnir.nix;
    "services.drbd"                              = ./services/network-filesystems/drbd.nix;
    "services.druid"                             = ./services/cluster/druid/default.nix;
    "services.drupal"                            = ./services/web-apps/drupal.nix;
    "services.dsnet"                             = ./services/networking/dsnet.nix;
    "services.dspam"                             = ./services/mail/dspam.nix;
    "services.duckdns"                           = ./services/misc/duckdns.nix;
    "services.duckling"                          = ./services/misc/duckling.nix;
    "services.dump1090-fa"                       = ./services/misc/dump1090-fa.nix;
    "services.dunst"                             = ./services/desktops/dunst.nix;
    "services.duplicati"                         = ./services/backup/duplicati.nix;
    "services.duplicity"                         = ./services/backup/duplicity.nix;
    "services.dwm-status"                        = ./services/misc/dwm-status.nix;
    "services.dysnomia"                          = ./services/misc/dysnomia.nix;
    "services.e-imzo"                            = ./services/security/e-imzo.nix;
    "services.earlyoom"                          = ./services/system/earlyoom.nix;
    "services.easytier"                          = ./services/networking/easytier.nix;
    "services.ebusd"                             = ./services/home-automation/ebusd.nix;
    "services.echoip"                            = ./services/web-apps/echoip.nix;
    "services.ejabberd"                          = ./services/networking/ejabberd.nix;
    "services.elasticsearch"                     = ./services/search/elasticsearch.nix;
    "services.elasticsearch-curator"             = ./services/search/elasticsearch-curator.nix;
    "services.elephant"                          = ./services/misc/elephant.nix;
    "services.emacs"                             = ./services/editors/emacs.nix;
    "services.endlessh"                          = ./services/security/endlessh.nix;
    "services.endlessh-go"                       = ./services/security/endlessh-go.nix;
    "services.engelsystem"                       = ./services/web-apps/engelsystem.nix;
    "services.ente"                              = ./services/web-apps/ente.nix;
    "services.epgstation"                        = ./services/video/epgstation/default.nix;
    "services.epmd"                              = ./services/networking/epmd.nix;
    "services.ergo"                              = ./services/networking/ergo.nix;
    "services.ergochat"                          = ./services/networking/ergochat.nix;
    "services.erigon"                            = ./services/blockchain/ethereum/erigon.nix;
    "services.errbot"                            = ./services/misc/errbot.nix;
    "services.ersatztv"                          = ./services/misc/ersatztv.nix;
    "services.espanso"                           = ./services/desktops/espanso.nix;
    "services.esphome"                           = ./services/home-automation/esphome.nix;
    "services.etebase-server"                    = ./services/misc/etebase-server.nix;
    "services.eternal-terminal"                  = ./services/networking/eternal-terminal.nix;
    "services.etesync-dav"                       = ./services/misc/etesync-dav.nix;
    "services.evcc"                              = ./services/home-automation/evcc.nix;
    "services.evdevremapkeys"                    = ./services/misc/evdevremapkeys.nix;
    "services.evremap"                           = ./services/misc/evremap.nix;
    "services.exim"                              = ./services/mail/exim.nix;
    "services.expressvpn"                        = ./services/networking/expressvpn.nix;
    "services.factorio"                          = ./services/games/factorio.nix;
    "services.fail2ban"                          = ./services/security/fail2ban.nix;
    "services.fakeroute"                         = ./services/networking/fakeroute.nix;
    "services.fastnetmon-advanced"               = ./services/networking/fastnetmon-advanced.nix;
    "services.fcron"                             = ./services/scheduling/fcron.nix;
    "services.fedimintd"                         = ./services/networking/fedimintd.nix;
    "services.felix"                             = ./services/misc/felix.nix;
    "services.ferm"                              = ./services/networking/ferm.nix;
    "services.ferretdb"                          = ./services/databases/ferretdb.nix;
    "services.fider"                             = ./services/web-apps/fider.nix;
    "services.filebeat"                          = ./services/logging/filebeat.nix;
    "services.filebrowser"                       = ./services/web-apps/filebrowser.nix;
    "services.firebird"                          = ./services/databases/firebird.nix;
    "services.firefly-iii"                       = ./services/web-apps/firefly-iii.nix;
    "services.firefly-iii-data-importer"         = ./services/web-apps/firefly-iii-data-importer.nix;
    "services.firefox-syncserver"                = ./services/networking/firefox-syncserver.nix;
    "services.fireqos"                           = ./services/networking/fireqos.nix;
    "services.firezone.gateway"                    = ./services/networking/firezone/gateway.nix;
    "services.firezone.gui-client"                 = ./services/networking/firezone/gui-client.nix;
    "services.firezone.headless-client"            = ./services/networking/firezone/headless-client.nix;
    "services.firezone.relay"                      = ./services/networking/firezone/relay.nix;
    "services.firezone.server"                     = ./services/networking/firezone/server.nix;
    "services.flannel"                           = ./services/networking/flannel.nix;
    "services.flaresolverr"                      = ./services/misc/flaresolverr.nix;
    "services.flarum"                            = ./services/web-apps/flarum.nix;
    "services.flexget"                           = ./services/torrent/flexget.nix;
    "services.flood"                             = ./services/torrent/flood.nix;
    "services.fluentd"                           = ./services/logging/fluentd.nix;
    "services.fluidd"                            = ./services/web-apps/fluidd.nix;
    "services.foldingathome"                     = ./services/computing/foldingathome/client.nix;
    "services.forgejo"                           = ./services/misc/forgejo.nix;
    "services.foundationdb"                      = ./services/databases/foundationdb.nix;
    "services.fractalart"                        = ./services/x11/fractalart.nix;
    "services.freeciv"                           = ./services/games/freeciv.nix;
    "services.freenet"                           = ./services/networking/freenet.nix;
    "services.freeradius"                        = ./services/networking/freeradius.nix;
    "services.freshrss"                          = ./services/web-apps/freshrss.nix;
    "services.frigate"                           = ./services/video/frigate.nix;
    "services.froide-govplan"                    = ./services/web-apps/froide-govplan.nix;
    "services.frp"                               = ./services/networking/frp.nix;
    "services.frr"                               = ./services/networking/frr.nix;
    "services.fusionInventory"                   = ./services/monitoring/fusion-inventory.nix;
    "services.g3proxy"                           = ./services/networking/g3proxy.nix;
    "services.g810-led"                          = ./services/hardware/g810-led.nix;
    "services.galene"                            = ./services/web-apps/galene.nix;
    "services.gammu-smsd"                        = ./services/misc/gammu-smsd.nix;
    "services.gancio"                            = ./services/web-apps/gancio.nix;
    "services.garage"                            = ./services/web-servers/garage.nix;
    "services.gatus"                             = ./services/monitoring/gatus.nix;
    "services.gdomap"                            = ./services/networking/gdomap.nix;
    "services.gemstash"                          = ./services/development/gemstash.nix;
    "services.geoclue2"                          = ./services/desktops/geoclue2.nix;
    "services.geoipupdate"                       = ./services/misc/geoipupdate.nix;
    "services.geph"                              = ./services/networking/geph.nix;
    "services.gerrit"                            = ./services/web-apps/gerrit.nix;
    "services.geth"                              = ./services/blockchain/ethereum/geth.nix;
    "services.getty"                             = ./services/ttys/getty.nix;
    "services.gitDaemon"                         = ./services/networking/git-daemon.nix;
    "services.gitea"                             = ./services/misc/gitea.nix;
    "services.gitea-actions-runner"              = ./services/continuous-integration/gitea-actions-runner.nix;
    "services.gitlab"                            = ./services/misc/gitlab.nix;
    "services.gitlab-runner"                     = ./services/continuous-integration/gitlab-runner/runner.nix;
    "services.gitwatch"                          = ./services/monitoring/gitwatch.nix;
    "services.glance"                            = ./services/web-apps/glance.nix;
    "services.glances"                           = ./services/monitoring/glances.nix;
    "services.glitchtip"                         = ./services/web-apps/glitchtip.nix;
    "services.globalprotect"                     = ./services/networking/globalprotect-vpn.nix;
    "services.glpiAgent"                         = ./services/monitoring/glpi-agent.nix;
    "services.glusterfs"                         = ./services/network-filesystems/glusterfs.nix;
    "services.gmediarender"                      = ./services/audio/gmediarender.nix;
    "services.gnome.evolution-data-server"         = ./services/desktops/gnome/evolution-data-server.nix;
    "services.gnome.gcr-ssh-agent"                 = ./services/desktops/gnome/gcr-ssh-agent.nix;
    "services.gnome.glib-networking"               = ./services/desktops/gnome/glib-networking.nix;
    "services.gnome.gnome-browser-connector"       = ./services/desktops/gnome/gnome-browser-connector.nix;
    "services.gnome.gnome-initial-setup"           = ./services/desktops/gnome/gnome-initial-setup.nix;
    "services.gnome.gnome-keyring"                 = ./services/desktops/gnome/gnome-keyring.nix;
    "services.gnome.gnome-online-accounts"         = ./services/desktops/gnome/gnome-online-accounts.nix;
    "services.gnome.gnome-online-miners"           = ./services/desktops/gnome/gnome-online-miners.nix;
    "services.gnome.gnome-remote-desktop"          = ./services/desktops/gnome/gnome-remote-desktop.nix;
    "services.gnome.gnome-settings-daemon"         = ./services/desktops/gnome/gnome-settings-daemon.nix;
    "services.gnome.gnome-software"                = ./services/desktops/gnome/gnome-software.nix;
    "services.gnome.gnome-user-share"              = ./services/desktops/gnome/gnome-user-share.nix;
    "services.gnome.localsearch"                   = ./services/desktops/gnome/localsearch.nix;
    "services.gnome.rygel"                         = ./services/desktops/gnome/rygel.nix;
    "services.gnome.sushi"                         = ./services/desktops/gnome/sushi.nix;
    "services.gnome.tinysparql"                    = ./services/desktops/gnome/tinysparql.nix;
    "services.gns3-server"                       = ./services/networking/gns3-server.nix;
    "services.gnunet"                            = ./services/networking/gnunet.nix;
    "services.go-autoconfig"                     = ./services/networking/go-autoconfig.nix;
    "services.go-camo"                           = ./services/networking/go-camo.nix;
    "services.go-csp-collector"                  = ./services/monitoring/go-csp-collector.nix;
    "services.go-httpbin"                        = ./services/web-apps/go-httpbin.nix;
    "services.go-neb"                            = ./services/networking/go-neb.nix;
    "services.go-shadowsocks2"                   = ./services/networking/go-shadowsocks2.nix;
    "services.go2rtc"                            = ./services/video/go2rtc/default.nix;
    "services.goatcounter"                       = ./services/web-apps/goatcounter.nix;
    "services.gobgpd"                            = ./services/networking/gobgpd.nix;
    "services.gocd-agent"                        = ./services/continuous-integration/gocd-agent/default.nix;
    "services.gocd-server"                       = ./services/continuous-integration/gocd-server/default.nix;
    "services.godns"                             = ./services/networking/godns.nix;
    "services.goeland"                           = ./services/mail/goeland.nix;
    "services.gollum"                            = ./services/misc/gollum.nix;
    "services.gonic"                             = ./services/audio/gonic.nix;
    "services.goss"                              = ./services/monitoring/goss.nix;
    "services.gotenberg"                         = ./services/misc/gotenberg.nix;
    "services.gotify"                            = ./services/web-apps/gotify-server.nix;
    "services.gotosocial"                        = ./services/web-apps/gotosocial.nix;
    "services.govee2mqtt"                        = ./services/home-automation/govee2mqtt.nix;
    "services.gpm"                               = ./services/ttys/gpm.nix;
    "services.gpsd"                              = ./services/misc/gpsd.nix;
    "services.grafana"                           = ./services/monitoring/grafana.nix;
    "services.grafana-image-renderer"            = ./services/monitoring/grafana-image-renderer.nix;
    "services.grafana-to-ntfy"                   = ./services/monitoring/grafana-to-ntfy.nix;
    "services.grafana_reporter"                  = ./services/monitoring/grafana-reporter.nix;
    "services.graphite"                          = ./services/monitoring/graphite.nix;
    "services.grav"                              = ./services/web-apps/grav.nix;
    "services.graylog"                           = ./services/logging/graylog.nix;
    "services.greenclip"                         = ./services/misc/greenclip.nix;
    "services.grocy"                             = ./services/web-apps/grocy.nix;
    "services.guacamole-client"                  = ./services/web-apps/guacamole-client.nix;
    "services.guacamole-server"                  = ./services/web-apps/guacamole-server.nix;
    "services.gvpe"                              = ./services/networking/gvpe.nix;
    "services.h2o"                               = ./services/web-servers/h2o/default.nix;
    "services.hadoop"                            = ./services/cluster/hadoop/default.nix;
    "services.handheld-daemon"                   = ./services/hardware/handheld-daemon.nix;
    "services.hans"                              = ./services/networking/hans.nix;
    "services.haproxy"                           = ./services/networking/haproxy.nix;
    "services.hardware.argonone"                   = ./services/hardware/argonone.nix;
    "services.hardware.bolt"                       = ./services/hardware/bolt.nix;
    "services.hardware.deepcool-digital-linux"     = ./services/hardware/deepcool-digital-linux.nix;
    "services.hardware.dell-bios-fan-control"      = ./services/hardware/dell-bios-fan-control.nix;
    "services.hardware.openrgb"                    = ./services/hardware/openrgb.nix;
    "services.hardware.pommed"                     = ./services/hardware/pommed.nix;
    "services.harmonia"                          = ./services/networking/harmonia.nix;
    "services.haste-server"                      = ./services/editors/haste.nix;
    "services.hatsu"                             = ./services/web-apps/hatsu.nix;
    "services.haveged"                           = ./services/security/haveged.nix;
    "services.haven"                             = ./services/web-apps/haven.nix;
    "services.hbase-standalone"                  = ./services/databases/hbase-standalone.nix;
    "services.hdapsd"                            = ./services/monitoring/hdaps.nix;
    "services.hddfancontrol"                     = ./services/hardware/hddfancontrol.nix;
    "services.headphones"                        = ./services/misc/headphones.nix;
    "services.headscale"                         = ./services/networking/headscale.nix;
    "services.healthchecks"                      = ./services/web-apps/healthchecks.nix;
    "services.heapster"                          = ./services/monitoring/heapster.nix;
    "services.heartbeat"                         = ./services/logging/heartbeat.nix;
    "services.hebbot"                            = ./services/matrix/hebbot.nix;
    "services.hedgedoc"                          = ./services/web-apps/hedgedoc.nix;
    "services.heisenbridge"                      = ./services/misc/heisenbridge.nix;
    "services.hickory-dns"                       = ./services/networking/hickory-dns.nix;
    "services.hitch"                             = ./services/web-servers/hitch/default.nix;
    "services.hledger-web"                       = ./services/web-apps/hledger-web.nix;
    "services.hologram-agent"                    = ./services/security/hologram-agent.nix;
    "services.hologram-server"                   = ./services/security/hologram-server.nix;
    "services.home-assistant"                    = ./services/home-automation/home-assistant.nix;
    "services.homebox"                           = ./services/web-apps/homebox.nix;
    "services.homebridge"                        = ./services/home-automation/homebridge.nix;
    "services.homepage-dashboard"                = ./services/misc/homepage-dashboard.nix;
    "services.homer"                             = ./services/web-apps/homer.nix;
    "services.honk"                              = ./services/web-apps/honk.nix;
    "services.hoogle"                            = ./services/development/hoogle.nix;
    "services.hostapd"                           = ./services/networking/hostapd.nix;
    "services.hound"                             = ./services/search/hound.nix;
    "services.hqplayerd"                         = ./services/audio/hqplayerd.nix;
    "services.htpdate"                           = ./services/networking/htpdate.nix;
    "services.httpd"                             = ./services/web-servers/apache-httpd/default.nix;
    "services.https-dns-proxy"                   = ./services/networking/https-dns-proxy.nix;
    "services.hydra"                             = ./services/continuous-integration/hydra/default.nix;
    "services.hypridle"                          = ./services/wayland/hypridle.nix;
    "services.hyprwhspr-rs"                      = ./services/misc/hyprwhspr-rs.nix;
    "services.i2p"                               = ./services/networking/i2p.nix;
    "services.i2pd"                              = ./services/networking/i2pd.nix;
    "services.icecream.daemon"                     = ./services/networking/icecream/daemon.nix;
    "services.icecream.scheduler"                  = ./services/networking/icecream/scheduler.nix;
    "services.icingaweb2"                          = ./services/web-apps/icingaweb2/icingaweb2.nix;
    "services.icingaweb2.modules"                  = ./services/web-apps/icingaweb2/module-monitoring.nix;
    "services.ifm"                               = ./services/web-apps/ifm.nix;
    "services.ihaskell"                          = ./services/misc/ihaskell.nix;
    "services.iio-niri"                          = ./services/misc/iio-niri.nix;
    "services.illum"                             = ./services/hardware/illum.nix;
    "services.imaginary"                         = ./services/networking/imaginary.nix;
    "services.immich"                            = ./services/web-apps/immich.nix;
    "services.immich-kiosk"                      = ./services/web-apps/immich-kiosk.nix;
    "services.immich-public-proxy"               = ./services/web-apps/immich-public-proxy.nix;
    "services.immichframe"                       = ./services/web-apps/immichframe.nix;
    "services.inadyn"                            = ./services/networking/inadyn.nix;
    "services.incron"                            = ./services/monitoring/incron.nix;
    "services.infinoted"                         = ./services/editors/infinoted.nix;
    "services.influxdb"                          = ./services/databases/influxdb.nix;
    "services.influxdb2"                         = ./services/databases/influxdb2.nix;
    "services.input-remapper"                    = ./services/misc/input-remapper.nix;
    "services.inputplumber"                      = ./services/hardware/inputplumber.nix;
    "services.inspircd"                          = ./services/networking/inspircd.nix;
    "services.interception-tools"                = ./services/hardware/interception-tools.nix;
    "services.invidious"                         = ./services/web-apps/invidious.nix;
    "services.invidious-router"                  = ./services/misc/invidious-router.nix;
    "services.invoiceplane"                      = ./services/web-apps/invoiceplane.nix;
    "services.iodine"                            = ./services/networking/iodine.nix;
    "services.iperf3"                            = ./services/networking/iperf3.nix;
    "services.ipfs-cluster"                      = ./services/network-filesystems/ipfs-cluster.nix;
    "services.ipp-usb"                           = ./services/printing/ipp-usb.nix;
    "services.iptsd"                             = ./services/hardware/iptsd.nix;
    "services.ircdHybrid"                        = ./services/networking/ircd-hybrid/default.nix;
    "services.irkerd"                            = ./services/misc/irkerd.nix;
    "services.irqbalance"                        = ./services/hardware/irqbalance.nix;
    "services.isso"                              = ./services/web-apps/isso.nix;
    "services.ivpn"                              = ./services/networking/ivpn.nix;
    "services.jackett"                           = ./services/misc/jackett.nix;
    "services.jboss"                             = ./services/web-servers/jboss/default.nix;
    "services.jellyfin"                          = ./services/misc/jellyfin.nix;
    "services.jenkins"                             = ./services/continuous-integration/jenkins/default.nix;
    "services.jenkins.jobBuilder"                  = ./services/continuous-integration/jenkins/job-builder.nix;
    "services.jenkinsSlave"                      = ./services/continuous-integration/jenkins/slave.nix;
    "services.jibri"                             = ./services/networking/jibri/default.nix;
    "services.jicofo"                            = ./services/networking/jicofo.nix;
    "services.jigasi"                            = ./services/networking/jigasi.nix;
    "services.jirafeau"                          = ./services/web-apps/jirafeau.nix;
    "services.jitsi-meet"                        = ./services/web-apps/jitsi-meet.nix;
    "services.jitsi-videobridge"                 = ./services/networking/jitsi-videobridge.nix;
    "services.jitterentropy-rngd"                = ./services/security/jitterentropy-rngd.nix;
    "services.jmusicbot"                         = ./services/audio/jmusicbot.nix;
    "services.jotta-cli"                         = ./services/networking/jotta-cli.nix;
    "services.journalbeat"                       = ./services/logging/journalbeat.nix;
    "services.journald.gateway"                    = ./system/boot/systemd/journald-gateway.nix;
    "services.journald.remote"                     = ./system/boot/systemd/journald-remote.nix;
    "services.journald.upload"                     = ./system/boot/systemd/journald-upload.nix;
    "services.journaldriver"                     = ./services/logging/journaldriver.nix;
    "services.journalwatch"                      = ./services/logging/journalwatch.nix;
    "services.joycond"                           = ./services/hardware/joycond.nix;
    "services.jupyter"                           = ./services/development/jupyter/default.nix;
    "services.jupyterhub"                        = ./services/development/jupyterhub/default.nix;
    "services.kanata"                            = ./services/hardware/kanata.nix;
    "services.kanboard"                          = ./services/web-apps/kanboard.nix;
    "services.kapacitor"                         = ./services/monitoring/kapacitor.nix;
    "services.karakeep"                          = ./services/web-apps/karakeep.nix;
    "services.karma"                             = ./services/monitoring/karma.nix;
    "services.kasmweb"                           = ./services/web-apps/kasmweb/default.nix;
    "services.kavita"                            = ./services/web-apps/kavita.nix;
    "services.kbfs"                              = ./services/network-filesystems/kbfs.nix;
    "services.kea"                               = ./services/networking/kea.nix;
    "services.keepalived"                        = ./services/networking/keepalived/default.nix;
    "services.keybase"                           = ./services/networking/keybase.nix;
    "services.keycloak"                          = ./services/web-apps/keycloak.nix;
    "services.keyd"                              = ./services/hardware/keyd.nix;
    "services.kimai"                             = ./services/web-apps/kimai.nix;
    "services.kismet"                            = ./services/networking/kismet.nix;
    "services.kiwix-serve"                       = ./services/misc/kiwix-serve.nix;
    "services.kmonad"                            = ./services/hardware/kmonad.nix;
    "services.kmscon"                            = ./services/ttys/kmscon.nix;
    "services.knot"                              = ./services/networking/knot.nix;
    "services.knot-resolver"                     = ./services/networking/knot-resolver.nix;
    "services.komga"                             = ./services/web-apps/komga.nix;
    "services.komodo-periphery"                  = ./services/admin/komodo-periphery.nix;
    "services.kresd"                             = ./services/networking/kresd.nix;
    "services.kthxbye"                           = ./services/monitoring/kthxbye.nix;
    # Multi-module family: members read each other's option declarations
    # (e.g. addons/dns.nix → options.services.kubernetes.apiserver.…), so
    # any future load-on-access must pull the whole set.  coversDefn only
    # tests key presence, so a single 2-component key suffices.
    "services.kubernetes"                          = [
      ./services/cluster/kubernetes/default.nix
      ./services/cluster/kubernetes/addon-manager.nix
      ./services/cluster/kubernetes/addons/dns.nix
      ./services/cluster/kubernetes/apiserver.nix
      ./services/cluster/kubernetes/controller-manager.nix
      ./services/cluster/kubernetes/flannel.nix
      ./services/cluster/kubernetes/kubelet.nix
      ./services/cluster/kubernetes/pki.nix
      ./services/cluster/kubernetes/proxy.nix
      ./services/cluster/kubernetes/scheduler.nix
    ];
    "services.kubo"                              = ./services/network-filesystems/kubo.nix;
    "services.labgrid"                           = ./services/development/labgrid/coordinator.nix;
    "services.lact"                              = ./services/hardware/lact.nix;
    "services.lambdabot"                         = ./services/networking/lambdabot.nix;
    "services.languagetool"                      = ./services/misc/languagetool.nix;
    "services.lanraragi"                         = ./services/web-apps/lanraragi.nix;
    "services.lasuite-docs"                      = ./services/web-apps/lasuite-docs.nix;
    "services.lasuite-meet"                      = ./services/web-apps/lasuite-meet.nix;
    "services.lauti"                             = ./services/web-apps/lauti.nix;
    "services.lavalink"                          = ./services/audio/lavalink.nix;
    "services.leaps"                             = ./services/misc/leaps.nix;
    "services.legit"                             = ./services/networking/legit.nix;
    "services.lemmy"                             = ./services/web-apps/lemmy.nix;
    "services.libeufin"                            = ./services/finance/libeufin/module.nix;
    "services.libeufin.bank"                       = ./services/finance/libeufin/bank.nix;
    "services.libeufin.nexus"                      = ./services/finance/libeufin/nexus.nix;
    "services.libinput"                          = ./services/hardware/libinput.nix;
    "services.librechat"                         = ./services/web-apps/librechat.nix;
    "services.librenms"                          = ./services/monitoring/librenms.nix;
    "services.librespeed"                        = ./services/web-apps/librespeed.nix;
    "services.libreswan"                         = ./services/networking/libreswan.nix;
    "services.libretranslate"                    = ./services/web-apps/libretranslate.nix;
    "services.libvirtd"                          = ./services/backup/libvirtd-autosnapshot.nix;
    "services.lidarr"                            = ./services/misc/servarr/lidarr.nix;
    "services.lifecycled"                        = ./services/misc/lifecycled.nix;
    "services.lighthouse"                        = ./services/blockchain/ethereum/lighthouse.nix;
    "services.lighttpd"                            = ./services/web-servers/lighttpd/default.nix;
    "services.lighttpd.cgit"                       = ./services/web-servers/lighttpd/cgit.nix;
    "services.lighttpd.collectd"                   = ./services/web-servers/lighttpd/collectd.nix;
    "services.lighttpd.gitweb"                     = ./services/web-servers/lighttpd/gitweb.nix;
    "services.limesurvey"                        = ./services/web-apps/limesurvey.nix;
    "services.linkding"                          = ./services/web-apps/linkding.nix;
    "services.linkwarden"                        = ./services/web-apps/linkwarden.nix;
    "services.linux-enable-ir-emitter"           = ./services/misc/linux-enable-ir-emitter.nix;
    "services.linyaps"                           = ./services/desktops/linyaps.nix;
    "services.lirc"                              = ./services/hardware/lirc.nix;
    "services.listmonk"                          = ./services/mail/listmonk.nix;
    "services.litellm"                           = ./services/misc/litellm.nix;
    "services.litestream"                        = ./services/network-filesystems/litestream/default.nix;
    "services.livebook"                          = ./services/development/livebook.nix;
    "services.livekit"                             = ./services/networking/livekit.nix;
    "services.livekit.ingress"                     = ./services/networking/livekit-ingress.nix;
    "services.lk-jwt-service"                    = ./services/matrix/lk-jwt-service.nix;
    "services.llama-cpp"                         = ./services/misc/llama-cpp.nix;
    "services.llama-swap"                        = ./services/networking/llama-swap.nix;
    "services.lldap"                             = ./services/databases/lldap.nix;
    "services.lldpd"                             = ./services/networking/lldpd.nix;
    "services.local-content-share"               = ./services/misc/local-content-share.nix;
    "services.localtimed"                        = ./services/system/localtimed.nix;
    "services.logcheck"                          = ./services/logging/logcheck.nix;
    "services.logkeys"                           = ./services/misc/logkeys.nix;
    "services.logmein-hamachi"                   = ./services/networking/logmein-hamachi.nix;
    "services.logrotate"                         = ./services/logging/logrotate.nix;
    "services.logstash"                          = ./services/logging/logstash.nix;
    "services.loki"                              = ./services/monitoring/loki.nix;
    "services.lokinet"                           = ./services/networking/lokinet.nix;
    "services.longview"                          = ./services/monitoring/longview.nix;
    "services.lorri"                             = ./services/development/lorri.nix;
    "services.lubelogger"                        = ./services/web-apps/lubelogger.nix;
    "services.mackerel-agent"                    = ./services/monitoring/mackerel-agent.nix;
    "services.maddy"                             = ./services/mail/maddy.nix;
    "services.magic-wormhole-mailbox-server"     = ./services/networking/magic-wormhole-mailbox-server.nix;
    "services.magnetico"                         = ./services/torrent/magnetico.nix;
    "services.mailcatcher"                       = ./services/mail/mailcatcher.nix;
    "services.mailman"                           = ./services/mail/mailman.nix;
    "services.mailpit"                           = ./services/mail/mailpit.nix;
    "services.mainsail"                          = ./services/web-apps/mainsail.nix;
    "services.mame"                              = ./services/misc/mame.nix;
    "services.manticore"                         = ./services/search/manticore.nix;
    "services.marytts"                           = ./services/audio/marytts.nix;
    "services.mastodon"                          = ./services/web-apps/mastodon.nix;
    "services.matomo"                            = ./services/web-apps/matomo.nix;
    "services.matrix-alertmanager"               = ./services/matrix/matrix-alertmanager.nix;
    "services.matrix-appservice-discord"         = ./services/matrix/appservice-discord.nix;
    "services.matrix-appservice-irc"             = ./services/matrix/appservice-irc.nix;
    "services.matrix-conduit"                    = ./services/matrix/conduit.nix;
    "services.matrix-continuwuity"               = ./services/matrix/continuwuity.nix;
    "services.matrix-hookshot"                   = ./services/matrix/hookshot.nix;
    "services.matrix-synapse"                    = ./services/matrix/synapse.nix;
    "services.matrix-tuwunel"                    = ./services/matrix/tuwunel.nix;
    "services.matter-server"                     = ./services/home-automation/matter-server.nix;
    "services.matterbridge"                      = ./services/networking/matterbridge.nix;
    "services.mattermost"                        = ./services/web-apps/mattermost.nix;
    "services.maubot"                            = ./services/matrix/maubot.nix;
    "services.mautrix-discord"                   = ./services/matrix/mautrix-discord.nix;
    "services.mautrix-meta"                      = ./services/matrix/mautrix-meta.nix;
    "services.mautrix-signal"                    = ./services/matrix/mautrix-signal.nix;
    "services.mautrix-telegram"                  = ./services/matrix/mautrix-telegram.nix;
    "services.mautrix-whatsapp"                  = ./services/matrix/mautrix-whatsapp.nix;
    "services.mbpfan"                            = ./services/misc/mbpfan.nix;
    "services.mchprs"                            = ./services/games/mchprs.nix;
    "services.mealie"                            = ./services/web-apps/mealie.nix;
    "services.mediagoblin"                       = ./services/web-apps/mediagoblin.nix;
    "services.mediamtx"                          = ./services/video/mediamtx.nix;
    "services.mediatomb"                         = ./services/misc/mediatomb.nix;
    "services.mediawiki"                         = ./services/web-apps/mediawiki.nix;
    "services.meilisearch"                       = ./services/search/meilisearch.nix;
    "services.memcached"                         = ./services/databases/memcached.nix;
    "services.meme-bingo-web"                    = ./services/web-apps/meme-bingo-web.nix;
    "services.memos"                             = ./services/misc/memos.nix;
    "services.merecat"                           = ./services/web-servers/merecat.nix;
    "services.meshcentral"                       = ./services/admin/meshcentral.nix;
    "services.meshtasticd"                       = ./services/networking/meshtasticd.nix;
    "services.metabase"                          = ./services/misc/metabase.nix;
    "services.metricbeat"                        = ./services/monitoring/metricbeat.nix;
    "services.microbin"                          = ./services/web-apps/microbin.nix;
    "services.microsocks"                        = ./services/networking/microsocks.nix;
    "services.mighttpd2"                         = ./services/web-servers/mighttpd2.nix;
    "services.mihomo"                            = ./services/networking/mihomo.nix;
    "services.mimir"                             = ./services/monitoring/mimir.nix;
    "services.minecraft-server"                  = ./services/games/minecraft-server.nix;
    "services.minetest-server"                   = ./services/games/minetest-server.nix;
    "services.minidlna"                          = ./services/networking/minidlna.nix;
    "services.miniflux"                          = ./services/web-apps/miniflux.nix;
    "services.minio"                             = ./services/web-servers/minio.nix;
    "services.miniupnpd"                         = ./services/networking/miniupnpd.nix;
    "services.mirakurun"                         = ./services/video/mirakurun.nix;
    "services.miredo"                            = ./services/networking/miredo.nix;
    "services.misskey"                           = ./services/web-apps/misskey.nix;
    "services.mjolnir"                           = ./services/matrix/mjolnir.nix;
    "services.mjpg-streamer"                     = ./services/networking/mjpg-streamer.nix;
    "services.mlmmj"                             = ./services/mail/mlmmj.nix;
    "services.mmsd"                              = ./services/networking/mmsd.nix;
    "services.mobilizon"                         = ./services/web-apps/mobilizon.nix;
    "services.mollysocket"                       = ./services/misc/mollysocket.nix;
    "services.monado"                            = ./services/hardware/monado.nix;
    "services.monero"                            = ./services/networking/monero.nix;
    "services.monetdb"                           = ./services/databases/monetdb.nix;
    "services.mongodb"                           = ./services/databases/mongodb.nix;
    "services.monica"                            = ./services/web-apps/monica.nix;
    "services.monit"                             = ./services/monitoring/monit.nix;
    "services.moodle"                            = ./services/web-apps/moodle.nix;
    "services.moosefs"                           = ./services/network-filesystems/moosefs.nix;
    "services.mopidy"                            = ./services/audio/mopidy.nix;
    "services.mosquitto"                         = ./services/networking/mosquitto.nix;
    "services.motioneye"                         = ./services/video/motioneye.nix;
    "services.movim"                             = ./services/web-apps/movim.nix;
    "services.mozillavpn"                        = ./services/networking/mozillavpn.nix;
    "services.mpd"                               = ./services/audio/mpd.nix;
    "services.mpdscribble"                       = ./services/audio/mpdscribble.nix;
    "services.mptcpd"                            = ./services/networking/mptcpd.nix;
    "services.mqtt2influxdb"                     = ./services/misc/mqtt2influxdb.nix;
    "services.mstpd"                             = ./services/networking/mstpd.nix;
    "services.mtprotoproxy"                      = ./services/networking/mtprotoproxy.nix;
    "services.mtr-exporter"                      = ./services/networking/mtr-exporter.nix;
    "services.munge"                             = ./services/security/munge.nix;
    "services.munin-node"                        = ./services/monitoring/munin.nix;
    "services.murmur"                            = ./services/networking/murmur.nix;
    "services.music-assistant"                   = ./services/audio/music-assistant.nix;
    "services.mycelium"                          = ./services/networking/mycelium.nix;
    "services.mympd"                             = ./services/audio/mympd.nix;
    "services.mysql"                             = ./services/databases/mysql.nix;
    "services.mysqlBackup"                       = ./services/backup/mysql-backup.nix;
    "services.n8n"                               = ./services/misc/n8n.nix;
    "services.nagios"                            = ./services/monitoring/nagios.nix;
    "services.namecoind"                         = ./services/networking/namecoind.nix;
    "services.nar-serve"                         = ./services/networking/nar-serve.nix;
    "services.nats"                              = ./services/networking/nats.nix;
    "services.navidrome"                         = ./services/audio/navidrome.nix;
    "services.nbd"                               = ./services/networking/nbd.nix;
    "services.ncdns"                             = ./services/networking/ncdns.nix;
    "services.ncps"                              = ./services/networking/ncps.nix;
    "services.ndppd"                             = ./services/networking/ndppd.nix;
    "services.neard"                             = ./services/desktops/neard.nix;
    "services.nebula-lighthouse-service"         = ./services/networking/nebula-lighthouse-service.nix;
    "services.neo4j"                             = ./services/databases/neo4j.nix;
    "services.netatalk"                          = ./services/network-filesystems/netatalk.nix;
    "services.netbird"                           = ./services/networking/netbird.nix;
    "services.netbox"                            = ./services/web-apps/netbox.nix;
    "services.netclient"                         = ./services/networking/netclient.nix;
    "services.netdata"                           = ./services/monitoring/netdata.nix;
    "services.networkaudiod"                     = ./services/audio/networkaudiod.nix;
    "services.networkd-dispatcher"               = ./services/networking/networkd-dispatcher.nix;
    "services.networking"                        = ./services/networking/websockify.nix;
    "services.newt"                              = ./services/networking/newt.nix;
    "services.nextcloud"                         = ./services/web-apps/nextcloud.nix;
    "services.nextcloud-spreed-signaling"        = ./services/networking/nextcloud-spreed-signaling.nix;
    "services.nextcloud-whiteboard-server"       = ./services/web-apps/nextcloud-whiteboard-server.nix;
    "services.nextdns"                           = ./services/networking/nextdns.nix;
    "services.nextjs-ollama-llm-ui"              = ./services/web-apps/nextjs-ollama-llm-ui.nix;
    "services.nexus"                             = ./services/web-apps/nexus.nix;
    "services.nezha-agent"                       = ./services/monitoring/nezha-agent.nix;
    "services.nginx"                             = ./services/web-servers/nginx/default.nix;
    "services.nginx.gitweb"                        = ./services/web-servers/nginx/gitweb.nix;
    "services.nginx.sso"                           = ./services/security/nginx-sso.nix;
    "services.nginx.tailscaleAuth"                 = ./services/web-servers/nginx/tailscale-auth.nix;
    "services.ngircd"                            = ./services/networking/ngircd.nix;
    "services.nifi"                              = ./services/web-apps/nifi.nix;
    "services.nipap"                             = ./services/web-apps/nipap.nix;
    "services.nitter"                            = ./services/misc/nitter.nix;
    "services.nix-serve"                         = ./services/networking/nix-serve.nix;
    "services.nixops-dns"                        = ./services/networking/nixops-dns.nix;
    "services.nncp"                              = ./services/networking/nncp.nix;
    "services.nntp-proxy"                        = ./services/networking/nntp-proxy.nix;
    "services.node-red"                          = ./services/web-apps/node-red.nix;
    "services.nohang"                            = ./services/system/nohang.nix;
    "services.nomad"                             = ./services/networking/nomad.nix;
    "services.nominatim"                         = ./services/search/nominatim.nix;
    "services.nostr-rs-relay"                    = ./services/web-apps/nostr-rs-relay.nix;
    "services.novacomd"                          = ./services/misc/novacomd.nix;
    "services.nsd"                               = ./services/networking/nsd.nix;
    "services.ntopng"                            = ./services/networking/ntopng.nix;
    "services.ntp"                               = ./services/networking/ntp/ntpd.nix;
    "services.ntpd-rs"                           = ./services/networking/ntp/ntpd-rs.nix;
    "services.nullidentdmod"                     = ./services/networking/nullidentdmod.nix;
    "services.nullmailer"                        = ./services/mail/nullmailer.nix;
    "services.nvme-rs"                           = ./services/system/nvme-rs.nix;
    "services.nylon"                             = ./services/networking/nylon.nix;
    "services.nzbget"                            = ./services/misc/nzbget.nix;
    "services.nzbhydra2"                         = ./services/misc/nzbhydra2.nix;
    "services.oauth2-proxy"                      = ./services/security/oauth2-proxy.nix;
    "services.ocis"                              = ./services/web-apps/ocis.nix;
    "services.ocserv"                            = ./services/networking/ocserv.nix;
    "services.odoo"                              = ./services/finance/odoo.nix;
    "services.offlineimap"                       = ./services/mail/offlineimap.nix;
    "services.ofono"                             = ./services/networking/ofono.nix;
    "services.oink"                              = ./services/networking/oink.nix;
    "services.olivetin"                          = ./services/web-apps/olivetin.nix;
    "services.ollama"                            = ./services/misc/ollama.nix;
    "services.ombi"                              = ./services/misc/ombi.nix;
    "services.omnom"                             = ./services/misc/omnom.nix;
    "services.oncall"                            = ./services/web-apps/oncall.nix;
    "services.onedrive"                          = ./services/networking/onedrive.nix;
    "services.onlyoffice"                        = ./services/web-apps/onlyoffice.nix;
    "services.open-web-calendar"                 = ./services/web-apps/open-web-calendar.nix;
    "services.open-webui"                        = ./services/misc/open-webui.nix;
    "services.openarena"                         = ./services/games/openarena.nix;
    "services.openbao"                           = ./services/security/openbao.nix;
    "services.opencloud"                         = ./services/web-apps/opencloud.nix;
    "services.opendkim"                          = ./services/mail/opendkim.nix;
    "services.openldap"                          = ./services/databases/openldap.nix;
    "services.opensearch"                        = ./services/search/opensearch.nix;
    "services.opensmtpd"                         = ./services/mail/opensmtpd.nix;
    "services.opensnitch"                        = ./services/security/opensnitch.nix;
    "services.opentelemetry-collector"           = ./services/monitoring/opentelemetry-collector.nix;
    "services.openthread-border-router"          = ./services/home-automation/openthread-border-router.nix;
    "services.opentracker"                       = ./services/torrent/opentracker.nix;
    "services.opentsdb"                          = ./services/databases/opentsdb.nix;
    "services.openvpn"                           = ./services/networking/openvpn.nix;
    "services.openvscode-server"                 = ./services/web-apps/openvscode-server.nix;
    "services.openwebrx"                         = ./services/web-apps/openwebrx.nix;
    "services.opkssh"                            = ./services/networking/opkssh/opkssh.nix;
    "services.orangefs.client"                     = ./services/network-filesystems/orangefs/client.nix;
    "services.orangefs.server"                     = ./services/network-filesystems/orangefs/server.nix;
    "services.orthanc"                           = ./services/misc/orthanc.nix;
    "services.osquery"                           = ./services/monitoring/osquery.nix;
    "services.osrm"                              = ./services/misc/osrm.nix;
    "services.ostinato"                          = ./services/networking/ostinato.nix;
    "services.outline"                           = ./services/web-apps/outline.nix;
    "services.overseerr"                         = ./services/misc/overseerr.nix;
    "services.owamp"                             = ./services/networking/owamp.nix;
    "services.owncast"                           = ./services/misc/owncast.nix;
    "services.oxidized"                          = ./services/admin/oxidized.nix;
    "services.pacemaker"                         = ./services/cluster/pacemaker/default.nix;
    "services.pairdrop"                          = ./services/web-apps/pairdrop.nix;
    "services.paisa"                             = ./services/misc/paisa.nix;
    "services.pangolin"                          = ./services/networking/pangolin.nix;
    "services.pantalaimon-headless"              = ./services/matrix/pantalaimon.nix;
    "services.paperless"                         = ./services/misc/paperless.nix;
    "services.papra"                             = ./services/web-apps/papra.nix;
    "services.parsedmarc"                        = ./services/monitoring/parsedmarc.nix;
    "services.part-db"                           = ./services/web-apps/part-db.nix;
    "services.passSecretService"                 = ./services/security/pass-secret-service.nix;
    "services.patroni"                           = ./services/cluster/patroni/default.nix;
    "services.pdfding"                           = ./services/web-apps/pdfding.nix;
    "services.pdns-recursor"                     = ./services/networking/pdns-recursor.nix;
    "services.pdnsd"                             = ./services/networking/pdnsd.nix;
    "services.peerflix"                          = ./services/torrent/peerflix.nix;
    "services.peering-manager"                   = ./services/web-apps/peering-manager.nix;
    "services.peertube"                          = ./services/web-apps/peertube.nix;
    "services.peertube-runner"                   = ./services/web-apps/peertube-runner.nix;
    "services.perses"                            = ./services/monitoring/perses.nix;
    "services.persistent-evdev"                  = ./services/misc/persistent-evdev.nix;
    "services.pgadmin"                           = ./services/admin/pgadmin.nix;
    "services.pgbackrest"                        = ./services/backup/pgbackrest.nix;
    "services.pgbouncer"                         = ./services/databases/pgbouncer.nix;
    "services.pghero"                            = ./services/misc/pghero.nix;
    "services.pgmanage"                          = ./services/databases/pgmanage.nix;
    "services.pgscv"                             = ./services/monitoring/pgscv.nix;
    "services.photonvision"                      = ./services/video/photonvision.nix;
    "services.photoprism"                        = ./services/web-apps/photoprism.nix;
    "services.photoview"                         = ./services/web-apps/photoview.nix;
    "services.phylactery"                        = ./services/web-apps/phylactery.nix;
    "services.physlock"                          = ./services/security/physlock.nix;
    "services.picom"                             = ./services/x11/picom.nix;
    "services.picosnitch"                        = ./services/networking/picosnitch.nix;
    "services.pict-rs"                           = ./services/web-apps/pict-rs.nix;
    "services.pihole-ftl"                        = ./services/networking/pihole-ftl.nix;
    "services.pihole-web"                        = ./services/web-apps/pihole-web.nix;
    "services.pinchflat"                         = ./services/misc/pinchflat.nix;
    "services.pinnwand"                          = ./services/misc/pinnwand.nix;
    "services.pixelfed"                          = ./services/web-apps/pixelfed.nix;
    "services.pixiecore"                         = ./services/networking/pixiecore.nix;
    "services.plantuml-server"                   = ./services/web-apps/plantuml-server.nix;
    "services.plausible"                         = ./services/web-apps/plausible.nix;
    "services.playerctld"                        = ./services/desktops/playerctld.nix;
    "services.pleroma"                           = ./services/networking/pleroma.nix;
    "services.plex"                              = ./services/misc/plex.nix;
    "services.plikd"                             = ./services/misc/plikd.nix;
    "services.pocket-id"                         = ./services/security/pocket-id.nix;
    "services.podgrab"                           = ./services/misc/podgrab.nix;
    "services.polaris"                           = ./services/misc/polaris.nix;
    "services.pomerium"                          = ./services/web-servers/pomerium.nix;
    "services.portunus"                          = ./services/misc/portunus.nix;
    "services.porxie"                            = ./services/networking/porxie.nix;
    "services.postfix-tlspol"                    = ./services/mail/postfix-tlspol.nix;
    "services.postgres-websockets"               = ./services/databases/postgres-websockets.nix;
    "services.postgresql"                        = ./services/databases/postgresql.nix;
    "services.postgresqlBackup"                  = ./services/backup/postgresql-backup.nix;
    "services.postgresqlWalReceiver"             = ./services/backup/postgresql-wal-receiver.nix;
    "services.postgrest"                         = ./services/databases/postgrest.nix;
    "services.postgrey"                          = ./services/mail/postgrey.nix;
    "services.postsrsd"                          = ./services/mail/postsrsd.nix;
    "services.powerdns"                          = ./services/networking/powerdns.nix;
    "services.powerdns-admin"                    = ./services/web-apps/powerdns-admin.nix;
    "services.powerstation"                      = ./services/hardware/powerstation.nix;
    "services.pppd"                              = ./services/networking/pppd.nix;
    "services.pptpd"                             = ./services/networking/pptpd.nix;
    "services.prefect"                           = ./services/scheduling/prefect.nix;
    "services.pretalx"                           = ./services/web-apps/pretalx.nix;
    "services.pretix"                            = ./services/web-apps/pretix.nix;
    "services.privatebin"                        = ./services/web-apps/privatebin.nix;
    "services.privoxy"                           = ./services/networking/privoxy.nix;
    "services.prometheus"                        = ./services/monitoring/prometheus/default.nix;
    "services.prometheus.alertmanager"             = ./services/monitoring/prometheus/alertmanager.nix;
    "services.prometheus.alertmanager-ntfy"        = ./services/monitoring/prometheus/alertmanager-ntfy.nix;
    "services.prometheus.alertmanagerGotifyBridge" = ./services/monitoring/prometheus/alertmanager-gotify-bridge.nix;
    "services.prometheus.alertmanagerIrcRelay"     = ./services/monitoring/prometheus/alertmanager-irc-relay.nix;
    "services.prometheus.alertmanagerWebhookLogger"= ./services/monitoring/prometheus/alertmanager-webhook-logger.nix;
    "services.prometheus.exporters"                = ./services/monitoring/prometheus/exporters.nix;
    "services.prometheus.pushgateway"              = ./services/monitoring/prometheus/pushgateway.nix;
    "services.prometheus.sachet"                   = ./services/monitoring/prometheus/sachet.nix;
    "services.prometheus.xmpp-alerts"              = ./services/monitoring/prometheus/xmpp-alerts.nix;
    "services.prosody"                           = ./services/networking/prosody.nix;
    "services.prosody-filer"                     = ./services/web-apps/prosody-filer.nix;
    "services.protonmail-bridge"                 = ./services/mail/protonmail-bridge.nix;
    "services.prowlarr"                          = ./services/misc/servarr/prowlarr.nix;
    "services.psd"                               = ./services/desktops/profile-sync-daemon.nix;
    "services.public-inbox"                      = ./services/mail/public-inbox.nix;
    "services.pufferpanel"                       = ./services/misc/pufferpanel.nix;
    "services.pykms"                             = ./services/misc/pykms.nix;
    "services.pyroscope"                         = ./services/monitoring/pyroscope.nix;
    "services.qbittorrent"                       = ./services/torrent/qbittorrent.nix;
    "services.qdrant"                            = ./services/search/qdrant.nix;
    "services.quassel"                           = ./services/networking/quassel.nix;
    "services.qui"                               = ./services/torrent/qui.nix;
    "services.quicktun"                          = ./services/networking/quicktun.nix;
    "services.quickwit"                          = ./services/search/quickwit.nix;
    "services.r53-ddns"                          = ./services/networking/r53-ddns.nix;
    "services.rabbitmq"                          = ./services/amqp/rabbitmq.nix;
    "services.radarr"                            = ./services/misc/servarr/radarr.nix;
    "services.radicale"                          = ./services/networking/radicale.nix;
    "services.radicle"                           = ./services/misc/radicle.nix;
    "services.radicle.ci"                          = ./services/continuous-integration/radicle/ci-broker.nix;
    "services.radicle.ci.adapters"                 = ./services/continuous-integration/radicle/adapters/native.nix;
    "services.radvd"                             = ./services/networking/radvd.nix;
    "services.ratbagd"                           = ./services/hardware/ratbagd.nix;
    "services.rathole"                           = ./services/networking/rathole.nix;
    "services.rauc"                              = ./services/hardware/rauc.nix;
    "services.reaction"                          = ./services/security/reaction.nix;
    "services.readarr"                           = ./services/misc/servarr/readarr.nix;
    "services.readeck"                           = ./services/web-apps/readeck.nix;
    "services.realm"                             = ./services/networking/realm.nix;
    "services.realmd"                            = ./services/misc/realmd.nix;
    "services.rebuilderd"                        = ./services/misc/rebuilderd.nix;
    "services.recyclarr"                         = ./services/misc/recyclarr.nix;
    "services.redis"                             = ./services/databases/redis.nix;
    "services.redlib"                            = ./services/misc/redlib.nix;
    "services.redmine"                           = ./services/misc/redmine.nix;
    "services.redshift"                          = ./services/x11/redshift.nix;
    "services.redsocks"                          = ./services/networking/redsocks.nix;
    "services.remark42"                          = ./services/web-apps/remark42.nix;
    "services.renovate"                          = ./services/misc/renovate.nix;
    "services.reposilite"                        = ./services/web-apps/reposilite.nix;
    "services.resilio"                           = ./services/networking/resilio.nix;
    "services.restic"                            = ./services/backup/restic.nix;
    "services.rethinkdb"                         = ./services/databases/rethinkdb.nix;
    "services.riemann"                           = ./services/monitoring/riemann.nix;
    "services.riemann-dash"                      = ./services/monitoring/riemann-dash.nix;
    "services.riemann-tools"                     = ./services/monitoring/riemann-tools.nix;
    "services.rimgo"                             = ./services/web-apps/rimgo.nix;
    "services.ringboard"                         = ./services/misc/ringboard.nix;
    "services.rkvm"                              = ./services/misc/rkvm.nix;
    "services.rmfakecloud"                       = ./services/misc/rmfakecloud.nix;
    "services.robustirc-bridge"                  = ./services/networking/robustirc-bridge.nix;
    "services.roon-bridge"                       = ./services/audio/roon-bridge.nix;
    "services.roon-server"                       = ./services/audio/roon-server.nix;
    "services.rosenpass"                         = ./services/networking/rosenpass.nix;
    "services.roundcube"                         = ./services/mail/roundcube.nix;
    "services.routedns"                          = ./services/networking/routedns.nix;
    "services.routinator"                        = ./services/networking/routinator.nix;
    "services.rqbit"                             = ./services/torrent/rqbit.nix;
    "services.rshim"                             = ./services/misc/rshim.nix;
    "services.rspamd"                            = ./services/mail/rspamd.nix;
    "services.rspamd-trainer"                    = ./services/mail/rspamd-trainer.nix;
    "services.rss-bridge"                        = ./services/web-apps/rss-bridge.nix;
    "services.rss2email"                         = ./services/mail/rss2email.nix;
    "services.rsshub"                            = ./services/web-apps/rsshub.nix;
    "services.rstudio-server"                    = ./services/development/rstudio-server/default.nix;
    "services.rsync"                             = ./services/misc/rsync.nix;
    "services.rsyncd"                            = ./services/network-filesystems/rsyncd.nix;
    "services.rtorrent"                          = ./services/torrent/rtorrent.nix;
    "services.rumno"                             = ./services/misc/rumno.nix;
    "services.rustdesk-server"                   = ./services/monitoring/rustdesk-server.nix;
    "services.rustus"                            = ./services/web-servers/rustus.nix;
    "services.rutorrent"                         = ./services/web-apps/rutorrent.nix;
    "services.safeeyes"                          = ./services/misc/safeeyes.nix;
    "services.salt.master"                         = ./services/admin/salt/master.nix;
    "services.salt.minion"                         = ./services/admin/salt/minion.nix;
    "services.samba-wsdd"                        = ./services/network-filesystems/samba-wsdd.nix;
    "services.sanoid"                            = ./services/backup/sanoid.nix;
    "services.saslauthd"                         = ./services/system/saslauthd.nix;
    "services.saunafs"                           = ./services/network-filesystems/saunafs.nix;
    "services.scanservjs"                        = ./services/hardware/scanservjs.nix;
    "services.schleuder"                         = ./services/mail/schleuder.nix;
    "services.scion"                               = ./services/networking/scion/scion.nix;
    "services.scion.scion-control"                 = ./services/networking/scion/scion-control.nix;
    "services.scion.scion-daemon"                  = ./services/networking/scion/scion-daemon.nix;
    "services.scion.scion-dispatcher"              = ./services/networking/scion/scion-dispatcher.nix;
    "services.scion.scion-ip-gateway"              = ./services/networking/scion/scion-ip-gateway.nix;
    "services.scion.scion-router"                  = ./services/networking/scion/scion-router.nix;
    "services.scollector"                        = ./services/monitoring/scollector.nix;
    "services.scrutiny"                          = ./services/monitoring/scrutiny.nix;
    "services.scx"                               = ./services/scheduling/scx.nix;
    "services.sdrplayApi"                        = ./services/misc/sdrplay.nix;
    "services.searx"                             = ./services/networking/searx.nix;
    "services.seatd"                             = ./services/desktops/seatd.nix;
    "services.seerr"                             = ./services/misc/seerr.nix;
    "services.self-deploy"                       = ./services/system/self-deploy.nix;
    "services.selfoss"                           = ./services/web-apps/selfoss.nix;
    "services.send"                              = ./services/web-servers/send.nix;
    "services.serviio"                           = ./services/misc/serviio.nix;
    "services.sftpgo"                            = ./services/web-apps/sftpgo.nix;
    "services.shadowsocks"                       = ./services/networking/shadowsocks.nix;
    "services.shairport-sync"                    = ./services/networking/shairport-sync.nix;
    "services.sharkey"                           = ./services/web-apps/sharkey.nix;
    "services.shelfmark"                         = ./services/misc/shelfmark.nix;
    "services.shellhub-agent"                    = ./services/networking/shellhub-agent.nix;
    "services.shibboleth-sp"                     = ./services/security/shibboleth-sp.nix;
    "services.shiori"                            = ./services/web-apps/shiori.nix;
    "services.shoko"                             = ./services/misc/shoko.nix;
    "services.shorewall"                         = ./services/networking/shorewall.nix;
    "services.shorewall6"                        = ./services/networking/shorewall6.nix;
    "services.sickbeard"                         = ./services/misc/sickbeard.nix;
    "services.sillytavern"                       = ./services/web-apps/sillytavern.nix;
    "services.silverbullet"                      = ./services/web-apps/silverbullet.nix;
    "services.sing-box"                          = ./services/networking/sing-box.nix;
    "services.sitespeed-io"                      = ./services/networking/sitespeed-io.nix;
    "services.sks"                               = ./services/security/sks.nix;
    "services.skydns"                            = ./services/networking/skydns.nix;
    "services.slimserver"                        = ./services/audio/slimserver.nix;
    "services.slskd"                             = ./services/web-apps/slskd.nix;
    "services.slurm"                             = ./services/computing/slurm/slurm.nix;
    "services.smartd"                            = ./services/monitoring/smartd.nix;
    "services.smartdns"                          = ./services/networking/smartdns.nix;
    "services.smokeping"                         = ./services/networking/smokeping.nix;
    "services.snapper"                           = ./services/misc/snapper.nix;
    "services.snapraid"                          = ./services/backup/snapraid.nix;
    "services.snapserver"                        = ./services/audio/snapserver.nix;
    "services.snipe-it"                          = ./services/web-apps/snipe-it.nix;
    "services.sniproxy"                          = ./services/networking/sniproxy.nix;
    "services.snips-sh"                          = ./services/web-apps/snips-sh.nix;
    "services.snmpd"                             = ./services/monitoring/snmpd.nix;
    "services.snowflake-proxy"                   = ./services/networking/snowflake-proxy.nix;
    "services.soft-serve"                        = ./services/misc/soft-serve.nix;
    "services.softether"                         = ./services/networking/softether.nix;
    "services.sogo"                              = ./services/web-apps/sogo.nix;
    "services.soju"                              = ./services/networking/soju.nix;
    "services.solanum"                           = ./services/networking/solanum.nix;
    "services.sonarr"                            = ./services/misc/servarr/sonarr.nix;
    "services.sonic-server"                      = ./services/search/sonic-server.nix;
    "services.spacecookie"                       = ./services/networking/spacecookie.nix;
    "services.spamassassin"                      = ./services/mail/spamassassin.nix;
    "services.spark"                             = ./services/cluster/spark/default.nix;
    "services.speechd"                           = ./services/accessibility/speechd.nix;
    "services.speedify"                          = ./services/networking/speedify.nix;
    "services.speedtest-tracker"                 = ./services/web-apps/speedtest-tracker.nix;
    "services.spice-autorandr"                   = ./services/misc/spice-autorandr.nix;
    "services.spice-webdavd"                     = ./services/misc/spice-webdavd.nix;
    "services.spiped"                            = ./services/networking/spiped.nix;
    "services.spire.agent"                         = ./services/security/spire/agent.nix;
    "services.spire.server"                        = ./services/security/spire/server.nix;
    "services.spoolman"                          = ./services/misc/spoolman.nix;
    "services.spotifyd"                          = ./services/audio/spotifyd.nix;
    "services.squeezelite"                       = ./services/audio/squeezelite.nix;
    "services.squid"                             = ./services/networking/squid.nix;
    "services.ssh-agent-switcher"                = ./services/security/ssh-agent-switcher.nix;
    "services.sshguard"                          = ./services/security/sshguard.nix;
    "services.sshwifty"                          = ./services/web-apps/sshwifty.nix;
    "services.sslh"                              = ./services/networking/sslh.nix;
    "services.sslmate-agent"                     = ./services/security/sslmate-agent.nix;
    "services.stalwart"                          = ./services/mail/stalwart.nix;
    "services.stargazer"                         = ./services/web-servers/stargazer.nix;
    "services.stash"                             = ./services/web-apps/stash.nix;
    "services.static-web-server"                 = ./services/web-servers/static-web-server.nix;
    "services.step-ca"                           = ./services/security/step-ca.nix;
    "services.stirling-pdf"                      = ./services/web-apps/stirling-pdf.nix;
    "services.strfry"                            = ./services/web-apps/strfry.nix;
    "services.strichliste"                       = ./services/web-apps/strichliste.nix;
    "services.stubby"                            = ./services/networking/stubby.nix;
    "services.stunnel"                           = ./services/networking/stunnel.nix;
    "services.subsonic"                          = ./services/misc/subsonic.nix;
    "services.sundtek"                           = ./services/misc/sundtek.nix;
    "services.sunshine"                          = ./services/networking/sunshine.nix;
    "services.supergfxd"                         = ./services/hardware/supergfxd.nix;
    "services.supybot"                           = ./services/networking/supybot.nix;
    "services.suricata"                          = ./services/networking/suricata/default.nix;
    "services.surrealdb"                         = ./services/databases/surrealdb.nix;
    "services.suwayomi-server"                   = ./services/web-apps/suwayomi-server.nix;
    "services.svnserve"                          = ./services/misc/svnserve.nix;
    "services.swapspace"                         = ./services/system/swapspace.nix;
    "services.sympa"                             = ./services/mail/sympa.nix;
    "services.synapse-auto-compressor"           = ./services/matrix/synapse-auto-compressor.nix;
    "services.syncoid"                           = ./services/backup/syncoid.nix;
    "services.syncplay"                          = ./services/networking/syncplay.nix;
    "services.syncthing"                         = ./services/networking/syncthing.nix;
    "services.synergy"                           = ./services/misc/synergy.nix;
    "services.sysstat"                           = ./services/monitoring/sysstat.nix;
    "services.system76-scheduler"                = ./services/desktops/system76-scheduler.nix;
    "services.systembus-notify"                  = ./services/system/systembus-notify.nix;
    "services.systemd-lock-handler"              = ./services/system/systemd-lock-handler.nix;
    "services.SystemdJournal2Gelf"               = ./services/logging/SystemdJournal2Gelf.nix;
    "services.szurubooru"                        = ./services/web-apps/szurubooru.nix;
    "services.tabby"                             = ./services/misc/tabby.nix;
    "services.tabbyapi"                          = ./services/web-apps/tabbyapi.nix;
    "services.tahoe"                             = ./services/network-filesystems/tahoe.nix;
    "services.tailscale"                           = ./services/networking/tailscale.nix;
    "services.tailscale.derper"                    = ./services/networking/tailscale-derper.nix;
    "services.tailscale.serve"                     = ./services/networking/tailscale-serve.nix;
    "services.taler"                               = ./services/finance/taler/module.nix;
    "services.taler.exchange"                      = ./services/finance/taler/exchange.nix;
    "services.taler.merchant"                      = ./services/finance/taler/merchant.nix;
    "services.tandoor-recipes"                   = ./services/misc/tandoor-recipes.nix;
    "services.tang"                              = ./services/security/tang.nix;
    "services.target"                            = ./services/networking/iscsi/target.nix;
    "services.tarsnap"                           = ./services/backup/tarsnap.nix;
    "services.taskchampion-sync-server"          = ./services/misc/taskchampion-sync-server.nix;
    "services.tautulli"                          = ./services/misc/tautulli.nix;
    "services.tayga"                             = ./services/networking/tayga.nix;
    "services.tcsd"                              = ./services/hardware/tcsd.nix;
    "services.teamspeak3"                        = ./services/networking/teamspeak3.nix;
    "services.teamviewer"                        = ./services/monitoring/teamviewer.nix;
    "services.technitium-dns-server"             = ./services/networking/technitium-dns-server.nix;
    "services.teeworlds"                         = ./services/games/teeworlds.nix;
    "services.telegraf"                          = ./services/monitoring/telegraf.nix;
    "services.teleport"                          = ./services/networking/teleport.nix;
    "services.tempo"                             = ./services/tracing/tempo.nix;
    "services.temporal"                          = ./services/cluster/temporal/default.nix;
    "services.terraria"                          = ./services/games/terraria.nix;
    "services.tetrd"                             = ./services/networking/tetrd.nix;
    "services.thanos"                            = ./services/monitoring/thanos.nix;
    "services.thelounge"                         = ./services/networking/thelounge.nix;
    "services.thermald"                          = ./services/hardware/thermald.nix;
    "services.thinkfan"                          = ./services/hardware/thinkfan.nix;
    "services.throttled"                         = ./services/hardware/throttled.nix;
    "services.tiddlywiki"                        = ./services/misc/tiddlywiki.nix;
    "services.tigerbeetle"                       = ./services/databases/tigerbeetle.nix;
    "services.tika"                              = ./services/search/tika.nix;
    "services.timekpr"                           = ./services/security/timekpr.nix;
    "services.tinc"                              = ./services/networking/tinc.nix;
    "services.tinyauth"                          = ./services/security/tinyauth.nix;
    "services.tinydns"                           = ./services/networking/tinydns.nix;
    "services.tinyproxy"                         = ./services/networking/tinyproxy.nix;
    "services.tlp"                               = ./services/hardware/tlp.nix;
    "services.tlsrpt"                            = ./services/mail/tlsrpt.nix;
    "services.tmate-ssh-server"                  = ./services/networking/tmate-ssh-server.nix;
    "services.todesk"                            = ./services/monitoring/todesk.nix;
    "services.tomcat"                            = ./services/web-servers/tomcat.nix;
    "services.tor"                               = ./services/security/tor.nix;
    "services.tor.torsocks"                        = ./services/security/torsocks.nix;
    "services.tor.tsocks"                          = ./services/security/torify.nix;
    "services.torque.mom"                          = ./services/computing/torque/mom.nix;
    "services.torque.server"                       = ./services/computing/torque/server.nix;
    "services.torrentstream"                     = ./services/torrent/torrentstream.nix;
    "services.tox-node"                          = ./services/networking/tox-node.nix;
    "services.toxBootstrapd"                     = ./services/networking/tox-bootstrapd.nix;
    "services.toxvpn"                            = ./services/networking/toxvpn.nix;
    "services.tp-auto-kbbl"                      = ./services/misc/tp-auto-kbbl.nix;
    "services.traefik"                           = ./services/web-servers/traefik.nix;
    "services.trafficserver"                     = ./services/web-servers/trafficserver/default.nix;
    "services.transmission"                      = ./services/torrent/transmission.nix;
    "services.tremor-rs"                         = ./services/monitoring/tremor-rs.nix;
    "services.trezord"                           = ./services/hardware/trezord.nix;
    "services.trickster"                         = ./services/networking/trickster.nix;
    "services.triggerhappy"                      = ./services/hardware/triggerhappy.nix;
    "services.trilium-server"                    = ./services/web-apps/trilium.nix;
    "services.tsidp"                             = ./services/security/tsidp.nix;
    "services.tsmBackup"                         = ./services/backup/tsm.nix;
    "services.tt-rss"                            = ./services/web-apps/tt-rss.nix;
    "services.tts"                               = ./services/audio/tts.nix;
    "services.ttyd"                              = ./services/web-servers/ttyd.nix;
    "services.tuliprox"                          = ./services/web-apps/tuliprox.nix;
    "services.tuned"                             = ./services/hardware/tuned.nix;
    "services.turborepo-remote-cache"            = ./services/development/turborepo-remote-cache.nix;
    "services.turn-rs"                           = ./services/misc/turn-rs.nix;
    "services.tusd"                              = ./services/web-servers/tusd.nix;
    "services.twingate"                          = ./services/networking/twingate.nix;
    "services.typesense"                         = ./services/search/typesense.nix;
    "services.tzupdate"                          = ./services/misc/tzupdate.nix;
    "services.u9fs"                              = ./services/network-filesystems/u9fs.nix;
    "services.udp-over-tcp"                      = ./services/networking/udp-over-tcp.nix;
    "services.ulogd"                             = ./services/logging/ulogd.nix;
    "services.umami"                             = ./services/web-apps/umami.nix;
    "services.umurmur"                           = ./services/networking/umurmur.nix;
    "services.unclutter"                         = ./services/x11/unclutter.nix;
    "services.unclutter-xfixes"                  = ./services/x11/unclutter-xfixes.nix;
    "services.undervolt"                         = ./services/hardware/undervolt.nix;
    "services.unifi"                             = ./services/networking/unifi.nix;
    "services.unit"                              = ./services/web-servers/unit/default.nix;
    "services.uptermd"                           = ./services/networking/uptermd.nix;
    "services.uptime-kuma"                       = ./services/monitoring/uptime-kuma.nix;
    "services.uptimed"                           = ./services/system/uptimed.nix;
    "services.urserver"                          = ./services/x11/urserver.nix;
    "services.urxvtd"                            = ./services/x11/urxvtd.nix;
    "services.usbguard"                          = ./services/security/usbguard.nix;
    "services.usbmuxd"                           = ./services/hardware/usbmuxd.nix;
    "services.usbrelayd"                         = ./services/hardware/usbrelayd.nix;
    "services.ustreamer"                         = ./services/video/ustreamer.nix;
    "services.uwsgi"                             = ./services/web-servers/uwsgi.nix;
    "services.v2raya"                            = ./services/networking/v2raya.nix;
    "services.v4l2-relayd"                       = ./services/video/v4l2-relayd.nix;
    "services.vault"                             = ./services/security/vault.nix;
    "services.vaultwarden"                       = ./services/security/vaultwarden/default.nix;
    "services.vdirsyncer"                        = ./services/networking/vdirsyncer.nix;
    "services.vdr"                               = ./services/hardware/vdr.nix;
    "services.vector"                            = ./services/logging/vector.nix;
    "services.veilid"                            = ./services/networking/veilid.nix;
    "services.victorialogs"                      = ./services/databases/victorialogs.nix;
    "services.victoriametrics"                   = ./services/databases/victoriametrics.nix;
    "services.victoriatraces"                    = ./services/databases/victoriatraces.nix;
    "services.vikunja"                           = ./services/web-apps/vikunja.nix;
    "services.vlagent"                           = ./services/monitoring/vlagent.nix;
    "services.vmagent"                           = ./services/monitoring/vmagent.nix;
    "services.vmalert"                           = ./services/monitoring/vmalert.nix;
    "services.vnstat"                            = ./services/monitoring/vnstat.nix;
    "services.vsftpd"                            = ./services/networking/vsftpd.nix;
    "services.vsmartcard-vpcd"                   = ./services/development/vsmartcard-vpcd.nix;
    "services.wakapi"                            = ./services/web-apps/wakapi.nix;
    "services.warpgate"                          = ./services/security/warpgate.nix;
    "services.wasabibackend"                     = ./services/networking/wasabibackend.nix;
    "services.wastebin"                          = ./services/misc/wastebin.nix;
    "services.webdav"                            = ./services/network-filesystems/webdav.nix;
    "services.webdav-server-rs"                  = ./services/network-filesystems/webdav-server-rs.nix;
    "services.webhook"                           = ./services/networking/webhook.nix;
    "services.weblate"                           = ./services/web-apps/weblate.nix;
    "services.websurfx"                          = ./services/web-apps/websurfx.nix;
    "services.weechat"                           = ./services/misc/weechat.nix;
    "services.wg-netmanager"                     = ./services/networking/wg-netmanager.nix;
    "services.wgautomesh"                        = ./services/networking/wgautomesh.nix;
    "services.whisparr"                          = ./services/misc/servarr/whisparr.nix;
    "services.whitebophir"                       = ./services/web-apps/whitebophir.nix;
    "services.whoami"                            = ./services/web-apps/whoami.nix;
    "services.whoogle-search"                    = ./services/networking/whoogle-search.nix;
    "services.wiki-js"                           = ./services/web-apps/wiki-js.nix;
    "services.windmill"                          = ./services/web-apps/windmill.nix;
    "services.wivrn"                             = ./services/video/wivrn.nix;
    "services.wlock"                             = ./services/desktops/wlock.nix;
    "services.woodpecker-agents"                 = ./services/continuous-integration/woodpecker/agents.nix;
    "services.woodpecker-server"                 = ./services/continuous-integration/woodpecker/server.nix;
    "services.wordpress"                         = ./services/web-apps/wordpress.nix;
    "services.workout-tracker"                   = ./services/misc/workout-tracker.nix;
    "services.writefreely"                       = ./services/web-apps/writefreely.nix;
    "services.wstunnel"                          = ./services/networking/wstunnel.nix;
    "services.wyoming.faster-whisper"              = ./services/home-automation/wyoming/faster-whisper.nix;
    "services.wyoming.openwakeword"                = ./services/home-automation/wyoming/openwakeword.nix;
    "services.wyoming.piper"                       = ./services/home-automation/wyoming/piper.nix;
    "services.wyoming.satellite"                   = ./services/home-automation/wyoming/satellite.nix;
    "services.x2goserver"                        = ./services/networking/x2goserver.nix;
    "services.xandikos"                          = ./services/networking/xandikos.nix;
    "services.xbanish"                           = ./services/x11/xbanish.nix;
    "services.xfs"                               = ./services/x11/xfs.nix;
    "services.xl2tpd"                            = ./services/networking/xl2tpd.nix;
    "services.xmrig"                             = ./services/misc/xmrig.nix;
    "services.xonotic"                           = ./services/games/xonotic.nix;
    "services.xrdp"                              = ./services/networking/xrdp.nix;
    "services.xserver.cmt"                         = ./services/x11/hardware/cmt.nix;
    "services.xserver.digimend"                    = ./services/x11/hardware/digimend.nix;
    "services.xserver.displayManager.startx"       = ./services/x11/display-managers/startx.nix;
    "services.xserver.displayManager.sx"           = ./services/x11/display-managers/sx.nix;
    "services.xserver.displayManager.xpra"         = ./services/x11/display-managers/xpra.nix;
    "services.xserver.imwheel"                     = ./services/x11/imwheel.nix;
    "services.xserver.synaptics"                   = ./services/x11/hardware/synaptics.nix;
    "services.xserver.wacom"                       = ./services/x11/hardware/wacom.nix;
    "services.xserver.windowManager.awesome"       = ./services/x11/window-managers/awesome.nix;
    "services.xserver.windowManager.bspwm"         = ./services/x11/window-managers/bspwm.nix;
    "services.xserver.windowManager.clfswm"        = ./services/x11/window-managers/clfswm.nix;
    "services.xserver.windowManager.fluxbox"       = ./services/x11/window-managers/fluxbox.nix;
    "services.xserver.windowManager.icewm"         = ./services/x11/window-managers/icewm.nix;
    "services.xserver.windowManager.katriawm"      = ./services/x11/window-managers/katriawm.nix;
    "services.xserver.windowManager.metacity"      = ./services/x11/window-managers/metacity.nix;
    "services.xserver.windowManager.nimdow"        = ./services/x11/window-managers/nimdow.nix;
    "services.xserver.windowManager.oxwm"          = ./services/x11/window-managers/oxwm.nix;
    "services.xserver.windowManager.twm"           = ./services/x11/window-managers/twm.nix;
    "services.xserver.windowManager.windowlab"     = ./services/x11/window-managers/windowlab.nix;
    "services.xserver.windowManager.wmii"          = ./services/x11/window-managers/wmii.nix;
    "services.xserver.windowManager.xmonad"        = ./services/x11/window-managers/xmonad.nix;
    "services.xserver.xautolock"                   = ./services/x11/xautolock.nix;
    "services.xtreemfs"                          = ./services/network-filesystems/xtreemfs.nix;
    "services.yandex-disk"                       = ./services/network-filesystems/yandex-disk.nix;
    "services.yarr"                              = ./services/misc/yarr.nix;
    "services.yggdrasil"                         = ./services/networking/yggdrasil.nix;
    "services.yggdrasil-jumper"                  = ./services/networking/yggdrasil-jumper.nix;
    "services.ympd"                              = ./services/audio/ympd.nix;
    "services.your_spotify"                      = ./services/web-apps/your_spotify.nix;
    "services.youtrack"                          = ./services/web-apps/youtrack.nix;
    "services.ytdl-sub"                          = ./services/misc/ytdl-sub.nix;
    "services.yubikey-agent"                     = ./services/security/yubikey-agent.nix;
    "services.zabbixAgent"                       = ./services/monitoring/zabbix-agent.nix;
    "services.zabbixProxy"                       = ./services/monitoring/zabbix-proxy.nix;
    "services.zabbixServer"                      = ./services/monitoring/zabbix-server.nix;
    "services.zabbixWeb"                         = ./services/web-apps/zabbix.nix;
    "services.zammad"                            = ./services/development/zammad.nix;
    "services.zapret"                            = ./services/networking/zapret.nix;
    "services.zenohd"                            = ./services/networking/zenohd.nix;
    "services.zerobin"                           = ./services/networking/zerobin.nix;
    "services.zeronet"                           = ./services/networking/zeronet.nix;
    "services.zeronsd"                           = ./services/networking/zeronsd.nix;
    "services.zerotierone"                       = ./services/networking/zerotierone.nix;
    "services.zeyple"                            = ./services/mail/zeyple.nix;
    "services.zigbee2mqtt"                       = ./services/home-automation/zigbee2mqtt.nix;
    "services.zipline"                           = ./services/web-apps/zipline.nix;
    "services.zitadel"                           = ./services/web-apps/zitadel.nix;
    "services.znapzend"                          = ./services/backup/znapzend.nix;
    "services.znc"                               = ./services/networking/znc/default.nix;
    "services.zoneminder"                        = ./services/misc/zoneminder.nix;
    "services.zookeeper"                         = ./services/misc/zookeeper.nix;
    "services.zrepl"                             = ./services/backup/zrepl.nix;
    "services.zwave-js"                          = ./services/home-automation/zwave-js.nix;
    "services.zwave-js-ui"                       = ./services/home-automation/zwave-js-ui.nix;
    "virtualisation.appvm"                        = ./virtualisation/appvm.nix;
    "virtualisation.cri-o"                        = ./virtualisation/cri-o.nix;
    "virtualisation.docker.rootless"               = ./virtualisation/docker-rootless.nix;
    "virtualisation.hypervGuest"                  = ./virtualisation/hyperv-guest.nix;
    "virtualisation.incus"                         = ./virtualisation/incus.nix;
    "virtualisation.incus.agent"                   = ./virtualisation/incus-agent.nix;
    "virtualisation.kvmgt"                        = ./virtualisation/kvmgt.nix;
    "virtualisation.lxc"                           = ./virtualisation/lxc.nix;
    "virtualisation.lxc.lxcfs"                     = ./virtualisation/lxcfs.nix;
    "virtualisation.oci-containers"               = ./virtualisation/oci-containers.nix;
    "virtualisation.rosetta"                      = ./virtualisation/rosetta.nix;
    "virtualisation.spiceUSBRedirection"          = ./virtualisation/spice-usb-redirection.nix;
    "virtualisation.virtualbox.guest"              = ./virtualisation/virtualbox-guest.nix;
    "virtualisation.virtualbox.host"               = ./virtualisation/virtualbox-host.nix;
    "virtualisation.vmware.guest"                  = ./virtualisation/vmware-guest.nix;
    "virtualisation.vmware.host"                   = ./virtualisation/vmware-host.nix;
    "virtualisation.waydroid"                     = ./virtualisation/waydroid.nix;
    "virtualisation.xen"                          = ./virtualisation/xen-dom0.nix;
    "xdg.portal.lxqt"                              = ./config/xdg/portals/lxqt.nix;
    "xdg.portal.wlr"                               = ./config/xdg/portals/wlr.nix;
  };
  core = [
  # keep-sorted start case=no numeric=yes
  ./config/appstream.nix
  ./config/console.nix
  ./config/debug-info.nix
  ./config/fanout.nix
  ./config/fonts/fontconfig.nix
  ./config/fonts/fontdir.nix
  ./config/fonts/ghostscript.nix
  ./config/fonts/packages.nix
  ./config/getaddrinfo.nix
  ./config/gtk/gtk-icon-cache.nix
  ./config/i18n.nix
  ./config/iproute2.nix
  ./config/ldap.nix
  ./config/ldso.nix
  ./config/locale.nix
  ./config/malloc.nix
  ./config/mysql.nix
  ./config/networking.nix
  ./config/nix-channel.nix
  ./config/nix-flakes.nix
  ./config/nix-remote-build.nix
  ./config/nix.nix
  ./config/nsswitch.nix
  ./config/power-management.nix
  ./config/qt.nix
  ./config/resolvconf.nix
  ./config/shells-environment.nix
  ./config/stevenblack.nix
  ./config/stub-ld.nix
  ./config/swap.nix
  ./config/sysctl.nix
  ./config/sysfs.nix
  ./config/system-environment.nix
  ./config/system-path.nix
  ./config/terminfo.nix
  ./config/unix-odbc-drivers.nix
  ./config/users-groups.nix
  ./config/vte.nix
  ./config/xdg/autostart.nix
  ./config/xdg/icons.nix
  ./config/xdg/menus.nix
  ./config/xdg/mime.nix
  ./config/xdg/portal.nix
  ./config/xdg/sounds.nix
  ./config/xdg/terminal-exec.nix
  ./config/zram.nix
  ./hardware/all-firmware.nix
  ./hardware/all-hardware.nix
  ./hardware/corectrl.nix
  ./hardware/cpu/amd-microcode.nix
  ./hardware/cpu/amd-ryzen-smu.nix
  ./hardware/cpu/amd-sev.nix
  ./hardware/cpu/intel-microcode.nix
  ./hardware/cpu/intel-npu.nix
  ./hardware/cpu/intel-sgx.nix
  ./hardware/device-tree.nix
  ./hardware/graphics.nix
  ./hardware/i2c.nix
  ./hardware/network/b43.nix
  ./hardware/network/eg25-manager.nix
  ./hardware/network/intel-2200bg.nix
  ./hardware/printers.nix
  ./hardware/rtl-sdr.nix
  ./hardware/tuxedo-drivers.nix
  ./hardware/video/displaylink.nix
  ./hardware/video/nvidia.nix
  ./hardware/video/switcheroo-control.nix
  ./hardware/video/uvcvideo/default.nix
  ./hardware/video/virtualbox.nix
  ./i18n/input-method/default.nix
  ./i18n/input-method/hime.nix
  ./i18n/input-method/nabi.nix
  ./image/images.nix
  ./installer/tools/tools.nix
  ./misc/assertions.nix
  ./misc/crashdump.nix
  ./misc/documentation.nix
  ./misc/documentation/modular-services.nix
  ./misc/extra-arguments.nix
  ./misc/ids.nix
  ./misc/label.nix
  ./misc/lib.nix
  ./misc/locate.nix
  ./misc/meta.nix
  ./misc/nixops-autoluks.nix
  ./misc/nixpkgs-flake.nix
  ./misc/nixpkgs.nix
  ./misc/passthru.nix
  ./misc/version.nix
  ./misc/wordlist.nix
  ./programs/bash/bash-completion.nix
  ./programs/bash/bash.nix
  ./programs/bash/blesh.nix
  ./programs/bash/ls-colors.nix
  ./programs/bash/undistract-me.nix
  ./programs/benchexec.nix
  ./programs/ccache.nix
  ./programs/clash-verge.nix
  ./programs/command-not-found/command-not-found.nix
  ./programs/cpu-energy-meter.nix
  ./programs/dsearch.nix
  ./programs/environment.nix
  ./programs/envision.nix
  ./programs/evince.nix
  ./programs/feedbackd.nix
  ./programs/foot
  ./programs/freetds.nix
  ./programs/fuse.nix
  ./programs/gamemode.nix
  ./programs/gdk-pixbuf.nix
  ./programs/ghidra.nix
  ./programs/git.nix
  ./programs/gnome-disks.nix
  ./programs/gnome-terminal.nix
  ./programs/gnupg.nix
  ./programs/i3lock.nix
  ./programs/java.nix
  ./programs/kde-pim.nix
  ./programs/kdeconnect.nix
  ./programs/kubeswitch.nix
  ./programs/less.nix
  ./programs/lix.nix
  ./programs/localsend.nix
  ./programs/mosh.nix
  ./programs/msmtp.nix
  ./programs/mtr.nix
  ./programs/nano.nix
  ./programs/nh.nix
  ./programs/nix-index.nix
  ./programs/nm-applet.nix
  ./programs/oblogout.nix
  ./programs/partition-manager.nix
  ./programs/qgroundcontrol.nix
  ./programs/qt5ct.nix
  ./programs/screen.nix
  ./programs/seahorse.nix
  ./programs/shadow.nix
  ./programs/sharing.nix
  ./programs/singularity.nix
  ./programs/ssh.nix
  ./programs/streamdeck-ui.nix
  ./programs/system-config-printer.nix
  ./programs/thunar.nix
  ./programs/wayland/dms-shell.nix
  ./programs/wayland/gtklock.nix
  ./programs/wayland/hyprland.nix
  ./programs/wayland/labwc.nix
  ./programs/wayland/niri.nix
  ./programs/wayland/waybar.nix
  ./programs/wayland/wayfire.nix
  ./programs/xfconf.nix
  ./programs/xwayland.nix
  ./programs/ydotool.nix
  ./programs/yubikey-touch-detector.nix
  ./programs/zoxide.nix
  ./rename.nix
  ./security/acme
  ./security/agnos.nix
  ./security/apparmor.nix
  ./security/audit.nix
  ./security/auditd.nix
  ./security/ca.nix
  ./security/chromium-suid-sandbox.nix
  ./security/default.nix
  ./security/dhparams.nix
  ./security/doas.nix
  ./security/duosec.nix
  ./security/google_oslogin.nix
  ./security/ipa.nix
  ./security/isolate.nix
  ./security/krb5
  ./security/lock-kernel-modules.nix
  ./security/misc.nix
  ./security/oath.nix
  ./security/pam.nix
  ./security/pam_mount.nix
  ./security/please.nix
  ./security/polkit.nix
  ./security/rtkit.nix
  ./security/run0.nix
  ./security/soteria.nix
  ./security/sudo-rs.nix
  ./security/sudo.nix
  ./security/systemd-confinement.nix
  ./security/tpm2.nix
  ./security/wrappers/default.nix
  ./services/accessibility/orca.nix
  ./services/audio/alsa.nix
  ./services/audio/goxlr-utility.nix
  ./services/audio/icecast.nix
  ./services/audio/jack.nix
  ./services/audio/liquidsoap.nix
  ./services/audio/pulseaudio.nix
  ./services/backup/restic-rest-server.nix
  ./services/backup/rsnapshot.nix
  ./services/backup/zfs-replication.nix
  ./services/cluster/rancher/default.nix
  ./services/continuous-integration/github-runners.nix
  ./services/continuous-integration/hercules-ci-agent/default.nix
  ./services/databases/etcd.nix
  ./services/desktops/accountsservice.nix
  ./services/desktops/blueman.nix
  ./services/desktops/dleyna.nix
  ./services/desktops/flatpak.nix
  ./services/desktops/gnome/at-spi2-core.nix
  ./services/desktops/gvfs.nix
  ./services/desktops/malcontent.nix
  ./services/desktops/pipewire/pipewire.nix
  ./services/desktops/pipewire/wireplumber.nix
  ./services/desktops/system-config-printer.nix
  ./services/desktops/telepathy.nix
  ./services/desktops/tumbler.nix
  ./services/desktops/zeitgeist.nix
  ./services/development/nixseparatedebuginfod2.nix
  ./services/display-managers/default.nix
  ./services/display-managers/generic.nix
  ./services/display-managers/greetd.nix
  ./services/games/quake3-server.nix
  ./services/hardware/actkbd.nix
  ./services/hardware/amdgpu.nix
  ./services/hardware/bluetooth.nix
  ./services/hardware/display.nix
  ./services/hardware/fancontrol.nix
  ./services/hardware/freefall.nix
  ./services/hardware/fwupd.nix
  ./services/hardware/lcd.nix
  ./services/hardware/nvidia-container-toolkit
  ./services/hardware/nvidia-optimus.nix
  ./services/hardware/pcscd.nix
  ./services/hardware/pid-fan-controller.nix
  ./services/hardware/power-profiles-daemon.nix
  ./services/hardware/rasdaemon.nix
  ./services/hardware/spacenavd.nix
  ./services/hardware/tuxedo-rs.nix
  ./services/hardware/udev.nix
  ./services/hardware/udisks2.nix
  ./services/hardware/upower.nix
  ./services/logging/klogd.nix
  ./services/logging/rsyslogd.nix
  ./services/logging/syslog-ng.nix
  ./services/logging/syslogd.nix
  ./services/mail/dkimproxy-out.nix
  ./services/mail/mail.nix
  ./services/mail/mailhog.nix
  ./services/mail/pfix-srsd.nix
  ./services/mail/postfix.nix
  ./services/misc/amazon-ssm-agent.nix
  ./services/misc/apache-kafka.nix
  ./services/misc/conman.nix
  ./services/misc/dictd.nix
  ./services/misc/disnix.nix
  ./services/misc/freeswitch.nix
  ./services/misc/fstrim.nix
  ./services/misc/gitolite.nix
  ./services/misc/gitweb.nix
  ./services/misc/graphical-desktop.nix
  ./services/misc/guix
  ./services/misc/klipper.nix
  ./services/misc/moonraker.nix
  ./services/misc/nix-gc.nix
  ./services/misc/nix-optimise.nix
  ./services/misc/nix-ssh-serve.nix
  ./services/misc/ntfy-sh.nix
  ./services/misc/octoprint.nix
  ./services/misc/packagekit.nix
  ./services/misc/spice-vdagentd.nix
  ./services/misc/sssd.nix
  ./services/misc/sysprof.nix
  ./services/misc/taskserver
  ./services/misc/tdarr
  ./services/misc/tee-supplicant
  ./services/misc/transfer-sh.nix
  ./services/misc/tuxclocker.nix
  ./services/misc/uhub.nix
  ./services/monitoring/alloy.nix
  ./services/monitoring/cadvisor.nix
  ./services/monitoring/collectd.nix
  ./services/monitoring/das_watchdog.nix
  ./services/monitoring/do-agent.nix
  ./services/monitoring/fluent-bit.nix
  ./services/monitoring/ocsinventory-agent.nix
  ./services/monitoring/traccar.nix
  ./services/monitoring/tuptime.nix
  ./services/monitoring/unpoller.nix
  ./services/monitoring/ups.nix
  ./services/monitoring/watchdogd.nix
  ./services/network-filesystems/ceph.nix
  ./services/network-filesystems/nfsd.nix
  ./services/network-filesystems/openafs/client.nix
  ./services/network-filesystems/openafs/server.nix
  ./services/network-filesystems/samba.nix
  ./services/networking/atalkd.nix
  ./services/networking/avahi-daemon.nix
  ./services/networking/birdwatcher.nix
  ./services/networking/blocky.nix
  ./services/networking/cgit.nix
  ./services/networking/clatd.nix
  ./services/networking/connman.nix
  ./services/networking/dhcpcd.nix
  ./services/networking/dnsmasq.nix
  ./services/networking/envoy.nix
  ./services/networking/firewall-firewalld.nix
  ./services/networking/firewall-iptables.nix
  ./services/networking/firewall-nftables.nix
  ./services/networking/firewall.nix
  ./services/networking/firewalld
  ./services/networking/ghostunnel.nix
  ./services/networking/gokapi.nix
  ./services/networking/hylafax/default.nix
  ./services/networking/ifstate.nix
  ./services/networking/iscsi/initiator.nix
  ./services/networking/iscsi/root-initiator.nix
  ./services/networking/jool.nix
  ./services/networking/lxd-image-server.nix
  ./services/networking/modemmanager.nix
  ./services/networking/mullvad-vpn.nix
  ./services/networking/multipath.nix
  ./services/networking/nat-iptables.nix
  ./services/networking/nat-nftables.nix
  ./services/networking/nat.nix
  ./services/networking/nebula.nix
  ./services/networking/netbird/server.nix
  ./services/networking/networkmanager.nix
  ./services/networking/nftables.nix
  ./services/networking/nghttpx/default.nix
  ./services/networking/nix-store-gcs-proxy.nix
  ./services/networking/nm-file-secret-agent.nix
  ./services/networking/ntp/openntpd.nix
  ./services/networking/oidentd.nix
  ./services/networking/openconnect.nix
  ./services/networking/rdnssd.nix
  ./services/networking/rpcbind.nix
  ./services/networking/rxe.nix
  ./services/networking/sabnzbd
  ./services/networking/ssh/sshd.nix
  ./services/networking/strongswan-swanctl/module.nix
  ./services/networking/strongswan.nix
  ./services/networking/supplicant.nix
  ./services/networking/syncthing-relay.nix
  ./services/networking/tailscale-auth.nix
  ./services/networking/tcpcrypt.nix
  ./services/networking/tftpd.nix
  ./services/networking/ucarp.nix
  ./services/networking/unbound.nix
  ./services/networking/v2ray.nix
  ./services/networking/vwifi.nix
  ./services/networking/wg-access-server.nix
  ./services/networking/wg-quick.nix
  ./services/networking/wireguard-networkd.nix
  ./services/networking/wireguard.nix
  ./services/networking/wpa_supplicant.nix
  ./services/networking/wvdial.nix
  ./services/networking/xinetd.nix
  ./services/networking/xray.nix
  ./services/printing/cups-pdf.nix
  ./services/printing/cupsd.nix
  ./services/scheduling/cron.nix
  ./services/security/cfssl.nix
  ./services/security/esdm.nix
  ./services/security/fprintd.nix
  ./services/security/hockeypuck.nix
  ./services/security/howdy
  ./services/security/infnoise.nix
  ./services/security/intune.nix
  ./services/security/kanidm.nix
  ./services/security/oauth2-proxy-nginx.nix
  ./services/security/paretosecurity.nix
  ./services/security/vault-agent.nix
  ./services/system/cachix-agent/default.nix
  ./services/system/cloud-init.nix
  ./services/system/dbus.nix
  ./services/system/kerberos/default.nix
  ./services/system/nix-daemon-firewall.nix
  ./services/system/nix-daemon.nix
  ./services/system/nscd.nix
  ./services/system/userborn.nix
  ./services/system/zram-generator.nix
  ./services/web-apps/artalk.nix
  ./services/web-apps/cook-cli.nix
  ./services/web-apps/fediwall.nix
  ./services/web-apps/goupile.nix
  ./services/web-apps/nextcloud-notify_push.nix
  ./services/web-apps/pgpkeyserver-lite.nix
  ./services/web-apps/porn-vault/default.nix
  ./services/web-apps/screego.nix
  ./services/web-servers/fcgiwrap.nix
  ./services/web-servers/keter
  ./services/web-servers/molly-brown.nix
  ./services/web-servers/phpfpm/default.nix
  ./services/web-servers/varnish/default.nix
  ./services/x11/colord.nix
  ./services/x11/desktop-managers/default.nix
  ./services/x11/display-managers/default.nix
  ./services/x11/display-managers/lightdm.nix
  ./services/x11/display-managers/slim.nix
  ./services/x11/extra-layouts.nix
  ./services/x11/touchegg.nix
  ./services/x11/window-managers/default.nix
  ./services/x11/window-managers/none.nix
  ./services/x11/xscreensaver.nix
  ./services/x11/xserver.nix
  ./system/activation/activatable-system.nix
  ./system/activation/activation-script.nix
  ./system/activation/bootspec.nix
  ./system/activation/nixos-init.nix
  ./system/activation/pre-switch-check.nix
  ./system/activation/specialisation.nix
  ./system/activation/switchable-system.nix
  ./system/activation/top-level.nix
  ./system/boot/binfmt.nix
  ./system/boot/clevis.nix
  ./system/boot/emergency-mode.nix
  ./system/boot/grow-partition.nix
  ./system/boot/initrd-network.nix
  ./system/boot/initrd-openvpn.nix
  ./system/boot/initrd-ssh.nix
  ./system/boot/kernel.nix
  ./system/boot/kexec.nix
  ./system/boot/loader/efi.nix
  ./system/boot/loader/external/external.nix
  ./system/boot/loader/generations-dir/generations-dir.nix
  ./system/boot/loader/generic-extlinux-compatible
  ./system/boot/loader/grub/grub.nix
  ./system/boot/loader/grub/ipxe.nix
  ./system/boot/loader/grub/memtest.nix
  ./system/boot/loader/init-script/init-script.nix
  ./system/boot/loader/limine/limine.nix
  ./system/boot/loader/loader.nix
  ./system/boot/loader/refind/refind.nix
  ./system/boot/loader/systemd-boot/systemd-boot.nix
  ./system/boot/luksroot.nix
  ./system/boot/modprobe.nix
  ./system/boot/networkd.nix
  ./system/boot/nix-store-veritysetup.nix
  ./system/boot/resolved.nix
  ./system/boot/shutdown.nix
  ./system/boot/stage-1.nix
  ./system/boot/stage-2.nix
  ./system/boot/stratisroot.nix
  ./system/boot/systemd.nix
  ./system/boot/systemd/coredump.nix
  ./system/boot/systemd/dm-verity.nix
  ./system/boot/systemd/fido2.nix
  ./system/boot/systemd/homed.nix
  ./system/boot/systemd/initrd-secrets.nix
  ./system/boot/systemd/initrd.nix
  ./system/boot/systemd/journald.nix
  ./system/boot/systemd/logind.nix
  ./system/boot/systemd/nspawn.nix
  ./system/boot/systemd/oomd.nix
  ./system/boot/systemd/repart.nix
  ./system/boot/systemd/shutdown.nix
  ./system/boot/systemd/sysupdate.nix
  ./system/boot/systemd/sysusers.nix
  ./system/boot/systemd/tmpfiles.nix
  ./system/boot/systemd/tpm2.nix
  ./system/boot/systemd/user.nix
  ./system/boot/systemd/userdbd.nix
  ./system/boot/timesyncd.nix
  ./system/boot/tmp.nix
  ./system/boot/uki.nix
  ./system/boot/unl0kr.nix
  ./system/boot/uvesafb.nix
  ./system/boot/zram-as-tmp.nix
  ./system/boot/zswap.nix
  ./system/etc/etc-activation.nix
  ./system/service/systemd/system.nix
  ./system/service/systemd/user.nix
  ./tasks/auto-upgrade.nix
  ./tasks/bcache.nix
  ./tasks/cpu-freq.nix
  ./tasks/encrypted-devices.nix
  ./tasks/filesystems.nix
  ./tasks/filesystems/apfs.nix
  ./tasks/filesystems/bcachefs.nix
  ./tasks/filesystems/bindfs.nix
  ./tasks/filesystems/btrfs.nix
  ./tasks/filesystems/cifs.nix
  ./tasks/filesystems/envfs.nix
  ./tasks/filesystems/erofs.nix
  ./tasks/filesystems/exfat.nix
  ./tasks/filesystems/ext.nix
  ./tasks/filesystems/f2fs.nix
  ./tasks/filesystems/jfs.nix
  ./tasks/filesystems/nfs.nix
  ./tasks/filesystems/ntfs.nix
  ./tasks/filesystems/overlayfs.nix
  ./tasks/filesystems/squashfs.nix
  ./tasks/filesystems/sshfs.nix
  ./tasks/filesystems/unionfs-fuse.nix
  ./tasks/filesystems/vboxsf.nix
  ./tasks/filesystems/vfat.nix
  ./tasks/filesystems/xfs.nix
  ./tasks/filesystems/zfs.nix
  ./tasks/lvm.nix
  ./tasks/network-interfaces-scripted.nix
  ./tasks/network-interfaces-systemd.nix
  ./tasks/network-interfaces.nix
  ./tasks/powertop.nix
  ./tasks/scsi-link-power-management.nix
  ./tasks/stratis.nix
  ./tasks/swraid.nix
  ./tasks/trackpoint.nix
  ./testing/service-runner.nix
  ./virtualisation/amazon-options.nix
  ./virtualisation/build-vm.nix
  ./virtualisation/container-config.nix
  ./virtualisation/containerd.nix
  ./virtualisation/containers.nix
  ./virtualisation/docker.nix
  ./virtualisation/ecs-agent.nix
  ./virtualisation/libvirtd.nix
  ./virtualisation/nixos-containers.nix
  ./virtualisation/oci-options.nix
  ./virtualisation/openstack-options.nix
  ./virtualisation/openvswitch.nix
  ./virtualisation/podman/default.nix
  ./virtualisation/qemu-guest-agent.nix
  ./virtualisation/waagent.nix
  ./virtualisation/xe-guest-utilities.nix
  # keep-sorted end
  {
    documentation.nixos.extraModules = [
      ./virtualisation/qemu-vm.nix
      ./image/repart.nix
    ];
  }
];
in
# Prototype exports the structured shape. byPrefix values may be a single
# path or a list (multi-module families). Consumers that still want the
# legacy flat list use `core ++ lib.flatten (builtins.attrValues byPrefix)`.
{ inherit core byPrefix; }
