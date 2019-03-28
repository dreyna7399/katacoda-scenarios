Within each Wind River step, a series of Markdown extensions have been created that can provide various details for the users' experience.

For example, commands such as `echo "Run in Terminal"`{{execute}}
 can be executed by clicking the command.

This is done by adding `execute` to the markdown code block, for example:
<pre>`echo "Run in Terminal"`{{execute}}</pre>

Now do this stuff:
<pre>`./wrlinux-x/setup.sh --machine qemumips64 --all-layers --dl-layers`{{execute}}</pre>
<pre>`source oe-init-build-env`{{execute}}</pre>
<pre>`bitbake -g curl`{{execute}}</pre>

More can be found at the scenario [on Markdown extensions](https://katacoda.com/scenario-examples/markdown-extensions).
