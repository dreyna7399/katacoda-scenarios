
## Multilib is enabled by default in WrLinux

Multilib is enabled by default in WRLinux 10.18 for 64-bit bsps, including qemux86-64, qemuarm64, qemumips64 and other real bsps such as intel-x86-64 and intel-socfpga-64.

For 64-bit bsps, it sets proper multilib configure in bsp specified configure files(.inc or .conf). Take qemux86-64 as a example, it enables multilib in wrlinux/wrlinux-distro/conf/distro/include/wrlinux-bsp-qemux86-64.inc. 

      MULTILIBS ?= "multilib:lib32" 
      DEFAULTTUNE_virtclass-multilib-lib32 ?= "core2-32"

You can see this here:
<p>`cat layers/wrlinux/wrlinux-distro/conf/distro/include/wrlinux-bsp-qemux86-64.inc`{{execute}}

# Disabling Multilib Support

If you want to disable multilib's for a **specific** project,  reset MULTILIBS in your conf/local.conf.

      echo 'MULTILIBS = ""' >> conf/local.conf

If you want to diable multilib's for **all*** bsps in a common configure file wrlinux/wrlinux-distro/conf/distro/wrlinux-common.inc.

      # Multilib configuration
      MULTILIBS ?= ""
      require conf/multilib.conf


