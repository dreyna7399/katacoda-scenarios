## Installed file conflicts

<p>
There is a common issue that it may causes installed file conflicts when both install non-multilib and multilib packages such as "curl-dev" and "lib32-curl-dev". 

</p>
<p>
It fails with:

      Error: Transaction check error:
      file /usr/bin/curl-config conflicts between attempted installs of lib32-curl-dev-7.61.0-r0.x86 and curl-dev-7.61.0-r0.core2_64

</p>
<p>
It has been added a new bbclass multilib_script.bbclass to handle such cases. In multilib_script.bbclass, it uses update-alternatives to resolve file conflicts. 
It needs to set MULTILIB_SCRIPTS in the form : in recipe. For curl, update oe-core/meta/recipes-support/curl/curl_7.61.0.bb:

</p>

`inherit multilib_script`{{execute}}
`MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/curl-config"`{{execute}}

<p>
It is created to deal with binary and executable script file conflicts so don't abuse it. A wrong example is about package os-release.
</p>

<p>
Both os-release and lib32-os-release install file /etc/os-release which is a symlink links to ${libdir}/os-release. Though the content of files ${libdir}/os-release are same, it still causes file conflict of /etc/os-release because ${libdir} are different. 

<p>
It is not proper to use multilib_script.bbclass to resolve the file conflict. The right solution is make package os-release install file to ${nonarch_libdir}/os-release. Then /etc/os-release are identical and no more file conflict.

</p>
