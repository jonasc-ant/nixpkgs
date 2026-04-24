let
  # p2-h12 prototype: write-triggered lazy module loading.
  # Modules listed here are NOT eagerly merged into the option tree;
  # lib/modules.nix tolerates definitions under these prefixes without
  # a matching declaration (instead of the usual checkUnmatched error).
  # The end-state replaces this hand-written map with a readDir over
  # nixos/modules/by-prefix/ — see backlog/p2-h12.
  byPrefix = {
    "programs.atop"                              = ./programs/atop.nix;
    "programs.atuin"                             = ./programs/atuin.nix;
    "programs.captive-browser"                   = ./programs/captive-browser.nix;
    "programs.chromium"                          = ./programs/chromium.nix;
    "programs.dconf"                             = ./programs/dconf.nix;
    "programs.direnv"                            = ./programs/direnv.nix;
    "programs.firefox"                           = ./programs/firefox.nix;
    "programs.neovim"                            = ./programs/neovim.nix;
    "programs.nix-required-mounts"               = ./programs/nix-required-mounts.nix;
    "programs.opengamepadui"                     = ./programs/opengamepadui.nix;
    "programs.pay-respects"                      = ./programs/pay-respects.nix;
    "programs.proxychains"                       = ./programs/proxychains.nix;
    "programs.regreet"                           = ./programs/regreet.nix;
    "programs.rust-motd"                         = ./programs/rust-motd.nix;
    "programs.starship"                          = ./programs/starship.nix;
    "programs.steam"                             = ./programs/steam.nix;
    "programs.sway"                              = ./programs/wayland/sway.nix;
    "programs.tmux"                              = ./programs/tmux.nix;
    "programs.uwsm"                              = ./programs/wayland/uwsm.nix;
    "services._3proxy"                           = ./services/networking/3proxy.nix;
    "services.acme-dns"                          = ./services/networking/acme-dns.nix;
    "services.acpid"                             = ./services/hardware/acpid.nix;
    "services.actual"                            = ./services/web-apps/actual.nix;
    "services.adguardhome"                       = ./services/networking/adguardhome.nix;
    "services.aesmd"                             = ./services/security/aesmd.nix;
    "services.agate"                             = ./services/web-servers/agate.nix;
    "services.agorakit"                          = ./services/web-apps/agorakit.nix;
    "services.airsonic"                          = ./services/misc/airsonic.nix;
    "services.akkoma"                            = ./services/web-apps/akkoma.nix;
    "services.alps"                              = ./services/web-apps/alps.nix;
    "services.amazon-cloudwatch-agent"           = ./services/monitoring/amazon-cloudwatch-agent.nix;
    "services.amule"                             = ./services/networking/amuled.nix;
    "services.ananicy"                           = ./services/misc/ananicy.nix;
    "services.angrr"                             = ./services/misc/angrr.nix;
    "services.anubis"                            = ./services/networking/anubis.nix;
    "services.anuko-time-tracker"                = ./services/web-apps/anuko-time-tracker.nix;
    "services.apcupsd"                           = ./services/monitoring/apcupsd.nix;
    "services.archisteamfarm"                    = ./services/games/archisteamfarm.nix;
    "services.aria2"                             = ./services/networking/aria2.nix;
    "services.armagetronad"                      = ./services/games/armagetronad.nix;
    "services.asterisk"                          = ./services/networking/asterisk.nix;
    "services.athens"                            = ./services/development/athens.nix;
    "services.atticd"                            = ./services/networking/atticd.nix;
    "services.atuin"                             = ./services/misc/atuin.nix;
    "services.authelia"                          = ./services/security/authelia.nix;
    "services.automysqlbackup"                   = ./services/backup/automysqlbackup.nix;
    "services.autorandr"                         = ./services/misc/autorandr.nix;
    "services.awstats"                           = ./services/logging/awstats.nix;
    "services.babeld"                            = ./services/networking/babeld.nix;
    "services.bacula-fd"                         = ./services/backup/bacula.nix;
    "services.bcg"                               = ./services/misc/bcg.nix;
    "services.bepasty"                           = ./services/misc/bepasty.nix;
    "services.biboumi"                           = ./services/networking/biboumi.nix;
    "services.bind"                              = ./services/networking/bind.nix;
    "services.bird-lg"                           = ./services/networking/bird-lg.nix;
    "services.bitcoind"                          = ./services/networking/bitcoind.nix;
    "services.bitlbee"                           = ./services/networking/bitlbee.nix;
    "services.bitmagnet"                         = ./services/torrent/bitmagnet.nix;
    "services.bitwarden-directory-connector-cli" = ./services/security/bitwarden-directory-connector-cli.nix;
    "services.bluemap"                           = ./services/web-apps/bluemap.nix;
    "services.bluesky-pds"                       = ./services/web-apps/bluesky-pds.nix;
    "services.bookstack"                         = ./services/web-apps/bookstack.nix;
    "services.borgbackup"                        = ./services/backup/borgbackup.nix;
    "services.borgmatic"                         = ./services/backup/borgmatic.nix;
    "services.bosun"                             = ./services/monitoring/bosun.nix;
    "services.broadcast-box"                     = ./services/video/broadcast-box.nix;
    "services.btrbk"                             = ./services/backup/btrbk.nix;
    "services.buildbot-master"                   = ./services/continuous-integration/buildbot/master.nix;
    "services.buildbot-worker"                   = ./services/continuous-integration/buildbot/worker.nix;
    "services.buildkite-agents"                  = ./services/continuous-integration/buildkite-agents.nix;
    "services.c2fmzq-server"                     = ./services/web-apps/c2fmzq-server.nix;
    "services.caddy"                             = ./services/web-servers/caddy/default.nix;
    "services.cage"                              = ./services/wayland/cage.nix;
    "services.calibre-server"                    = ./services/misc/calibre-server.nix;
    "services.calibre-web"                       = ./services/web-apps/calibre-web.nix;
    "services.canaille"                          = ./services/security/canaille.nix;
    "services.cassandra"                         = ./services/databases/cassandra.nix;
    "services.certmgr"                           = ./services/security/certmgr.nix;
    "services.certspotter"                       = ./services/monitoring/certspotter.nix;
    "services.cgminer"                           = ./services/misc/cgminer.nix;
    "services.changedetection-io"                = ./services/web-apps/changedetection-io.nix;
    "services.chhoto-url"                        = ./services/web-apps/chhoto-url.nix;
    "services.chrony"                            = ./services/networking/ntp/chrony.nix;
    "services.cjdns"                             = ./services/networking/cjdns.nix;
    "services.clamav"                            = ./services/security/clamav.nix;
    "services.clickhouse"                        = ./services/databases/clickhouse.nix;
    "services.clight"                            = ./services/x11/clight.nix;
    "services.cloudflared"                       = ./services/networking/cloudflared.nix;
    "services.cloudflare-ddns"                   = ./services/networking/cloudflare-ddns.nix;
    "services.cloudlog"                          = ./services/web-apps/cloudlog.nix;
    "services.cockpit"                           = ./services/monitoring/cockpit.nix;
    "services.cockroachdb"                       = ./services/databases/cockroachdb.nix;
    "services.cocoon"                            = ./services/web-apps/cocoon.nix;
    "services.coder"                             = ./services/web-apps/coder.nix;
    "services.code-server"                       = ./services/web-apps/code-server.nix;
    "services.collabora-online"                  = ./services/web-apps/collabora-online.nix;
    "services.consul"                            = ./services/networking/consul.nix;
    "services.coturn"                            = ./services/networking/coturn.nix;
    "services.couchdb"                           = ./services/databases/couchdb.nix;
    "services.crab-hole"                         = ./services/networking/crab-hole.nix;
    "services.crossfire-server"                  = ./services/games/crossfire-server.nix;
    "services.cross-seed"                        = ./services/torrent/cross-seed.nix;
    "services.crowdsec"                          = ./services/security/crowdsec.nix;
    "services.crowdsec-firewall-bouncer"         = ./services/security/crowdsec-firewall-bouncer.nix;
    "services.cryptpad"                          = ./services/web-apps/cryptpad.nix;
    "services.cyrus-imap"                        = ./services/mail/cyrus-imap.nix;
    "services.dashy"                             = ./services/web-apps/dashy.nix;
    "services.datadog-agent"                     = ./services/monitoring/datadog-agent.nix;
    "services.davfs2"                            = ./services/network-filesystems/davfs2.nix;
    "services.davis"                             = ./services/web-apps/davis.nix;
    "services.dawarich"                          = ./services/web-apps/dawarich.nix;
    "services.db-rest"                           = ./services/misc/db-rest.nix;
    "services.deluge"                            = ./services/torrent/deluge.nix;
    "services.dependency-track"                  = ./services/web-apps/dependency-track.nix;
    "services.dex"                               = ./services/web-apps/dex.nix;
    "services.dgraph"                            = ./services/databases/dgraph.nix;
    "services.diod"                              = ./services/network-filesystems/diod.nix;
    "services.discourse"                         = ./services/web-apps/discourse.nix;
    "services.distccd"                           = ./services/development/distccd.nix;
    "services.dnsdist"                           = ./services/networking/dnsdist.nix;
    "services.documize"                          = ./services/web-apps/documize.nix;
    "services.docuseal"                          = ./services/web-apps/docuseal.nix;
    "services.doh-server"                        = ./services/networking/doh-server.nix;
    "services.dokuwiki"                          = ./services/web-apps/dokuwiki.nix;
    "services.dolibarr"                          = ./services/web-apps/dolibarr.nix;
    "services.dovecot2"                          = ./services/mail/dovecot.nix;
    "services.dragonflydb"                       = ./services/databases/dragonflydb.nix;
    "services.drasl"                             = ./services/web-apps/drasl.nix;
    "services.draupnir"                          = ./services/matrix/draupnir.nix;
    "services.druid"                             = ./services/cluster/druid/default.nix;
    "services.drupal"                            = ./services/web-apps/drupal.nix;
    "services.dsnet"                             = ./services/networking/dsnet.nix;
    "services.dspam"                             = ./services/mail/dspam.nix;
    "services.duplicity"                         = ./services/backup/duplicity.nix;
    "services.earlyoom"                          = ./services/system/earlyoom.nix;
    "services.easytier"                          = ./services/networking/easytier.nix;
    "services.ebusd"                             = ./services/home-automation/ebusd.nix;
    "services.endlessh-go"                       = ./services/security/endlessh-go.nix;
    "services.engelsystem"                       = ./services/web-apps/engelsystem.nix;
    "services.ente"                              = ./services/web-apps/ente.nix;
    "services.epgstation"                        = ./services/video/epgstation/default.nix;
    "services.ergo"                              = ./services/networking/ergo.nix;
    "services.ergochat"                          = ./services/networking/ergochat.nix;
    "services.esphome"                           = ./services/home-automation/esphome.nix;
    "services.etebase-server"                    = ./services/misc/etebase-server.nix;
    "services.evremap"                           = ./services/misc/evremap.nix;
    "services.factorio"                          = ./services/games/factorio.nix;
    "services.fail2ban"                          = ./services/security/fail2ban.nix;
    "services.fastnetmon-advanced"               = ./services/networking/fastnetmon-advanced.nix;
    "services.fcron"                             = ./services/scheduling/fcron.nix;
    "services.fedimintd"                         = ./services/networking/fedimintd.nix;
    "services.filebeat"                          = ./services/logging/filebeat.nix;
    "services.filebrowser"                       = ./services/web-apps/filebrowser.nix;
    "services.firebird"                          = ./services/databases/firebird.nix;
    "services.firefly-iii"                       = ./services/web-apps/firefly-iii.nix;
    "services.firefly-iii-data-importer"         = ./services/web-apps/firefly-iii-data-importer.nix;
    "services.firefox-syncserver"                = ./services/networking/firefox-syncserver.nix;
    "services.flannel"                           = ./services/networking/flannel.nix;
    "services.flarum"                            = ./services/web-apps/flarum.nix;
    "services.forgejo"                           = ./services/misc/forgejo.nix;
    "services.foundationdb"                      = ./services/databases/foundationdb.nix;
    "services.freeciv"                           = ./services/games/freeciv.nix;
    "services.freshrss"                          = ./services/web-apps/freshrss.nix;
    "services.frigate"                           = ./services/video/frigate.nix;
    "services.froide-govplan"                    = ./services/web-apps/froide-govplan.nix;
    "services.frr"                               = ./services/networking/frr.nix;
    "services.galene"                            = ./services/web-apps/galene.nix;
    "services.gammu-smsd"                        = ./services/misc/gammu-smsd.nix;
    "services.gancio"                            = ./services/web-apps/gancio.nix;
    "services.garage"                            = ./services/web-servers/garage.nix;
    "services.geoclue2"                          = ./services/desktops/geoclue2.nix;
    "services.geoipupdate"                       = ./services/misc/geoipupdate.nix;
    "services.gerrit"                            = ./services/web-apps/gerrit.nix;
    "services.getty"                             = ./services/ttys/getty.nix;
    "services.gitea"                             = ./services/misc/gitea.nix;
    "services.gitea-actions-runner"              = ./services/continuous-integration/gitea-actions-runner.nix;
    "services.gitlab"                            = ./services/misc/gitlab.nix;
    "services.gitlab-runner"                     = ./services/continuous-integration/gitlab-runner/runner.nix;
    "services.glance"                            = ./services/web-apps/glance.nix;
    "services.glitchtip"                         = ./services/web-apps/glitchtip.nix;
    "services.glusterfs"                         = ./services/network-filesystems/glusterfs.nix;
    "services.gns3-server"                       = ./services/networking/gns3-server.nix;
    "services.gnunet"                            = ./services/networking/gnunet.nix;
    "services.gocd-agent"                        = ./services/continuous-integration/gocd-agent/default.nix;
    "services.gocd-server"                       = ./services/continuous-integration/gocd-server/default.nix;
    "services.gollum"                            = ./services/misc/gollum.nix;
    "services.gotenberg"                         = ./services/misc/gotenberg.nix;
    "services.gotosocial"                        = ./services/web-apps/gotosocial.nix;
    "services.gpsd"                              = ./services/misc/gpsd.nix;
    "services.grafana"                           = ./services/monitoring/grafana.nix;
    "services.grafana-image-renderer"            = ./services/monitoring/grafana-image-renderer.nix;
    "services.graphite"                          = ./services/monitoring/graphite.nix;
    "services.grav"                              = ./services/web-apps/grav.nix;
    "services.graylog"                           = ./services/logging/graylog.nix;
    "services.grocy"                             = ./services/web-apps/grocy.nix;
    "services.h2o"                               = ./services/web-servers/h2o/default.nix;
    "services.hadoop"                            = ./services/cluster/hadoop/default.nix;
    "services.hans"                              = ./services/networking/hans.nix;
    "services.harmonia"                          = ./services/networking/harmonia.nix;
    "services.headscale"                         = ./services/networking/headscale.nix;
    "services.healthchecks"                      = ./services/web-apps/healthchecks.nix;
    "services.hedgedoc"                          = ./services/web-apps/hedgedoc.nix;
    "services.heisenbridge"                      = ./services/misc/heisenbridge.nix;
    "services.hledger-web"                       = ./services/web-apps/hledger-web.nix;
    "services.home-assistant"                    = ./services/home-automation/home-assistant.nix;
    "services.homebox"                           = ./services/web-apps/homebox.nix;
    "services.homebridge"                        = ./services/home-automation/homebridge.nix;
    "services.homepage-dashboard"                = ./services/misc/homepage-dashboard.nix;
    "services.homer"                             = ./services/web-apps/homer.nix;
    "services.honk"                              = ./services/web-apps/honk.nix;
    "services.hostapd"                           = ./services/networking/hostapd.nix;
    "services.hqplayerd"                         = ./services/audio/hqplayerd.nix;
    "services.httpd"                             = ./services/web-servers/apache-httpd/default.nix;
    "services.https-dns-proxy"                   = ./services/networking/https-dns-proxy.nix;
    "services.hydra"                             = ./services/continuous-integration/hydra/default.nix;
    "services.i2pd"                              = ./services/networking/i2pd.nix;
    "services.immich"                            = ./services/web-apps/immich.nix;
    "services.inadyn"                            = ./services/networking/inadyn.nix;
    "services.infinoted"                         = ./services/editors/infinoted.nix;
    "services.influxdb2"                         = ./services/databases/influxdb2.nix;
    "services.invidious"                         = ./services/web-apps/invidious.nix;
    "services.invoiceplane"                      = ./services/web-apps/invoiceplane.nix;
    "services.iodine"                            = ./services/networking/iodine.nix;
    "services.ircdHybrid"                        = ./services/networking/ircd-hybrid/default.nix;
    "services.jellyfin"                          = ./services/misc/jellyfin.nix;
    "services.jibri"                             = ./services/networking/jibri/default.nix;
    "services.jicofo"                            = ./services/networking/jicofo.nix;
    "services.jigasi"                            = ./services/networking/jigasi.nix;
    "services.jirafeau"                          = ./services/web-apps/jirafeau.nix;
    "services.jitsi-meet"                        = ./services/web-apps/jitsi-meet.nix;
    "services.jitsi-videobridge"                 = ./services/networking/jitsi-videobridge.nix;
    "services.journalwatch"                      = ./services/logging/journalwatch.nix;
    "services.jupyter"                           = ./services/development/jupyter/default.nix;
    "services.jupyterhub"                        = ./services/development/jupyterhub/default.nix;
    "services.kanata"                            = ./services/hardware/kanata.nix;
    "services.kanboard"                          = ./services/web-apps/kanboard.nix;
    "services.kapacitor"                         = ./services/monitoring/kapacitor.nix;
    "services.karakeep"                          = ./services/web-apps/karakeep.nix;
    "services.kasmweb"                           = ./services/web-apps/kasmweb/default.nix;
    "services.kea"                               = ./services/networking/kea.nix;
    "services.keepalived"                        = ./services/networking/keepalived/default.nix;
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
    "services.kubo"                              = ./services/network-filesystems/kubo.nix;
    "services.lasuite-docs"                      = ./services/web-apps/lasuite-docs.nix;
    "services.lasuite-meet"                      = ./services/web-apps/lasuite-meet.nix;
    "services.lavalink"                          = ./services/audio/lavalink.nix;
    "services.legit"                             = ./services/networking/legit.nix;
    "services.lemmy"                             = ./services/web-apps/lemmy.nix;
    "services.libinput"                          = ./services/hardware/libinput.nix;
    "services.librechat"                         = ./services/web-apps/librechat.nix;
    "services.librenms"                          = ./services/monitoring/librenms.nix;
    "services.librespeed"                        = ./services/web-apps/librespeed.nix;
    "services.libreswan"                         = ./services/networking/libreswan.nix;
    "services.libretranslate"                    = ./services/web-apps/libretranslate.nix;
    "services.lifecycled"                        = ./services/misc/lifecycled.nix;
    "services.lighthouse"                        = ./services/blockchain/ethereum/lighthouse.nix;
    "services.limesurvey"                        = ./services/web-apps/limesurvey.nix;
    "services.linkding"                          = ./services/web-apps/linkding.nix;
    "services.linkwarden"                        = ./services/web-apps/linkwarden.nix;
    "services.listmonk"                          = ./services/mail/listmonk.nix;
    "services.litellm"                           = ./services/misc/litellm.nix;
    "services.llama-cpp"                         = ./services/misc/llama-cpp.nix;
    "services.llama-swap"                        = ./services/networking/llama-swap.nix;
    "services.lldap"                             = ./services/databases/lldap.nix;
    "services.logcheck"                          = ./services/logging/logcheck.nix;
    "services.logrotate"                         = ./services/logging/logrotate.nix;
    "services.logstash"                          = ./services/logging/logstash.nix;
    "services.loki"                              = ./services/monitoring/loki.nix;
    "services.lokinet"                           = ./services/networking/lokinet.nix;
    "services.longview"                          = ./services/monitoring/longview.nix;
    "services.maddy"                             = ./services/mail/maddy.nix;
    "services.magnetico"                         = ./services/torrent/magnetico.nix;
    "services.mailman"                           = ./services/mail/mailman.nix;
    "services.marytts"                           = ./services/audio/marytts.nix;
    "services.mastodon"                          = ./services/web-apps/mastodon.nix;
    "services.matomo"                            = ./services/web-apps/matomo.nix;
    "services.matrix-appservice-discord"         = ./services/matrix/appservice-discord.nix;
    "services.matrix-appservice-irc"             = ./services/matrix/appservice-irc.nix;
    "services.matrix-continuwuity"               = ./services/matrix/continuwuity.nix;
    "services.matrix-synapse"                    = ./services/matrix/synapse.nix;
    "services.matrix-tuwunel"                    = ./services/matrix/tuwunel.nix;
    "services.mattermost"                        = ./services/web-apps/mattermost.nix;
    "services.matter-server"                     = ./services/home-automation/matter-server.nix;
    "services.maubot"                            = ./services/matrix/maubot.nix;
    "services.mautrix-discord"                   = ./services/matrix/mautrix-discord.nix;
    "services.mautrix-meta"                      = ./services/matrix/mautrix-meta.nix;
    "services.mautrix-signal"                    = ./services/matrix/mautrix-signal.nix;
    "services.mautrix-telegram"                  = ./services/matrix/mautrix-telegram.nix;
    "services.mautrix-whatsapp"                  = ./services/matrix/mautrix-whatsapp.nix;
    "services.mchprs"                            = ./services/games/mchprs.nix;
    "services.mediagoblin"                       = ./services/web-apps/mediagoblin.nix;
    "services.mediatomb"                         = ./services/misc/mediatomb.nix;
    "services.mediawiki"                         = ./services/web-apps/mediawiki.nix;
    "services.memos"                             = ./services/misc/memos.nix;
    "services.metricbeat"                        = ./services/monitoring/metricbeat.nix;
    "services.microsocks"                        = ./services/networking/microsocks.nix;
    "services.minecraft-server"                  = ./services/games/minecraft-server.nix;
    "services.minetest-server"                   = ./services/games/minetest-server.nix;
    "services.miniflux"                          = ./services/web-apps/miniflux.nix;
    "services.minio"                             = ./services/web-servers/minio.nix;
    "services.mirakurun"                         = ./services/video/mirakurun.nix;
    "services.misskey"                           = ./services/web-apps/misskey.nix;
    "services.mjolnir"                           = ./services/matrix/mjolnir.nix;
    "services.mlmmj"                             = ./services/mail/mlmmj.nix;
    "services.mobilizon"                         = ./services/web-apps/mobilizon.nix;
    "services.monero"                            = ./services/networking/monero.nix;
    "services.monica"                            = ./services/web-apps/monica.nix;
    "services.moodle"                            = ./services/web-apps/moodle.nix;
    "services.moosefs"                           = ./services/network-filesystems/moosefs.nix;
    "services.mosquitto"                         = ./services/networking/mosquitto.nix;
    "services.movim"                             = ./services/web-apps/movim.nix;
    "services.mpd"                               = ./services/audio/mpd.nix;
    "services.mpdscribble"                       = ./services/audio/mpdscribble.nix;
    "services.mqtt2influxdb"                     = ./services/misc/mqtt2influxdb.nix;
    "services.mtr-exporter"                      = ./services/networking/mtr-exporter.nix;
    "services.munin-node"                        = ./services/monitoring/munin.nix;
    "services.murmur"                            = ./services/networking/murmur.nix;
    "services.music-assistant"                   = ./services/audio/music-assistant.nix;
    "services.mycelium"                          = ./services/networking/mycelium.nix;
    "services.mysql"                             = ./services/databases/mysql.nix;
    "services.mysqlBackup"                       = ./services/backup/mysql-backup.nix;
    "services.n8n"                               = ./services/misc/n8n.nix;
    "services.nagios"                            = ./services/monitoring/nagios.nix;
    "services.namecoind"                         = ./services/networking/namecoind.nix;
    "services.nats"                              = ./services/networking/nats.nix;
    "services.navidrome"                         = ./services/audio/navidrome.nix;
    "services.nbd"                               = ./services/networking/nbd.nix;
    "services.ncdns"                             = ./services/networking/ncdns.nix;
    "services.ncps"                              = ./services/networking/ncps.nix;
    "services.ndppd"                             = ./services/networking/ndppd.nix;
    "services.neo4j"                             = ./services/databases/neo4j.nix;
    "services.netbird"                           = ./services/networking/netbird.nix;
    "services.netbox"                            = ./services/web-apps/netbox.nix;
    "services.netdata"                           = ./services/monitoring/netdata.nix;
    "services.newt"                              = ./services/networking/newt.nix;
    "services.nextcloud"                         = ./services/web-apps/nextcloud.nix;
    "services.nextcloud-spreed-signaling"        = ./services/networking/nextcloud-spreed-signaling.nix;
    "services.nexus"                             = ./services/web-apps/nexus.nix;
    "services.nezha-agent"                       = ./services/monitoring/nezha-agent.nix;
    "services.nginx"                             = ./services/web-servers/nginx/default.nix;
    "services.nifi"                              = ./services/web-apps/nifi.nix;
    "services.nipap"                             = ./services/web-apps/nipap.nix;
    "services.nitter"                            = ./services/misc/nitter.nix;
    "services.nntp-proxy"                        = ./services/networking/nntp-proxy.nix;
    "services.nomad"                             = ./services/networking/nomad.nix;
    "services.nominatim"                         = ./services/search/nominatim.nix;
    "services.nsd"                               = ./services/networking/nsd.nix;
    "services.ntopng"                            = ./services/networking/ntopng.nix;
    "services.ntpd-rs"                           = ./services/networking/ntp/ntpd-rs.nix;
    "services.nullmailer"                        = ./services/mail/nullmailer.nix;
    "services.nvme-rs"                           = ./services/system/nvme-rs.nix;
    "services.oauth2-proxy"                      = ./services/security/oauth2-proxy.nix;
    "services.ocis"                              = ./services/web-apps/ocis.nix;
    "services.odoo"                              = ./services/finance/odoo.nix;
    "services.ollama"                            = ./services/misc/ollama.nix;
    "services.omnom"                             = ./services/misc/omnom.nix;
    "services.oncall"                            = ./services/web-apps/oncall.nix;
    "services.onlyoffice"                        = ./services/web-apps/onlyoffice.nix;
    "services.openbao"                           = ./services/security/openbao.nix;
    "services.opencloud"                         = ./services/web-apps/opencloud.nix;
    "services.opendkim"                          = ./services/mail/opendkim.nix;
    "services.openldap"                          = ./services/databases/openldap.nix;
    "services.opensearch"                        = ./services/search/opensearch.nix;
    "services.opensmtpd"                         = ./services/mail/opensmtpd.nix;
    "services.opensnitch"                        = ./services/security/opensnitch.nix;
    "services.openthread-border-router"          = ./services/home-automation/openthread-border-router.nix;
    "services.openvscode-server"                 = ./services/web-apps/openvscode-server.nix;
    "services.open-web-calendar"                 = ./services/web-apps/open-web-calendar.nix;
    "services.open-webui"                        = ./services/misc/open-webui.nix;
    "services.opkssh"                            = ./services/networking/opkssh/opkssh.nix;
    "services.outline"                           = ./services/web-apps/outline.nix;
    "services.oxidized"                          = ./services/admin/oxidized.nix;
    "services.pairdrop"                          = ./services/web-apps/pairdrop.nix;
    "services.pangolin"                          = ./services/networking/pangolin.nix;
    "services.paperless"                         = ./services/misc/paperless.nix;
    "services.parsedmarc"                        = ./services/monitoring/parsedmarc.nix;
    "services.part-db"                           = ./services/web-apps/part-db.nix;
    "services.patroni"                           = ./services/cluster/patroni/default.nix;
    "services.pdfding"                           = ./services/web-apps/pdfding.nix;
    "services.pdns-recursor"                     = ./services/networking/pdns-recursor.nix;
    "services.peering-manager"                   = ./services/web-apps/peering-manager.nix;
    "services.peertube"                          = ./services/web-apps/peertube.nix;
    "services.peertube-runner"                   = ./services/web-apps/peertube-runner.nix;
    "services.pgadmin"                           = ./services/admin/pgadmin.nix;
    "services.pgbackrest"                        = ./services/backup/pgbackrest.nix;
    "services.pgbouncer"                         = ./services/databases/pgbouncer.nix;
    "services.pghero"                            = ./services/misc/pghero.nix;
    "services.pgmanage"                          = ./services/databases/pgmanage.nix;
    "services.photoprism"                        = ./services/web-apps/photoprism.nix;
    "services.photoview"                         = ./services/web-apps/photoview.nix;
    "services.physlock"                          = ./services/security/physlock.nix;
    "services.picom"                             = ./services/x11/picom.nix;
    "services.pihole-ftl"                        = ./services/networking/pihole-ftl.nix;
    "services.pinchflat"                         = ./services/misc/pinchflat.nix;
    "services.pixelfed"                          = ./services/web-apps/pixelfed.nix;
    "services.pixiecore"                         = ./services/networking/pixiecore.nix;
    "services.plantuml-server"                   = ./services/web-apps/plantuml-server.nix;
    "services.plausible"                         = ./services/web-apps/plausible.nix;
    "services.plex"                              = ./services/misc/plex.nix;
    "services.pocket-id"                         = ./services/security/pocket-id.nix;
    "services.polaris"                           = ./services/misc/polaris.nix;
    "services.pomerium"                          = ./services/web-servers/pomerium.nix;
    "services.portunus"                          = ./services/misc/portunus.nix;
    "services.porxie"                            = ./services/networking/porxie.nix;
    "services.postfix-tlspol"                    = ./services/mail/postfix-tlspol.nix;
    "services.postgresql"                        = ./services/databases/postgresql.nix;
    "services.postgresqlBackup"                  = ./services/backup/postgresql-backup.nix;
    "services.postgresqlWalReceiver"             = ./services/backup/postgresql-wal-receiver.nix;
    "services.postgrest"                         = ./services/databases/postgrest.nix;
    "services.postgres-websockets"               = ./services/databases/postgres-websockets.nix;
    "services.postsrsd"                          = ./services/mail/postsrsd.nix;
    "services.powerdns-admin"                    = ./services/web-apps/powerdns-admin.nix;
    "services.pppd"                              = ./services/networking/pppd.nix;
    "services.prefect"                           = ./services/scheduling/prefect.nix;
    "services.pretalx"                           = ./services/web-apps/pretalx.nix;
    "services.pretix"                            = ./services/web-apps/pretix.nix;
    "services.privatebin"                        = ./services/web-apps/privatebin.nix;
    "services.privoxy"                           = ./services/networking/privoxy.nix;
    "services.prometheus"                        = ./services/monitoring/prometheus/default.nix;
    "services.prosody"                           = ./services/networking/prosody.nix;
    "services.public-inbox"                      = ./services/mail/public-inbox.nix;
    "services.pufferpanel"                       = ./services/misc/pufferpanel.nix;
    "services.qbittorrent"                       = ./services/torrent/qbittorrent.nix;
    "services.qui"                               = ./services/torrent/qui.nix;
    "services.quicktun"                          = ./services/networking/quicktun.nix;
    "services.quickwit"                          = ./services/search/quickwit.nix;
    "services.rabbitmq"                          = ./services/amqp/rabbitmq.nix;
    "services.radicale"                          = ./services/networking/radicale.nix;
    "services.radicle"                           = ./services/misc/radicle.nix;
    "services.rathole"                           = ./services/networking/rathole.nix;
    "services.rauc"                              = ./services/hardware/rauc.nix;
    "services.reaction"                          = ./services/security/reaction.nix;
    "services.recyclarr"                         = ./services/misc/recyclarr.nix;
    "services.redis"                             = ./services/databases/redis.nix;
    "services.redlib"                            = ./services/misc/redlib.nix;
    "services.redmine"                           = ./services/misc/redmine.nix;
    "services.redsocks"                          = ./services/networking/redsocks.nix;
    "services.renovate"                          = ./services/misc/renovate.nix;
    "services.reposilite"                        = ./services/web-apps/reposilite.nix;
    "services.resilio"                           = ./services/networking/resilio.nix;
    "services.restic"                            = ./services/backup/restic.nix;
    "services.rkvm"                              = ./services/misc/rkvm.nix;
    "services.rosenpass"                         = ./services/networking/rosenpass.nix;
    "services.roundcube"                         = ./services/mail/roundcube.nix;
    "services.routinator"                        = ./services/networking/routinator.nix;
    "services.rqbit"                             = ./services/torrent/rqbit.nix;
    "services.rspamd"                            = ./services/mail/rspamd.nix;
    "services.rss2email"                         = ./services/mail/rss2email.nix;
    "services.rss-bridge"                        = ./services/web-apps/rss-bridge.nix;
    "services.rsync"                             = ./services/misc/rsync.nix;
    "services.rtorrent"                          = ./services/torrent/rtorrent.nix;
    "services.rustdesk-server"                   = ./services/monitoring/rustdesk-server.nix;
    "services.rustus"                            = ./services/web-servers/rustus.nix;
    "services.rutorrent"                         = ./services/web-apps/rutorrent.nix;
    "services.sanoid"                            = ./services/backup/sanoid.nix;
    "services.saunafs"                           = ./services/network-filesystems/saunafs.nix;
    "services.scanservjs"                        = ./services/hardware/scanservjs.nix;
    "services.schleuder"                         = ./services/mail/schleuder.nix;
    "services.scrutiny"                          = ./services/monitoring/scrutiny.nix;
    "services.searx"                             = ./services/networking/searx.nix;
    "services.self-deploy"                       = ./services/system/self-deploy.nix;
    "services.selfoss"                           = ./services/web-apps/selfoss.nix;
    "services.send"                              = ./services/web-servers/send.nix;
    "services.sftpgo"                            = ./services/web-apps/sftpgo.nix;
    "services.shadowsocks"                       = ./services/networking/shadowsocks.nix;
    "services.shairport-sync"                    = ./services/networking/shairport-sync.nix;
    "services.sharkey"                           = ./services/web-apps/sharkey.nix;
    "services.shiori"                            = ./services/web-apps/shiori.nix;
    "services.sillytavern"                       = ./services/web-apps/sillytavern.nix;
    "services.slskd"                             = ./services/web-apps/slskd.nix;
    "services.slurm"                             = ./services/computing/slurm/slurm.nix;
    "services.smartd"                            = ./services/monitoring/smartd.nix;
    "services.smokeping"                         = ./services/networking/smokeping.nix;
    "services.snapper"                           = ./services/misc/snapper.nix;
    "services.snapraid"                          = ./services/backup/snapraid.nix;
    "services.snapserver"                        = ./services/audio/snapserver.nix;
    "services.snipe-it"                          = ./services/web-apps/snipe-it.nix;
    "services.snips-sh"                          = ./services/web-apps/snips-sh.nix;
    "services.softether"                         = ./services/networking/softether.nix;
    "services.sogo"                              = ./services/web-apps/sogo.nix;
    "services.soju"                              = ./services/networking/soju.nix;
    "services.spacecookie"                       = ./services/networking/spacecookie.nix;
    "services.spark"                             = ./services/cluster/spark/default.nix;
    "services.speedtest-tracker"                 = ./services/web-apps/speedtest-tracker.nix;
    "services.spiped"                            = ./services/networking/spiped.nix;
    "services.squid"                             = ./services/networking/squid.nix;
    "services.sshguard"                          = ./services/security/sshguard.nix;
    "services.sslh"                              = ./services/networking/sslh.nix;
    "services.stalwart"                          = ./services/mail/stalwart.nix;
    "services.stargazer"                         = ./services/web-servers/stargazer.nix;
    "services.stash"                             = ./services/web-apps/stash.nix;
    "services.strfry"                            = ./services/web-apps/strfry.nix;
    "services.strichliste"                       = ./services/web-apps/strichliste.nix;
    "services.stunnel"                           = ./services/networking/stunnel.nix;
    "services.subsonic"                          = ./services/misc/subsonic.nix;
    "services.sunshine"                          = ./services/networking/sunshine.nix;
    "services.supybot"                           = ./services/networking/supybot.nix;
    "services.suricata"                          = ./services/networking/suricata/default.nix;
    "services.suwayomi-server"                   = ./services/web-apps/suwayomi-server.nix;
    "services.sympa"                             = ./services/mail/sympa.nix;
    "services.synapse-auto-compressor"           = ./services/matrix/synapse-auto-compressor.nix;
    "services.syncoid"                           = ./services/backup/syncoid.nix;
    "services.syncplay"                          = ./services/networking/syncplay.nix;
    "services.syncthing"                         = ./services/networking/syncthing.nix;
    "services.synergy"                           = ./services/misc/synergy.nix;
    "services.system76-scheduler"                = ./services/desktops/system76-scheduler.nix;
    "services.szurubooru"                        = ./services/web-apps/szurubooru.nix;
    "services.tabby"                             = ./services/misc/tabby.nix;
    "services.tabbyapi"                          = ./services/web-apps/tabbyapi.nix;
    "services.tahoe"                             = ./services/network-filesystems/tahoe.nix;
    "services.tandoor-recipes"                   = ./services/misc/tandoor-recipes.nix;
    "services.tarsnap"                           = ./services/backup/tarsnap.nix;
    "services.tayga"                             = ./services/networking/tayga.nix;
    "services.tcsd"                              = ./services/hardware/tcsd.nix;
    "services.teamspeak3"                        = ./services/networking/teamspeak3.nix;
    "services.teeworlds"                         = ./services/games/teeworlds.nix;
    "services.terraria"                          = ./services/games/terraria.nix;
    "services.thanos"                            = ./services/monitoring/thanos.nix;
    "services.thinkfan"                          = ./services/hardware/thinkfan.nix;
    "services.tinc"                              = ./services/networking/tinc.nix;
    "services.tinyauth"                          = ./services/security/tinyauth.nix;
    "services.tlsrpt"                            = ./services/mail/tlsrpt.nix;
    "services.tomcat"                            = ./services/web-servers/tomcat.nix;
    "services.tor"                               = ./services/security/tor.nix;
    "services.trafficserver"                     = ./services/web-servers/trafficserver/default.nix;
    "services.transmission"                      = ./services/torrent/transmission.nix;
    "services.trilium-server"                    = ./services/web-apps/trilium.nix;
    "services.tsidp"                             = ./services/security/tsidp.nix;
    "services.tt-rss"                            = ./services/web-apps/tt-rss.nix;
    "services.tts"                               = ./services/audio/tts.nix;
    "services.ttyd"                              = ./services/web-servers/ttyd.nix;
    "services.tuliprox"                          = ./services/web-apps/tuliprox.nix;
    "services.tusd"                              = ./services/web-servers/tusd.nix;
    "services.udp-over-tcp"                      = ./services/networking/udp-over-tcp.nix;
    "services.umami"                             = ./services/web-apps/umami.nix;
    "services.umurmur"                           = ./services/networking/umurmur.nix;
    "services.undervolt"                         = ./services/hardware/undervolt.nix;
    "services.unifi"                             = ./services/networking/unifi.nix;
    "services.unit"                              = ./services/web-servers/unit/default.nix;
    "services.usbguard"                          = ./services/security/usbguard.nix;
    "services.v4l2-relayd"                       = ./services/video/v4l2-relayd.nix;
    "services.vault"                             = ./services/security/vault.nix;
    "services.vaultwarden"                       = ./services/security/vaultwarden/default.nix;
    "services.vdirsyncer"                        = ./services/networking/vdirsyncer.nix;
    "services.veilid"                            = ./services/networking/veilid.nix;
    "services.victorialogs"                      = ./services/databases/victorialogs.nix;
    "services.victoriametrics"                   = ./services/databases/victoriametrics.nix;
    "services.victoriatraces"                    = ./services/databases/victoriatraces.nix;
    "services.vmagent"                           = ./services/monitoring/vmagent.nix;
    "services.vmalert"                           = ./services/monitoring/vmalert.nix;
    "services.vsftpd"                            = ./services/networking/vsftpd.nix;
    "services.wakapi"                            = ./services/web-apps/wakapi.nix;
    "services.warpgate"                          = ./services/security/warpgate.nix;
    "services.wasabibackend"                     = ./services/networking/wasabibackend.nix;
    "services.wastebin"                          = ./services/misc/wastebin.nix;
    "services.webdav-server-rs"                  = ./services/network-filesystems/webdav-server-rs.nix;
    "services.webhook"                           = ./services/networking/webhook.nix;
    "services.weblate"                           = ./services/web-apps/weblate.nix;
    "services.wgautomesh"                        = ./services/networking/wgautomesh.nix;
    "services.wiki-js"                           = ./services/web-apps/wiki-js.nix;
    "services.windmill"                          = ./services/web-apps/windmill.nix;
    "services.wivrn"                             = ./services/video/wivrn.nix;
    "services.woodpecker-agents"                 = ./services/continuous-integration/woodpecker/agents.nix;
    "services.wordpress"                         = ./services/web-apps/wordpress.nix;
    "services.writefreely"                       = ./services/web-apps/writefreely.nix;
    "services.wstunnel"                          = ./services/networking/wstunnel.nix;
    "services.x2goserver"                        = ./services/networking/x2goserver.nix;
    "services.xonotic"                           = ./services/games/xonotic.nix;
    "services.xrdp"                              = ./services/networking/xrdp.nix;
    "services.xtreemfs"                          = ./services/network-filesystems/xtreemfs.nix;
    "services.yggdrasil"                         = ./services/networking/yggdrasil.nix;
    "services.yggdrasil-jumper"                  = ./services/networking/yggdrasil-jumper.nix;
    "services.your_spotify"                      = ./services/web-apps/your_spotify.nix;
    "services.youtrack"                          = ./services/web-apps/youtrack.nix;
    "services.ytdl-sub"                          = ./services/misc/ytdl-sub.nix;
    "services.zabbixAgent"                       = ./services/monitoring/zabbix-agent.nix;
    "services.zabbixProxy"                       = ./services/monitoring/zabbix-proxy.nix;
    "services.zabbixServer"                      = ./services/monitoring/zabbix-server.nix;
    "services.zabbixWeb"                         = ./services/web-apps/zabbix.nix;
    "services.zammad"                            = ./services/development/zammad.nix;
    "services.zapret"                            = ./services/networking/zapret.nix;
    "services.zitadel"                           = ./services/web-apps/zitadel.nix;
    "services.znapzend"                          = ./services/backup/znapzend.nix;
    "services.znc"                               = ./services/networking/znc/default.nix;
    "services.zoneminder"                        = ./services/misc/zoneminder.nix;
    "services.zookeeper"                         = ./services/misc/zookeeper.nix;
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
  ./config/xdg/portals/lxqt.nix
  ./config/xdg/portals/wlr.nix
  ./config/xdg/sounds.nix
  ./config/xdg/terminal-exec.nix
  ./config/zram.nix
  ./hardware/acpilight.nix
  ./hardware/all-firmware.nix
  ./hardware/all-hardware.nix
  ./hardware/apple-touchbar.nix
  ./hardware/bladeRF.nix
  ./hardware/brillo.nix
  ./hardware/ckb-next.nix
  ./hardware/coral.nix
  ./hardware/corectrl.nix
  ./hardware/cpu/amd-microcode.nix
  ./hardware/cpu/amd-ryzen-smu.nix
  ./hardware/cpu/amd-sev.nix
  ./hardware/cpu/intel-microcode.nix
  ./hardware/cpu/intel-npu.nix
  ./hardware/cpu/intel-sgx.nix
  ./hardware/cpu/x86-msr.nix
  ./hardware/decklink.nix
  ./hardware/device-tree.nix
  ./hardware/digitalbitbox.nix
  ./hardware/facter
  ./hardware/flipperzero.nix
  ./hardware/flirc.nix
  ./hardware/fw-fanctrl.nix
  ./hardware/glasgow.nix
  ./hardware/gpgsmartcards.nix
  ./hardware/graphics.nix
  ./hardware/hackrf.nix
  ./hardware/hid-fanatecff.nix
  ./hardware/i2c.nix
  ./hardware/infiniband.nix
  ./hardware/inputmodule.nix
  ./hardware/iosched.nix
  ./hardware/keyboard/qmk.nix
  ./hardware/keyboard/teck.nix
  ./hardware/keyboard/uhk.nix
  ./hardware/keyboard/zsa.nix
  ./hardware/kryoflux.nix
  ./hardware/ksm.nix
  ./hardware/ledger.nix
  ./hardware/libftdi.nix
  ./hardware/libjaylink.nix
  ./hardware/logitech.nix
  ./hardware/mcelog.nix
  ./hardware/network/ath-user-regd.nix
  ./hardware/network/b43.nix
  ./hardware/network/eg25-manager.nix
  ./hardware/network/intel-2200bg.nix
  ./hardware/new-lg4ff.nix
  ./hardware/nfc-nci.nix
  ./hardware/nitrokey.nix
  ./hardware/onlykey/default.nix
  ./hardware/openrazer.nix
  ./hardware/opentabletdriver.nix
  ./hardware/pcmcia.nix
  ./hardware/printers.nix
  ./hardware/raid/hpsa.nix
  ./hardware/rtl-sdr.nix
  ./hardware/saleae-logic.nix
  ./hardware/sata.nix
  ./hardware/sensor/hddtemp.nix
  ./hardware/sensor/iio.nix
  ./hardware/sheep-net.nix
  ./hardware/steam-hardware.nix
  ./hardware/system-76.nix
  ./hardware/tenstorrent.nix
  ./hardware/tuxedo-drivers.nix
  ./hardware/ubertooth.nix
  ./hardware/uinput.nix
  ./hardware/uni-sync.nix
  ./hardware/usb-modeswitch.nix
  ./hardware/usb-storage.nix
  ./hardware/video/bumblebee.nix
  ./hardware/video/capture/mwprocapture.nix
  ./hardware/video/displaylink.nix
  ./hardware/video/intel-gpu-tools.nix
  ./hardware/video/nvidia.nix
  ./hardware/video/switcheroo-control.nix
  ./hardware/video/uvcvideo/default.nix
  ./hardware/video/virtualbox.nix
  ./hardware/video/webcam/facetimehd.nix
  ./hardware/video/webcam/ipu6.nix
  ./hardware/wooting.nix
  ./hardware/xone.nix
  ./hardware/xpad-noone.nix
  ./hardware/xpadneo.nix
  ./i18n/input-method/default.nix
  ./i18n/input-method/fcitx5.nix
  ./i18n/input-method/hime.nix
  ./i18n/input-method/ibus.nix
  ./i18n/input-method/kime.nix
  ./i18n/input-method/nabi.nix
  ./i18n/input-method/uim.nix
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
  ./misc/man-db.nix
  ./misc/mandoc.nix
  ./misc/meta.nix
  ./misc/nixops-autoluks.nix
  ./misc/nixpkgs-flake.nix
  ./misc/nixpkgs.nix
  ./misc/passthru.nix
  ./misc/version.nix
  ./misc/wordlist.nix
  ./programs/_1password-gui.nix
  ./programs/_1password.nix
  ./programs/alvr.nix
  ./programs/amnezia-vpn.nix
  ./programs/appgate-sdp.nix
  ./programs/appimage.nix
  ./programs/arp-scan.nix
  ./programs/ausweisapp.nix
  ./programs/autoenv.nix
  ./programs/autojump.nix
  ./programs/bandwhich.nix
  ./programs/bash-my-aws.nix
  ./programs/bash/bash-completion.nix
  ./programs/bash/bash.nix
  ./programs/bash/blesh.nix
  ./programs/bash/ls-colors.nix
  ./programs/bash/undistract-me.nix
  ./programs/bat.nix
  ./programs/bazecor.nix
  ./programs/bcc.nix
  ./programs/benchexec.nix
  ./programs/browserpass.nix
  ./programs/calls.nix
  ./programs/ccache.nix
  ./programs/cdemu.nix
  ./programs/cfs-zen-tweaks.nix
  ./programs/chrysalis.nix
  ./programs/clash-verge.nix
  ./programs/cnping.nix
  ./programs/command-not-found/command-not-found.nix
  ./programs/coolercontrol.nix
  ./programs/corefreq.nix
  ./programs/cpu-energy-meter.nix
  ./programs/criu.nix
  ./programs/digitalbitbox/default.nix
  ./programs/dmrconfig.nix
  ./programs/droidcam.nix
  ./programs/dsearch.nix
  ./programs/dublin-traceroute.nix
  ./programs/ente-auth.nix
  ./programs/environment.nix
  ./programs/envision.nix
  ./programs/evince.nix
  ./programs/extra-container.nix
  ./programs/fcast-receiver.nix
  ./programs/feedbackd.nix
  ./programs/firejail.nix
  ./programs/fish.nix
  ./programs/flashprog.nix
  ./programs/flashrom.nix
  ./programs/flexoptix-app.nix
  ./programs/foot
  ./programs/freetds.nix
  ./programs/fuse.nix
  ./programs/fzf.nix
  ./programs/gamemode.nix
  ./programs/gamescope.nix
  ./programs/gdk-pixbuf.nix
  ./programs/geary.nix
  ./programs/ghidra.nix
  ./programs/git-worktree-switcher.nix
  ./programs/git.nix
  ./programs/gnome-disks.nix
  ./programs/gnome-terminal.nix
  ./programs/gnupg.nix
  ./programs/gpaste.nix
  ./programs/gphoto2.nix
  ./programs/gpu-screen-recorder.nix
  ./programs/haguichi.nix
  ./programs/hamster.nix
  ./programs/htop.nix
  ./programs/i3lock.nix
  ./programs/iay.nix
  ./programs/idescriptor.nix
  ./programs/iftop.nix
  ./programs/iio-hyprland.nix
  ./programs/immersed.nix
  ./programs/iotop.nix
  ./programs/java.nix
  ./programs/joycond-cemuhook.nix
  ./programs/k3b.nix
  ./programs/k40-whisperer.nix
  ./programs/kbdlight.nix
  ./programs/kclock.nix
  ./programs/kde-pim.nix
  ./programs/kdeconnect.nix
  ./programs/kubeswitch.nix
  ./programs/ladybird.nix
  ./programs/lazygit.nix
  ./programs/less.nix
  ./programs/liboping.nix
  ./programs/librepods.nix
  ./programs/lix.nix
  ./programs/localsend.nix
  ./programs/mdevctl.nix
  ./programs/mepo.nix
  ./programs/mininet.nix
  ./programs/minipro.nix
  ./programs/miriway.nix
  ./programs/mosh.nix
  ./programs/mouse-actions.nix
  ./programs/msmtp.nix
  ./programs/mtr.nix
  ./programs/nano.nix
  ./programs/nautilus-open-any-terminal.nix
  ./programs/nbd.nix
  ./programs/nethoscope.nix
  ./programs/nexttrace.nix
  ./programs/nh.nix
  ./programs/nix-index.nix
  ./programs/nix-ld.nix
  ./programs/nixbit.nix
  ./programs/nm-applet.nix
  ./programs/nncp.nix
  ./programs/noisetorch.nix
  ./programs/npm.nix
  ./programs/ns-usbloader.nix
  ./programs/oblogout.nix
  ./programs/obs-studio.nix
  ./programs/oddjobd.nix
  ./programs/openvpn3.nix
  ./programs/partition-manager.nix
  ./programs/plotinus.nix
  ./programs/pmount.nix
  ./programs/pqos-wrapper.nix
  ./programs/projecteur.nix
  ./programs/pulseview.nix
  ./programs/qdmr.nix
  ./programs/qgroundcontrol.nix
  ./programs/qt5ct.nix
  ./programs/quark-goldleaf.nix
  ./programs/rog-control-center.nix
  ./programs/rush.nix
  ./programs/ryzen-monitor-ng.nix
  ./programs/schroot.nix
  ./programs/screen.nix
  ./programs/seahorse.nix
  ./programs/sedutil.nix
  ./programs/shadow.nix
  ./programs/sharing.nix
  ./programs/singularity.nix
  ./programs/skim.nix
  ./programs/slock.nix
  ./programs/sniffnet.nix
  ./programs/soundmodem.nix
  ./programs/ssh.nix
  ./programs/streamcontroller.nix
  ./programs/streamdeck-ui.nix
  ./programs/sysdig.nix
  ./programs/system-config-printer.nix
  ./programs/systemtap.nix
  ./programs/tcpdump.nix
  ./programs/television.nix
  ./programs/throne.nix
  ./programs/thunar.nix
  ./programs/thunderbird.nix
  ./programs/traceroute.nix
  ./programs/trippy.nix
  ./programs/tsm-client.nix
  ./programs/turbovnc.nix
  ./programs/udevil.nix
  ./programs/usbtop.nix
  ./programs/vim.nix
  ./programs/virt-manager.nix
  ./programs/vivid.nix
  ./programs/vscode.nix
  ./programs/wavemon.nix
  ./programs/wayland/dms-shell.nix
  ./programs/wayland/dwl.nix
  ./programs/wayland/gtklock.nix
  ./programs/wayland/hyprland.nix
  ./programs/wayland/hyprlock.nix
  ./programs/wayland/labwc.nix
  ./programs/wayland/mangowc.nix
  ./programs/wayland/miracle-wm.nix
  ./programs/wayland/niri.nix
  ./programs/wayland/river.nix
  ./programs/wayland/waybar.nix
  ./programs/wayland/wayfire.nix
  ./programs/wayland/wayvnc.nix
  ./programs/weylus.nix
  ./programs/whois.nix
  ./programs/winbox.nix
  ./programs/wireshark.nix
  ./programs/wshowkeys.nix
  ./programs/xastir.nix
  ./programs/xfconf.nix
  ./programs/xfs_quota.nix
  ./programs/xonsh.nix
  ./programs/xppen.nix
  ./programs/xscreensaver/sonar.nix
  ./programs/xscreensaver/xscreensaver.nix
  ./programs/xss-lock.nix
  ./programs/xwayland.nix
  ./programs/yazi.nix
  ./programs/ydotool.nix
  ./programs/yubikey-manager.nix
  ./programs/yubikey-touch-detector.nix
  ./programs/zmap.nix
  ./programs/zoom-us.nix
  ./programs/zoxide.nix
  ./programs/zsh/oh-my-zsh.nix
  ./programs/zsh/zsh-autoenv.nix
  ./programs/zsh/zsh-autosuggestions.nix
  ./programs/zsh/zsh-syntax-highlighting.nix
  ./programs/zsh/zsh.nix
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
  ./services/accessibility/speechd.nix
  ./services/admin/docuum.nix
  ./services/admin/meshcentral.nix
  ./services/admin/salt/master.nix
  ./services/admin/salt/minion.nix
  ./services/amqp/activemq/default.nix
  ./services/audio/alsa.nix
  ./services/audio/botamusique.nix
  ./services/audio/gmediarender.nix
  ./services/audio/gonic.nix
  ./services/audio/goxlr-utility.nix
  ./services/audio/icecast.nix
  ./services/audio/jack.nix
  ./services/audio/jmusicbot.nix
  ./services/audio/liquidsoap.nix
  ./services/audio/mopidy.nix
  ./services/audio/mympd.nix
  ./services/audio/networkaudiod.nix
  ./services/audio/pulseaudio.nix
  ./services/audio/roon-bridge.nix
  ./services/audio/roon-server.nix
  ./services/audio/slimserver.nix
  ./services/audio/spotifyd.nix
  ./services/audio/squeezelite.nix
  ./services/audio/ympd.nix
  ./services/autotierfs.nix
  ./services/backup/duplicati.nix
  ./services/backup/libvirtd-autosnapshot.nix
  ./services/backup/restic-rest-server.nix
  ./services/backup/rsnapshot.nix
  ./services/backup/tsm.nix
  ./services/backup/zfs-replication.nix
  ./services/backup/zrepl.nix
  ./services/blockchain/ethereum/erigon.nix
  ./services/blockchain/ethereum/geth.nix
  ./services/cluster/corosync/default.nix
  ./services/cluster/kubernetes/addon-manager.nix
  ./services/cluster/kubernetes/addons/dns.nix
  ./services/cluster/kubernetes/apiserver.nix
  ./services/cluster/kubernetes/controller-manager.nix
  ./services/cluster/kubernetes/default.nix
  ./services/cluster/kubernetes/flannel.nix
  ./services/cluster/kubernetes/kubelet.nix
  ./services/cluster/kubernetes/pki.nix
  ./services/cluster/kubernetes/proxy.nix
  ./services/cluster/kubernetes/scheduler.nix
  ./services/cluster/pacemaker/default.nix
  ./services/cluster/rancher/default.nix
  ./services/cluster/temporal/default.nix
  ./services/computing/boinc/client.nix
  ./services/computing/foldingathome/client.nix
  ./services/computing/torque/mom.nix
  ./services/computing/torque/server.nix
  ./services/continuous-integration/github-runners.nix
  ./services/continuous-integration/hercules-ci-agent/default.nix
  ./services/continuous-integration/jenkins/default.nix
  ./services/continuous-integration/jenkins/job-builder.nix
  ./services/continuous-integration/jenkins/slave.nix
  ./services/continuous-integration/radicle/adapters/native.nix
  ./services/continuous-integration/radicle/ci-broker.nix
  ./services/continuous-integration/woodpecker/server.nix
  ./services/databases/aerospike.nix
  ./services/databases/chromadb.nix
  ./services/databases/etcd.nix
  ./services/databases/ferretdb.nix
  ./services/databases/hbase-standalone.nix
  ./services/databases/influxdb.nix
  ./services/databases/memcached.nix
  ./services/databases/monetdb.nix
  ./services/databases/mongodb.nix
  ./services/databases/opentsdb.nix
  ./services/databases/rethinkdb.nix
  ./services/databases/surrealdb.nix
  ./services/databases/tigerbeetle.nix
  ./services/desktops/accountsservice.nix
  ./services/desktops/ayatana-indicators.nix
  ./services/desktops/bamf.nix
  ./services/desktops/blueman.nix
  ./services/desktops/bonsaid.nix
  ./services/desktops/cpupower-gui.nix
  ./services/desktops/crossmacro.nix
  ./services/desktops/dleyna.nix
  ./services/desktops/dunst.nix
  ./services/desktops/espanso.nix
  ./services/desktops/flatpak.nix
  ./services/desktops/gnome/at-spi2-core.nix
  ./services/desktops/gnome/evolution-data-server.nix
  ./services/desktops/gnome/gcr-ssh-agent.nix
  ./services/desktops/gnome/glib-networking.nix
  ./services/desktops/gnome/gnome-browser-connector.nix
  ./services/desktops/gnome/gnome-initial-setup.nix
  ./services/desktops/gnome/gnome-keyring.nix
  ./services/desktops/gnome/gnome-online-accounts.nix
  ./services/desktops/gnome/gnome-online-miners.nix
  ./services/desktops/gnome/gnome-remote-desktop.nix
  ./services/desktops/gnome/gnome-settings-daemon.nix
  ./services/desktops/gnome/gnome-software.nix
  ./services/desktops/gnome/gnome-user-share.nix
  ./services/desktops/gnome/localsearch.nix
  ./services/desktops/gnome/rygel.nix
  ./services/desktops/gnome/sushi.nix
  ./services/desktops/gnome/tinysparql.nix
  ./services/desktops/gvfs.nix
  ./services/desktops/linyaps.nix
  ./services/desktops/malcontent.nix
  ./services/desktops/neard.nix
  ./services/desktops/pipewire/pipewire.nix
  ./services/desktops/pipewire/wireplumber.nix
  ./services/desktops/playerctld.nix
  ./services/desktops/profile-sync-daemon.nix
  ./services/desktops/seatd.nix
  ./services/desktops/system-config-printer.nix
  ./services/desktops/telepathy.nix
  ./services/desktops/tumbler.nix
  ./services/desktops/wlock.nix
  ./services/desktops/zeitgeist.nix
  ./services/development/blackfire.nix
  ./services/development/bloop.nix
  ./services/development/corteza.nix
  ./services/development/gemstash.nix
  ./services/development/hoogle.nix
  ./services/development/labgrid/coordinator.nix
  ./services/development/livebook.nix
  ./services/development/lorri.nix
  ./services/development/nixseparatedebuginfod2.nix
  ./services/development/rstudio-server/default.nix
  ./services/development/turborepo-remote-cache.nix
  ./services/development/vsmartcard-vpcd.nix
  ./services/display-managers/cosmic-greeter.nix
  ./services/display-managers/default.nix
  ./services/display-managers/dms-greeter.nix
  ./services/display-managers/gdm.nix
  ./services/display-managers/generic.nix
  ./services/display-managers/greetd.nix
  ./services/display-managers/lemurs.nix
  ./services/display-managers/ly.nix
  ./services/display-managers/plasma-login-manager.nix
  ./services/display-managers/sddm.nix
  ./services/editors/emacs.nix
  ./services/editors/haste.nix
  ./services/finance/libeufin/bank.nix
  ./services/finance/libeufin/module.nix
  ./services/finance/libeufin/nexus.nix
  ./services/finance/taler/exchange.nix
  ./services/finance/taler/merchant.nix
  ./services/finance/taler/module.nix
  ./services/games/openarena.nix
  ./services/games/quake3-server.nix
  ./services/hardware/actkbd.nix
  ./services/hardware/amdgpu.nix
  ./services/hardware/argonone.nix
  ./services/hardware/arsenik.nix
  ./services/hardware/asusd.nix
  ./services/hardware/auto-cpufreq.nix
  ./services/hardware/auto-epp.nix
  ./services/hardware/bitbox-bridge.nix
  ./services/hardware/bluetooth.nix
  ./services/hardware/bolt.nix
  ./services/hardware/brltty.nix
  ./services/hardware/buffyboard.nix
  ./services/hardware/ddccontrol.nix
  ./services/hardware/deepcool-digital-linux.nix
  ./services/hardware/dell-bios-fan-control.nix
  ./services/hardware/display.nix
  ./services/hardware/fancontrol.nix
  ./services/hardware/freefall.nix
  ./services/hardware/fwupd.nix
  ./services/hardware/g810-led.nix
  ./services/hardware/handheld-daemon.nix
  ./services/hardware/hddfancontrol.nix
  ./services/hardware/illum.nix
  ./services/hardware/inputplumber.nix
  ./services/hardware/interception-tools.nix
  ./services/hardware/iptsd.nix
  ./services/hardware/irqbalance.nix
  ./services/hardware/joycond.nix
  ./services/hardware/lact.nix
  ./services/hardware/lcd.nix
  ./services/hardware/lirc.nix
  ./services/hardware/monado.nix
  ./services/hardware/nvidia-container-toolkit
  ./services/hardware/nvidia-optimus.nix
  ./services/hardware/openrgb.nix
  ./services/hardware/pcscd.nix
  ./services/hardware/pid-fan-controller.nix
  ./services/hardware/pommed.nix
  ./services/hardware/power-profiles-daemon.nix
  ./services/hardware/powerstation.nix
  ./services/hardware/rasdaemon.nix
  ./services/hardware/ratbagd.nix
  ./services/hardware/sane.nix
  ./services/hardware/sane_extra_backends/brscan4.nix
  ./services/hardware/sane_extra_backends/brscan5.nix
  ./services/hardware/sane_extra_backends/dsseries.nix
  ./services/hardware/spacenavd.nix
  ./services/hardware/supergfxd.nix
  ./services/hardware/thermald.nix
  ./services/hardware/throttled.nix
  ./services/hardware/tlp.nix
  ./services/hardware/trezord.nix
  ./services/hardware/triggerhappy.nix
  ./services/hardware/tuned.nix
  ./services/hardware/tuxedo-rs.nix
  ./services/hardware/udev.nix
  ./services/hardware/udisks2.nix
  ./services/hardware/upower.nix
  ./services/hardware/usbmuxd.nix
  ./services/hardware/usbrelayd.nix
  ./services/hardware/vdr.nix
  ./services/home-automation/deye-dummycloud.nix
  ./services/home-automation/evcc.nix
  ./services/home-automation/govee2mqtt.nix
  ./services/home-automation/wyoming/faster-whisper.nix
  ./services/home-automation/wyoming/openwakeword.nix
  ./services/home-automation/wyoming/piper.nix
  ./services/home-automation/wyoming/satellite.nix
  ./services/home-automation/zigbee2mqtt.nix
  ./services/home-automation/zwave-js-ui.nix
  ./services/home-automation/zwave-js.nix
  ./services/logging/fluentd.nix
  ./services/logging/heartbeat.nix
  ./services/logging/journalbeat.nix
  ./services/logging/journaldriver.nix
  ./services/logging/klogd.nix
  ./services/logging/rsyslogd.nix
  ./services/logging/syslog-ng.nix
  ./services/logging/syslogd.nix
  ./services/logging/SystemdJournal2Gelf.nix
  ./services/logging/ulogd.nix
  ./services/logging/vector.nix
  ./services/mail/automx2.nix
  ./services/mail/davmail.nix
  ./services/mail/dkimproxy-out.nix
  ./services/mail/exim.nix
  ./services/mail/goeland.nix
  ./services/mail/mail.nix
  ./services/mail/mailcatcher.nix
  ./services/mail/mailhog.nix
  ./services/mail/mailpit.nix
  ./services/mail/offlineimap.nix
  ./services/mail/pfix-srsd.nix
  ./services/mail/postfix.nix
  ./services/mail/postgrey.nix
  ./services/mail/protonmail-bridge.nix
  ./services/mail/rspamd-trainer.nix
  ./services/mail/spamassassin.nix
  ./services/mail/zeyple.nix
  ./services/matrix/conduit.nix
  ./services/matrix/dendrite.nix
  ./services/matrix/hebbot.nix
  ./services/matrix/hookshot.nix
  ./services/matrix/lk-jwt-service.nix
  ./services/matrix/matrix-alertmanager.nix
  ./services/matrix/pantalaimon.nix
  ./services/misc/amazon-ssm-agent.nix
  ./services/misc/anki-sync-server.nix
  ./services/misc/apache-kafka.nix
  ./services/misc/autobrr.nix
  ./services/misc/autofs.nix
  ./services/misc/autosuspend.nix
  ./services/misc/bazarr.nix
  ./services/misc/beanstalkd.nix
  ./services/misc/bees.nix
  ./services/misc/blenderfarm.nix
  ./services/misc/canto-daemon.nix
  ./services/misc/cfdyndns.nix
  ./services/misc/clipcat.nix
  ./services/misc/clipmenu.nix
  ./services/misc/confd.nix
  ./services/misc/conman.nix
  ./services/misc/cpuminer-cryptonight.nix
  ./services/misc/devmon.nix
  ./services/misc/devpi-server.nix
  ./services/misc/dictd.nix
  ./services/misc/disnix.nix
  ./services/misc/docker-registry.nix
  ./services/misc/docling-serve.nix
  ./services/misc/domoticz.nix
  ./services/misc/duckdns.nix
  ./services/misc/duckling.nix
  ./services/misc/dump1090-fa.nix
  ./services/misc/dwm-status.nix
  ./services/misc/dysnomia.nix
  ./services/misc/elephant.nix
  ./services/misc/errbot.nix
  ./services/misc/ersatztv.nix
  ./services/misc/etesync-dav.nix
  ./services/misc/evdevremapkeys.nix
  ./services/misc/felix.nix
  ./services/misc/flaresolverr.nix
  ./services/misc/freeswitch.nix
  ./services/misc/fstrim.nix
  ./services/misc/gitolite.nix
  ./services/misc/gitweb.nix
  ./services/misc/graphical-desktop.nix
  ./services/misc/greenclip.nix
  ./services/misc/guix
  ./services/misc/headphones.nix
  ./services/misc/hyprwhspr-rs.nix
  ./services/misc/ihaskell.nix
  ./services/misc/iio-niri.nix
  ./services/misc/input-remapper.nix
  ./services/misc/invidious-router.nix
  ./services/misc/irkerd.nix
  ./services/misc/jackett.nix
  ./services/misc/klipper.nix
  ./services/misc/languagetool.nix
  ./services/misc/leaps.nix
  ./services/misc/linux-enable-ir-emitter.nix
  ./services/misc/local-content-share.nix
  ./services/misc/logkeys.nix
  ./services/misc/mame.nix
  ./services/misc/mbpfan.nix
  ./services/misc/metabase.nix
  ./services/misc/mollysocket.nix
  ./services/misc/moonraker.nix
  ./services/misc/nix-gc.nix
  ./services/misc/nix-optimise.nix
  ./services/misc/nix-ssh-serve.nix
  ./services/misc/novacomd.nix
  ./services/misc/ntfy-sh.nix
  ./services/misc/nzbget.nix
  ./services/misc/nzbhydra2.nix
  ./services/misc/octoprint.nix
  ./services/misc/ombi.nix
  ./services/misc/orthanc.nix
  ./services/misc/osrm.nix
  ./services/misc/overseerr.nix
  ./services/misc/owncast.nix
  ./services/misc/packagekit.nix
  ./services/misc/paisa.nix
  ./services/misc/persistent-evdev.nix
  ./services/misc/pinnwand.nix
  ./services/misc/plikd.nix
  ./services/misc/podgrab.nix
  ./services/misc/pykms.nix
  ./services/misc/realmd.nix
  ./services/misc/rebuilderd.nix
  ./services/misc/ringboard.nix
  ./services/misc/rmfakecloud.nix
  ./services/misc/rshim.nix
  ./services/misc/rumno.nix
  ./services/misc/safeeyes.nix
  ./services/misc/sdrplay.nix
  ./services/misc/seerr.nix
  ./services/misc/servarr/lidarr.nix
  ./services/misc/servarr/prowlarr.nix
  ./services/misc/servarr/radarr.nix
  ./services/misc/servarr/readarr.nix
  ./services/misc/servarr/sonarr.nix
  ./services/misc/servarr/whisparr.nix
  ./services/misc/serviio.nix
  ./services/misc/shelfmark.nix
  ./services/misc/shoko.nix
  ./services/misc/sickbeard.nix
  ./services/misc/soft-serve.nix
  ./services/misc/spice-autorandr.nix
  ./services/misc/spice-vdagentd.nix
  ./services/misc/spice-webdavd.nix
  ./services/misc/spoolman.nix
  ./services/misc/sssd.nix
  ./services/misc/sundtek.nix
  ./services/misc/svnserve.nix
  ./services/misc/sysprof.nix
  ./services/misc/taskchampion-sync-server.nix
  ./services/misc/taskserver
  ./services/misc/tautulli.nix
  ./services/misc/tdarr
  ./services/misc/tee-supplicant
  ./services/misc/tiddlywiki.nix
  ./services/misc/tp-auto-kbbl.nix
  ./services/misc/transfer-sh.nix
  ./services/misc/turn-rs.nix
  ./services/misc/tuxclocker.nix
  ./services/misc/tzupdate.nix
  ./services/misc/uhub.nix
  ./services/misc/weechat.nix
  ./services/misc/workout-tracker.nix
  ./services/misc/xmrig.nix
  ./services/misc/yarr.nix
  ./services/monitoring/alerta.nix
  ./services/monitoring/alloy.nix
  ./services/monitoring/arbtt.nix
  ./services/monitoring/below.nix
  ./services/monitoring/beszel-agent.nix
  ./services/monitoring/beszel-hub.nix
  ./services/monitoring/cadvisor.nix
  ./services/monitoring/collectd.nix
  ./services/monitoring/das_watchdog.nix
  ./services/monitoring/do-agent.nix
  ./services/monitoring/fluent-bit.nix
  ./services/monitoring/fusion-inventory.nix
  ./services/monitoring/gatus.nix
  ./services/monitoring/gitwatch.nix
  ./services/monitoring/glances.nix
  ./services/monitoring/glpi-agent.nix
  ./services/monitoring/go-csp-collector.nix
  ./services/monitoring/goss.nix
  ./services/monitoring/grafana-reporter.nix
  ./services/monitoring/grafana-to-ntfy.nix
  ./services/monitoring/hdaps.nix
  ./services/monitoring/heapster.nix
  ./services/monitoring/incron.nix
  ./services/monitoring/karma.nix
  ./services/monitoring/mackerel-agent.nix
  ./services/monitoring/mimir.nix
  ./services/monitoring/monit.nix
  ./services/monitoring/ocsinventory-agent.nix
  ./services/monitoring/opentelemetry-collector.nix
  ./services/monitoring/osquery.nix
  ./services/monitoring/perses.nix
  ./services/monitoring/pgscv.nix
  ./services/monitoring/prometheus/alertmanager-gotify-bridge.nix
  ./services/monitoring/prometheus/alertmanager-irc-relay.nix
  ./services/monitoring/prometheus/alertmanager-ntfy.nix
  ./services/monitoring/prometheus/alertmanager-webhook-logger.nix
  ./services/monitoring/prometheus/alertmanager.nix
  ./services/monitoring/prometheus/exporters.nix
  ./services/monitoring/prometheus/pushgateway.nix
  ./services/monitoring/prometheus/sachet.nix
  ./services/monitoring/prometheus/xmpp-alerts.nix
  ./services/monitoring/pyroscope.nix
  ./services/monitoring/riemann-dash.nix
  ./services/monitoring/riemann-tools.nix
  ./services/monitoring/riemann.nix
  ./services/monitoring/scollector.nix
  ./services/monitoring/snmpd.nix
  ./services/monitoring/sysstat.nix
  ./services/monitoring/teamviewer.nix
  ./services/monitoring/telegraf.nix
  ./services/monitoring/todesk.nix
  ./services/monitoring/traccar.nix
  ./services/monitoring/tremor-rs.nix
  ./services/monitoring/tuptime.nix
  ./services/monitoring/unpoller.nix
  ./services/monitoring/ups.nix
  ./services/monitoring/uptime-kuma.nix
  ./services/monitoring/vlagent.nix
  ./services/monitoring/vnstat.nix
  ./services/monitoring/watchdogd.nix
  ./services/network-filesystems/a2boot.nix
  ./services/network-filesystems/cachefilesd.nix
  ./services/network-filesystems/ceph.nix
  ./services/network-filesystems/drbd.nix
  ./services/network-filesystems/ipfs-cluster.nix
  ./services/network-filesystems/kbfs.nix
  ./services/network-filesystems/litestream/default.nix
  ./services/network-filesystems/netatalk.nix
  ./services/network-filesystems/nfsd.nix
  ./services/network-filesystems/openafs/client.nix
  ./services/network-filesystems/openafs/server.nix
  ./services/network-filesystems/orangefs/client.nix
  ./services/network-filesystems/orangefs/server.nix
  ./services/network-filesystems/rsyncd.nix
  ./services/network-filesystems/samba-wsdd.nix
  ./services/network-filesystems/samba.nix
  ./services/network-filesystems/u9fs.nix
  ./services/network-filesystems/webdav.nix
  ./services/network-filesystems/yandex-disk.nix
  ./services/networking/alice-lg.nix
  ./services/networking/atalkd.nix
  ./services/networking/atftpd.nix
  ./services/networking/autossh-ng.nix
  ./services/networking/autossh.nix
  ./services/networking/avahi-daemon.nix
  ./services/networking/ax25/axlisten.nix
  ./services/networking/ax25/axports.nix
  ./services/networking/bee.nix
  ./services/networking/bird.nix
  ./services/networking/birdwatcher.nix
  ./services/networking/blockbook-frontend.nix
  ./services/networking/blocky.nix
  ./services/networking/byedpi.nix
  ./services/networking/cato-client.nix
  ./services/networking/centrifugo.nix
  ./services/networking/cgit.nix
  ./services/networking/chisel-server.nix
  ./services/networking/clatd.nix
  ./services/networking/cloudflare-dyndns.nix
  ./services/networking/cloudflare-warp.nix
  ./services/networking/cntlm.nix
  ./services/networking/connman.nix
  ./services/networking/coredns.nix
  ./services/networking/corerad.nix
  ./services/networking/create_ap.nix
  ./services/networking/croc.nix
  ./services/networking/dae.nix
  ./services/networking/dante.nix
  ./services/networking/ddclient.nix
  ./services/networking/ddns-updater.nix
  ./services/networking/deconz.nix
  ./services/networking/dhcpcd.nix
  ./services/networking/dnscache.nix
  ./services/networking/dnscrypt-proxy.nix
  ./services/networking/dnsmasq.nix
  ./services/networking/dnsproxy.nix
  ./services/networking/doh-proxy-rust.nix
  ./services/networking/ejabberd.nix
  ./services/networking/envoy.nix
  ./services/networking/epmd.nix
  ./services/networking/eternal-terminal.nix
  ./services/networking/expressvpn.nix
  ./services/networking/fakeroute.nix
  ./services/networking/ferm.nix
  ./services/networking/fireqos.nix
  ./services/networking/firewall-firewalld.nix
  ./services/networking/firewall-iptables.nix
  ./services/networking/firewall-nftables.nix
  ./services/networking/firewall.nix
  ./services/networking/firewalld
  ./services/networking/firezone/gateway.nix
  ./services/networking/firezone/gui-client.nix
  ./services/networking/firezone/headless-client.nix
  ./services/networking/firezone/relay.nix
  ./services/networking/firezone/server.nix
  ./services/networking/freenet.nix
  ./services/networking/freeradius.nix
  ./services/networking/frp.nix
  ./services/networking/g3proxy.nix
  ./services/networking/gdomap.nix
  ./services/networking/geph.nix
  ./services/networking/ghostunnel.nix
  ./services/networking/git-daemon.nix
  ./services/networking/globalprotect-vpn.nix
  ./services/networking/go-autoconfig.nix
  ./services/networking/go-camo.nix
  ./services/networking/go-neb.nix
  ./services/networking/go-shadowsocks2.nix
  ./services/networking/gobgpd.nix
  ./services/networking/godns.nix
  ./services/networking/gokapi.nix
  ./services/networking/gvpe.nix
  ./services/networking/haproxy.nix
  ./services/networking/hickory-dns.nix
  ./services/networking/htpdate.nix
  ./services/networking/hylafax/default.nix
  ./services/networking/i2p.nix
  ./services/networking/icecream/daemon.nix
  ./services/networking/icecream/scheduler.nix
  ./services/networking/ifstate.nix
  ./services/networking/imaginary.nix
  ./services/networking/inspircd.nix
  ./services/networking/iperf3.nix
  ./services/networking/iscsi/initiator.nix
  ./services/networking/iscsi/root-initiator.nix
  ./services/networking/iscsi/target.nix
  ./services/networking/ivpn.nix
  ./services/networking/iwd.nix
  ./services/networking/jool.nix
  ./services/networking/jotta-cli.nix
  ./services/networking/keybase.nix
  ./services/networking/lambdabot.nix
  ./services/networking/livekit-ingress.nix
  ./services/networking/livekit.nix
  ./services/networking/lldpd.nix
  ./services/networking/logmein-hamachi.nix
  ./services/networking/lxd-image-server.nix
  ./services/networking/magic-wormhole-mailbox-server.nix
  ./services/networking/matterbridge.nix
  ./services/networking/meshtasticd.nix
  ./services/networking/mihomo.nix
  ./services/networking/minidlna.nix
  ./services/networking/miniupnpd.nix
  ./services/networking/miredo.nix
  ./services/networking/mjpg-streamer.nix
  ./services/networking/mmsd.nix
  ./services/networking/modemmanager.nix
  ./services/networking/mozillavpn.nix
  ./services/networking/mptcpd.nix
  ./services/networking/mstpd.nix
  ./services/networking/mtprotoproxy.nix
  ./services/networking/mullvad-vpn.nix
  ./services/networking/multipath.nix
  ./services/networking/nar-serve.nix
  ./services/networking/nat-iptables.nix
  ./services/networking/nat-nftables.nix
  ./services/networking/nat.nix
  ./services/networking/nebula-lighthouse-service.nix
  ./services/networking/nebula.nix
  ./services/networking/netbird/server.nix
  ./services/networking/netclient.nix
  ./services/networking/networkd-dispatcher.nix
  ./services/networking/networkmanager.nix
  ./services/networking/nextdns.nix
  ./services/networking/nftables.nix
  ./services/networking/nghttpx/default.nix
  ./services/networking/ngircd.nix
  ./services/networking/nix-serve.nix
  ./services/networking/nix-store-gcs-proxy.nix
  ./services/networking/nixops-dns.nix
  ./services/networking/nm-file-secret-agent.nix
  ./services/networking/nncp.nix
  ./services/networking/ntp/ntpd.nix
  ./services/networking/ntp/openntpd.nix
  ./services/networking/nullidentdmod.nix
  ./services/networking/nylon.nix
  ./services/networking/ocserv.nix
  ./services/networking/ofono.nix
  ./services/networking/oidentd.nix
  ./services/networking/oink.nix
  ./services/networking/onedrive.nix
  ./services/networking/openconnect.nix
  ./services/networking/openvpn.nix
  ./services/networking/ostinato.nix
  ./services/networking/owamp.nix
  ./services/networking/pdnsd.nix
  ./services/networking/picosnitch.nix
  ./services/networking/pleroma.nix
  ./services/networking/powerdns.nix
  ./services/networking/pptpd.nix
  ./services/networking/quassel.nix
  ./services/networking/r53-ddns.nix
  ./services/networking/radvd.nix
  ./services/networking/rdnssd.nix
  ./services/networking/realm.nix
  ./services/networking/robustirc-bridge.nix
  ./services/networking/routedns.nix
  ./services/networking/rpcbind.nix
  ./services/networking/rxe.nix
  ./services/networking/sabnzbd
  ./services/networking/scion/scion-control.nix
  ./services/networking/scion/scion-daemon.nix
  ./services/networking/scion/scion-dispatcher.nix
  ./services/networking/scion/scion-ip-gateway.nix
  ./services/networking/scion/scion-router.nix
  ./services/networking/scion/scion.nix
  ./services/networking/shellhub-agent.nix
  ./services/networking/shorewall6.nix
  ./services/networking/shorewall.nix
  ./services/networking/sing-box.nix
  ./services/networking/sitespeed-io.nix
  ./services/networking/skydns.nix
  ./services/networking/smartdns.nix
  ./services/networking/sniproxy.nix
  ./services/networking/snowflake-proxy.nix
  ./services/networking/solanum.nix
  ./services/networking/speedify.nix
  ./services/networking/ssh/sshd.nix
  ./services/networking/strongswan-swanctl/module.nix
  ./services/networking/strongswan.nix
  ./services/networking/stubby.nix
  ./services/networking/supplicant.nix
  ./services/networking/syncthing-relay.nix
  ./services/networking/tailscale-auth.nix
  ./services/networking/tailscale-derper.nix
  ./services/networking/tailscale-serve.nix
  ./services/networking/tailscale.nix
  ./services/networking/tcpcrypt.nix
  ./services/networking/technitium-dns-server.nix
  ./services/networking/teleport.nix
  ./services/networking/tetrd.nix
  ./services/networking/tftpd.nix
  ./services/networking/thelounge.nix
  ./services/networking/tinydns.nix
  ./services/networking/tinyproxy.nix
  ./services/networking/tmate-ssh-server.nix
  ./services/networking/tox-bootstrapd.nix
  ./services/networking/tox-node.nix
  ./services/networking/toxvpn.nix
  ./services/networking/trickster.nix
  ./services/networking/twingate.nix
  ./services/networking/ucarp.nix
  ./services/networking/unbound.nix
  ./services/networking/uptermd.nix
  ./services/networking/v2ray.nix
  ./services/networking/v2raya.nix
  ./services/networking/vwifi.nix
  ./services/networking/websockify.nix
  ./services/networking/wg-access-server.nix
  ./services/networking/wg-netmanager.nix
  ./services/networking/wg-quick.nix
  ./services/networking/whoogle-search.nix
  ./services/networking/wireguard-networkd.nix
  ./services/networking/wireguard.nix
  ./services/networking/wpa_supplicant.nix
  ./services/networking/wvdial.nix
  ./services/networking/xandikos.nix
  ./services/networking/xinetd.nix
  ./services/networking/xl2tpd.nix
  ./services/networking/xray.nix
  ./services/networking/zenohd.nix
  ./services/networking/zerobin.nix
  ./services/networking/zeronet.nix
  ./services/networking/zeronsd.nix
  ./services/networking/zerotierone.nix
  ./services/printing/cups-pdf.nix
  ./services/printing/cupsd.nix
  ./services/printing/ipp-usb.nix
  ./services/scheduling/atd.nix
  ./services/scheduling/cron.nix
  ./services/scheduling/scx.nix
  ./services/search/elasticsearch-curator.nix
  ./services/search/elasticsearch.nix
  ./services/search/hound.nix
  ./services/search/manticore.nix
  ./services/search/meilisearch.nix
  ./services/search/qdrant.nix
  ./services/search/sonic-server.nix
  ./services/search/tika.nix
  ./services/search/typesense.nix
  ./services/security/cfssl.nix
  ./services/security/e-imzo.nix
  ./services/security/endlessh.nix
  ./services/security/esdm.nix
  ./services/security/fprintd.nix
  ./services/security/haveged.nix
  ./services/security/hockeypuck.nix
  ./services/security/hologram-agent.nix
  ./services/security/hologram-server.nix
  ./services/security/howdy
  ./services/security/infnoise.nix
  ./services/security/intune.nix
  ./services/security/jitterentropy-rngd.nix
  ./services/security/kanidm.nix
  ./services/security/munge.nix
  ./services/security/nginx-sso.nix
  ./services/security/oauth2-proxy-nginx.nix
  ./services/security/paretosecurity.nix
  ./services/security/pass-secret-service.nix
  ./services/security/shibboleth-sp.nix
  ./services/security/sks.nix
  ./services/security/spire/agent.nix
  ./services/security/spire/server.nix
  ./services/security/ssh-agent-switcher.nix
  ./services/security/sslmate-agent.nix
  ./services/security/step-ca.nix
  ./services/security/tang.nix
  ./services/security/timekpr.nix
  ./services/security/torify.nix
  ./services/security/torsocks.nix
  ./services/security/vault-agent.nix
  ./services/security/yubikey-agent.nix
  ./services/system/automatic-timezoned.nix
  ./services/system/bpftune.nix
  ./services/system/cachix-agent/default.nix
  ./services/system/cachix-watch-store.nix
  ./services/system/cloud-init.nix
  ./services/system/dbus.nix
  ./services/system/kerberos/default.nix
  ./services/system/localtimed.nix
  ./services/system/nix-daemon-firewall.nix
  ./services/system/nix-daemon.nix
  ./services/system/nohang.nix
  ./services/system/nscd.nix
  ./services/system/saslauthd.nix
  ./services/system/swapspace.nix
  ./services/system/systembus-notify.nix
  ./services/system/systemd-lock-handler.nix
  ./services/system/uptimed.nix
  ./services/system/userborn.nix
  ./services/system/zram-generator.nix
  ./services/torrent/flexget.nix
  ./services/torrent/flood.nix
  ./services/torrent/opentracker.nix
  ./services/torrent/peerflix.nix
  ./services/torrent/torrentstream.nix
  ./services/tracing/tempo.nix
  ./services/ttys/gpm.nix
  ./services/video/go2rtc/default.nix
  ./services/video/mediamtx.nix
  ./services/video/motioneye.nix
  ./services/video/photonvision.nix
  ./services/video/ustreamer.nix
  ./services/wayland/hypridle.nix
  ./services/web-apps/artalk.nix
  ./services/web-apps/audiobookshelf.nix
  ./services/web-apps/baikal.nix
  ./services/web-apps/bentopdf.nix
  ./services/web-apps/castopod.nix
  ./services/web-apps/commafeed.nix
  ./services/web-apps/convos.nix
  ./services/web-apps/cook-cli.nix
  ./services/web-apps/echoip.nix
  ./services/web-apps/fediwall.nix
  ./services/web-apps/fider.nix
  ./services/web-apps/fluidd.nix
  ./services/web-apps/go-httpbin.nix
  ./services/web-apps/goatcounter.nix
  ./services/web-apps/gotify-server.nix
  ./services/web-apps/goupile.nix
  ./services/web-apps/guacamole-client.nix
  ./services/web-apps/guacamole-server.nix
  ./services/web-apps/hatsu.nix
  ./services/web-apps/haven.nix
  ./services/web-apps/icingaweb2/icingaweb2.nix
  ./services/web-apps/icingaweb2/module-monitoring.nix
  ./services/web-apps/ifm.nix
  ./services/web-apps/immich-kiosk.nix
  ./services/web-apps/immich-public-proxy.nix
  ./services/web-apps/immichframe.nix
  ./services/web-apps/isso.nix
  ./services/web-apps/kavita.nix
  ./services/web-apps/lanraragi.nix
  ./services/web-apps/lauti.nix
  ./services/web-apps/lubelogger.nix
  ./services/web-apps/mainsail.nix
  ./services/web-apps/mealie.nix
  ./services/web-apps/meme-bingo-web.nix
  ./services/web-apps/microbin.nix
  ./services/web-apps/nextcloud-notify_push.nix
  ./services/web-apps/nextcloud-whiteboard-server.nix
  ./services/web-apps/nextjs-ollama-llm-ui.nix
  ./services/web-apps/node-red.nix
  ./services/web-apps/nostr-rs-relay.nix
  ./services/web-apps/olivetin.nix
  ./services/web-apps/openwebrx.nix
  ./services/web-apps/papra.nix
  ./services/web-apps/pgpkeyserver-lite.nix
  ./services/web-apps/phylactery.nix
  ./services/web-apps/pict-rs.nix
  ./services/web-apps/pihole-web.nix
  ./services/web-apps/porn-vault/default.nix
  ./services/web-apps/prosody-filer.nix
  ./services/web-apps/readeck.nix
  ./services/web-apps/remark42.nix
  ./services/web-apps/rimgo.nix
  ./services/web-apps/rsshub.nix
  ./services/web-apps/screego.nix
  ./services/web-apps/silverbullet.nix
  ./services/web-apps/sshwifty.nix
  ./services/web-apps/stirling-pdf.nix
  ./services/web-apps/vikunja.nix
  ./services/web-apps/websurfx.nix
  ./services/web-apps/whitebophir.nix
  ./services/web-apps/whoami.nix
  ./services/web-apps/zipline.nix
  ./services/web-servers/darkhttpd.nix
  ./services/web-servers/fcgiwrap.nix
  ./services/web-servers/hitch/default.nix
  ./services/web-servers/jboss/default.nix
  ./services/web-servers/keter
  ./services/web-servers/lighttpd/cgit.nix
  ./services/web-servers/lighttpd/collectd.nix
  ./services/web-servers/lighttpd/default.nix
  ./services/web-servers/lighttpd/gitweb.nix
  ./services/web-servers/merecat.nix
  ./services/web-servers/mighttpd2.nix
  ./services/web-servers/molly-brown.nix
  ./services/web-servers/nginx/gitweb.nix
  ./services/web-servers/nginx/tailscale-auth.nix
  ./services/web-servers/phpfpm/default.nix
  ./services/web-servers/static-web-server.nix
  ./services/web-servers/traefik.nix
  ./services/web-servers/uwsgi.nix
  ./services/web-servers/varnish/default.nix
  ./services/x11/colord.nix
  ./services/x11/desktop-managers/default.nix
  ./services/x11/display-managers/default.nix
  ./services/x11/display-managers/lightdm.nix
  ./services/x11/display-managers/slim.nix
  ./services/x11/display-managers/startx.nix
  ./services/x11/display-managers/sx.nix
  ./services/x11/display-managers/xpra.nix
  ./services/x11/extra-layouts.nix
  ./services/x11/fractalart.nix
  ./services/x11/hardware/cmt.nix
  ./services/x11/hardware/digimend.nix
  ./services/x11/hardware/synaptics.nix
  ./services/x11/hardware/wacom.nix
  ./services/x11/imwheel.nix
  ./services/x11/redshift.nix
  ./services/x11/touchegg.nix
  ./services/x11/unclutter-xfixes.nix
  ./services/x11/unclutter.nix
  ./services/x11/urserver.nix
  ./services/x11/urxvtd.nix
  ./services/x11/window-managers/awesome.nix
  ./services/x11/window-managers/bspwm.nix
  ./services/x11/window-managers/clfswm.nix
  ./services/x11/window-managers/default.nix
  ./services/x11/window-managers/fluxbox.nix
  ./services/x11/window-managers/icewm.nix
  ./services/x11/window-managers/katriawm.nix
  ./services/x11/window-managers/metacity.nix
  ./services/x11/window-managers/nimdow.nix
  ./services/x11/window-managers/none.nix
  ./services/x11/window-managers/oxwm.nix
  ./services/x11/window-managers/twm.nix
  ./services/x11/window-managers/windowlab.nix
  ./services/x11/window-managers/wmii.nix
  ./services/x11/window-managers/xmonad.nix
  ./services/x11/xautolock.nix
  ./services/x11/xbanish.nix
  ./services/x11/xfs.nix
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
  ./system/boot/plymouth-tpm2-totp.nix
  ./system/boot/plymouth.nix
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
  ./system/boot/systemd/journald-gateway.nix
  ./system/boot/systemd/journald-remote.nix
  ./system/boot/systemd/journald-upload.nix
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
  ./virtualisation/appvm.nix
  ./virtualisation/build-vm.nix
  ./virtualisation/container-config.nix
  ./virtualisation/containerd.nix
  ./virtualisation/containers.nix
  ./virtualisation/cri-o.nix
  ./virtualisation/docker-rootless.nix
  ./virtualisation/docker.nix
  ./virtualisation/ecs-agent.nix
  ./virtualisation/hyperv-guest.nix
  ./virtualisation/incus-agent.nix
  ./virtualisation/incus.nix
  ./virtualisation/kvmgt.nix
  ./virtualisation/libvirtd.nix
  ./virtualisation/lxc.nix
  ./virtualisation/lxcfs.nix
  ./virtualisation/nixos-containers.nix
  ./virtualisation/oci-containers.nix
  ./virtualisation/oci-options.nix
  ./virtualisation/openstack-options.nix
  ./virtualisation/openvswitch.nix
  ./virtualisation/parallels-guest.nix
  ./virtualisation/podman/default.nix
  ./virtualisation/qemu-guest-agent.nix
  ./virtualisation/rosetta.nix
  ./virtualisation/spice-usb-redirection.nix
  ./virtualisation/virtualbox-guest.nix
  ./virtualisation/virtualbox-host.nix
  ./virtualisation/vmware-guest.nix
  ./virtualisation/vmware-host.nix
  ./virtualisation/waagent.nix
  ./virtualisation/waydroid.nix
  ./virtualisation/xe-guest-utilities.nix
  ./virtualisation/xen-dom0.nix
  # keep-sorted end
  {
    documentation.nixos.extraModules = [
      ./virtualisation/qemu-vm.nix
      ./image/repart.nix
    ];
  }
];
in
# Prototype exports the structured shape. Consumers that still want the
# legacy flat list use `core ++ builtins.attrValues byPrefix`.
{ inherit core byPrefix; }
