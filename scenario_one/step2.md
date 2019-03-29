
# Extend allarch packages

Because allarch packages only depend on non-multilib packages, if a multilib package depends on an allarch package, it may finally depend on a non-multilib package indirectly. That is not we expected and may cause runtime problems. The fix is to extend allarch packages to make them arch related when multilib is enabled. Then multilib packages only depend on multilib packages.

Take curl/lib32-curl as a example. Check the dependency digraph file recipe-depends.dot which is one of the outputs of 'bitbake -g', you'll find that curl depends on allarch ca-certificates and lib32-curl depends on lib32-ca-certificates. 

1. Set up your installation:
<p>`./wrlinux-x/setup.sh --machine qemumips64 --all-layers --dl-layers`{{execute}}

2. Setup WR Linux buildtools environment
<p>`source  environment-setup-x86_64-wrlinuxsdk-linux`{{execute}}

3. Setup build environment
<p>`source  oe-init-build-env`{{execute}}

4. Build the 'curl' package:
<p>`bitbake -g curl`{{execute}}

5. Observe the 'curl' dependency: "curl" -> "ca-certificates":
<p>`grep '".*curl" -> ".*ca-certificates"' recipe-depends.dot`{{execute}}

6. Return to the top directory when you are done:
<p>`cd ..`{{execute}}

