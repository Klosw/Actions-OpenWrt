# 管理地址
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 固件架构
cat >> .config <<EOF
CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_DEVICE_hiwifi_c526a=y
EOF

cat >> .config<<EOF
CONFIG_IPV6=y
CONFIG_PACKAGE_ip6tables=y
CONFIG_PACKAGE_kmod_ip6tables=y
CONFIG_PACKAGE_kmod-ipt-nat6=y
CONFIG_PACKAGE_luci-proto-ipv6=y
CONFIG_PACKAGE_ip6tables-mod-nat=y
CONFIG_PACKAGE_iptables-mod-extra=y
CONFIG_PACKAGE_kmod-nf-ipt6=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_odhcpd-ipv6only=y
EOF

# 启用 IPV6 提示缺少nat然后没有网络
#cat >> .config <<EOF 
#CONFIG_IPV6=y
#CONFIG_PACKAGE_ip6tables=y
#CONFIG_PACKAGE_kmod_ip6tables=y
#CONFIG_PACKAGE_kmod-ipt-nat6=y
#CONFIG_PACKAGE_luci-proto-ipv6=y
#CONFIG_PACKAGE_ip6tables-mod-nat=y
#CONFIG_PACKAGE_kmod-nf-ipt6=y
#CONFIG_PACKAGE_odhcp6c=y
#CONFIG_PACKAGE_odhcpd-ipv6only=y
#EOF


#先去掉这些 添加这是会导致lan没有网络 不知道什么原因
#ip6tables-mod-nat
#CONFIG_KERNEL_IPV6=m
#CONFIG_KERNEL_IPV6_MULTIPLE_TABLES=m
#CONFIG_KERNEL_IPV6_SUBTREES=m
#CONFIG_KERNEL_IPV6_MROUTE=m
#CONFIG_PACKAGE_kmod-nf-ipt6=m
#CONFIG_BUSYBOX_DEFAULT_FEATURE_IPV6=m
#CONFIG_PACKAGE_luci-proto-ipv6=m
#CONFIG_PACKAGE_odhcpd-ipv6only=y
#CONFIG_PACKAGE_odhcp6c=m
#CONFIG_PACKAGE_kmod-ipt-nat6=m



# 取消默认启用的包
cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-ddns is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
# CONFIG_PACKAGE_luci-app-arpbind is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-wol is not set
# CONFIG_PACKAGE_luci-app-ramfree is not set
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-cpufreq is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
# CONFIG_PACKAGE_v2ray is not set
# CONFIG_PACKAGE_shadowsocks-libev-ss-redir is not set
# CONFIG_PACKAGE_shadowsocksr-libev-server is not set
# CONFIG_PACKAGE_ddns-scripts_aliyun is not set
# CONFIG_PACKAGE_ddns-scripts_dnspod is not set
EOF

# 其它默认的包 luci luci-app-upnp luci-app-nlbwmon luci-app-samba autosamba automount default-settings

# 基本软件:
cat >> .config <<EOF
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_autocore-arm=y
EOF

# FFmpeg
cat >> .config <<EOF
CONFIG_PACKAGE_libopus=y
CONFIG_PACKAGE_libx264=y
CONFIG_PACKAGE_ffmpeg=y
CONFIG_PACKAGE_ffprobe=y
EOF

cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-openclash=m
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-vlmcsd=m
CONFIG_PACKAGE_luci-app-qosv4=y
EOF
#编译一个ssr-plus版本
#CONFIG_PACKAGE_luci-app-vssr=y
#CONFIG_PACKAGE_luci-app-ssr-plus=y

cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-samba=m
CONFIG_PACKAGE_autosamba=m
EOF
# 常用软件 默认已启用
#cat >> .config <<EOF
#CONFIG_PACKAGE_luci=y
#CONFIG_PACKAGE_luci-app-upnp=y
#CONFIG_PACKAGE_luci-app-nlbwmon=y
#CONFIG_PACKAGE_luci-app-samba=y
#CONFIG_PACKAGE_autosamba=y
#CONFIG_PACKAGE_default-settings=y
#EOF

# 其它
sed -i '21d' package/lean/default-settings/files/zzz-default-settings #禁止网络共享分类到NAS
