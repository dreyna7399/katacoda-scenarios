
# Extend allarch packages

Because allarch packages only depend on non-multilib packages, if a multilib package depends on an allarch package, it may finally depend on a non-multilib package indirectly. That is not we expected and may cause runtime problems. The fix is to extend allarch packages to make them arch related when multilib is enabled. Then multilib packages only depend on multilib packages.

Take curl/lib32-curl as a example. Check the dependency digraph file recipe-depends.dot which is one of the outputs of 'bitbake -g', you'll find that curl depends on allarch ca-certificates and lib32-curl depends on lib32-ca-certificates. 

Set up your installation:
`./wrlinux-x/setup.sh --machine qemumips64 --all-layers --dl-layers`{{execute}}

Set up your shell environment:
`source oe-init-build-env`{{execute}}

Build the 'curl' package:
`bitbake -g curl`{{execute}}

Observe that 'curl' dependency: "curl" -> "ca-certificates":
$ grep '".*curl" -> ".*ca-certificates"' recipe-depends.dot 

