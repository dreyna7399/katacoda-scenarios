
Note that the tasks populate_sdk and populate_sdk_ext are removed for multilib images by oe-core commit 77144bc. It says

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

