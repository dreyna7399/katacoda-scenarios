### Tasks populate_sdk and populate_sdk_ext are removed for multilib images

Tasks populate_sdk and populate_sdk_ext are removed for multilib images by oe-core commit 77144bc. It says

      The "bitbake image -cpopulate_sdk/ext" generates SDK/eSDK for all multilib
      variants, so "bitbake lib32-image -cpopulate_sdk/ext" is not needed

So when you run 'bitbake lib32-wrlinux-image-glibc-core -c populate_sdk', it fails:

`bitbake lib32-wrlinux-image-glibc-core -c populate_sdk`{{execute}}

      ERROR: Task do_populate_sdk does not exist for target lib32-wrlinux-image-glibc-core
      (virtual:multilib:lib32:/home/kkang/buildarea/WRLX-20181031/repo/layers/wrlinux/wrlinux-distro/recipes-base/images/wrlinux-image-glibc-core.bb:do_populate_sdk).
      Close matches:
         do_populate_lic
         do_populate_lic_deploy
      ERROR: Command execution failed: 1

<p>
Don't worry, running populate sdk/esdk with corresponding non-multilib image(wrlinux-image-glibc-core) works as you would intend in the above situation.
</p>

<p>
Following steps help to build multilib image lib32-wrlinux-image-glibc-core and populate sdk. lib32-wrlinux-image-glibc-core is 32-bit userspace image and works with 64-bit linux kernel for 64-bit bsps. And the sdk provides both 32-bit and 64-bit build environment.
</p>

Setup project
`./wrlinux-x/setup.sh --machines=qemux86-64 --dl-layers --accept-eula=yes`{{execute}}

Setup WR Linux buildtools environment
`source  environment-setup-x86_64-wrlinuxsdk-linux`{{execute}}

Setup build environment
`source  oe-init-build-env`{{execute}}

Build multilib image
`bitbake lib32-wrlinux-image-glibc-core`{{execute}}

Populate the SDK
`bitbake wrlinux-image-glibc-core -c populate_sdk`{{execute}}

