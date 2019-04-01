### Populating multilib images

<p>
Following steps help to build multilib image lib32-wrlinux-image-glibc-core and populate sdk. lib32-wrlinux-image-glibc-core is 32-bit userspace image and works with 64-bit linux kernel for 64-bit bsps. And the sdk provides both 32-bit and 64-bit build environment.
</p>

1. Setup project
<p>`./wrlinux-x/setup.sh --machines=qemux86-64 --dl-layers --accept-eula=yes`{{execute}}

2. Setup WR Linux buildtools environment
<p>`source  environment-setup-x86_64-wrlinuxsdk-linux`{{execute}}

3. Setup build environment
<p>`source  oe-init-build-env`{{execute}}

4. Let bitbake be able to access the network
<p>`echo 'BB_NO_NETWORK = "0"' >> conf/local.conf`{{execute}}

5. Build multilib image
<p>`bitbake lib32-wrlinux-image-glibc-core`{{execute}}

6. Populate the SDK
<p>`bitbake wrlinux-image-glibc-core -c populate_sdk`{{execute}}

7. Observe the created SDK
<p>`ls tmp-glibc/deploy/sdks`{{execute}}

