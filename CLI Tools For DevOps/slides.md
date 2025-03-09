---
title: CLI Tools for DevOps
level: 1
info: |
  # CLI Tools for DevOps

  Learn more at [HuddledMasses.org/CliTools](https://HuddledMasses.org/CliTools)
keywords: CLI,Tools,DevOps,Utilities,QuickTake
drawings:
  persist: false
transition: slide-left
mdc: true

theme: ./theme
highlighter: shiki
lineNumbers: false

defaults:
    leftFooter: /images/cc-by-sa.svg
    rightHeader: /images/PSDOGSummit.png
    layout: default
layout: cover
background: images/E2984F049253590FFACD39F2C701E67920AB36C97BEF97AFD491B673980B991A.jpg
---

<span class="text-8xl text-white" style="font-weight:700;" >
    Command<span class="text-blend">Line</span> <!-- <logos-git-icon /> --> <!--light-icon icon="git-pull-request"/-->
</span>
<div class="text-5xl text-primary-lighter mb-2rem" style="font-weight:500;" >
    Tools for DevOps
</div>
<div>
    Joel Bennett
</div>
<div class="bg-blend">
    @Jaykul
</div>

<div class="bottom-5 absolute">
    April 7-10, <span class="text-blend">2025</span>
</div>
<div class="top-2 left-2 absolute text-align-center">
    PowerShell + DevOps<br/>
    <span class="text-blend">Global Summit</span>
</div>

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Press Space for next page <carbon:arrow-right class="inline"/>
  </span>
</div>

---
layout: cover
background: images/Sponsors.png
routeAlias: Sponsors
title: Sponsors
level: 2
---

---
layout: image-right-pop
image: https://HuddledMasses.org/assets/images/avatar.png
routeAlias: About Me
title: About Me
level: 2
---

# Joel "Jaykul" Bennett

## Principal DevOps Engineer

``` text
Solving problems with code
15x Microsoft MVP for PowerShell
```

  <div class="absolute bottom-16 left-16">
    <a href="https://github.com/Jaykul"><logos-github-icon /> github.com/Jaykul</a> and <a href="https://github.com/PoshCode">PoshCode</a><br/>
    <a href="https://discord.gg/PowerShell"><logos-discord-icon /> discord.gg/PowerShell</a><br/>
    <a href="https://HuddledMasses.org"><emojione-statue-of-liberty /> HuddledMasses.org</a><br/>
    <a href="https://fosstodon.org/@Jaykul"><logos-mastodon-icon /> @Jaykul@FOSStodon.org</a><br/>
  </div>

<!--

For those of you who came to this talk despite not knowing me, thank you, and let me introduce myself.

I'm Joel Bennett, and I'm from upstate New York by way of the grasslands of Guanacaste, Costa Rica. I have been "Jaykul" (J. Cool) online since the 1990s, and I'm currently a Principal DevOps Engineer! I've been solving problems with code since the last century, and I've been recognized as a Microsoft MVP for PowerShell fifteen times in a row now. I am an open source developer, and I coordinate the official PowerShell support chat and virtual user group, so you can find me on GitHub, Discord, Mastodon, and more rarely on Slack and Twitter, and I'm always happy to chat about PowerShell, DevOps, GitOps.

-->

---

# A is for age<br/><div class="text-sm text-primary-lighter" style="font-weight:200;" >https://github.com/FiloSottile/age</div>

A simple, modern and secure encryption tool with small keys, no config options, and pipeline composability. (See also [rage](https://github.com/str4d/rage) and [typage](https://github.com/FiloSottile/typage))

```powershell
choco install age.portable
```

### Usage

```powershell
age [--encrypt] [-p | -r key | -R keyfile] [-o file] ...
age --decrypt [-i keyfile] [-o file] ...
```

### Example

```powershell
    age-keygen -o key.txt
    Public key: age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p

    tar cvz "~/data" | age -r "age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p" > data.tar.gz.age
    age --decrypt --identity "key.txt" --output "data.tar.gz" data.tar.gz.age
```

<!--
Also a Go library, with Rust and Typescript implementations (yes, typage works in the browser).

Honorable mention to [az](https://github.com/Azure/azure-cli), which is basically a python CLI version of all the Az modules.
-->

---

# B is for bat<br/><div class="text-sm text-primary-lighter" style="font-weight:200;" >https://github.com/sharkdp/bat</div>

A `cat` clone with syntax highlighting and git integration. It shows modifications with respect to the git index, can syntax highlight anything from actionscript to zig (including powershell), can show non-printable characters, can display multiple files at once, read pipeline input, pages by default, etc.

### Example

Next time someone asks you to `irm ... | iex`, check it with `bat` first:

```powershell
irm bun.sh/install.ps1 | bat -l ps1
```
<!--
Honorable mention to [bun](https://bun.sh/), which is a fast, all-in-one JavaScript runtime (like node + npm but faster).
-->
---

# C is for chezmoi<br/><div class="text-sm text-primary-lighter" style="font-weight:200;" >https://github.com/twpayne/chezmoi</div>

Chezmoi manages personal configuration files ("dotfiles" like `~/.gitconfig`) and profile scripts across machines. I even use it to manage my WezTerm and Windows Terminal config, and some VSCode settings.

### Example

To set up a new machine with my dotfiles:

```powershell
winget install twpayne.chezmoi
chezmoi init --apply Jaykul
```

To edit a dotfile you have stored in chezmoi:

```powershell
chezmoi edit ~/.gitconfig --apply
```

<!--
Honorary mention to [choco](https://chocolatey.org/), which is the easiest way to install software on Windows (including chezmoi).
-->

---

# C is for curl

<!-- TODO: can we make `code` work? -->
The open source `curl` command-line tool is so universal, it's even included in Windows! It's **not** just for HTTP, it supports over two dozen other protocols including FTP, GOPHER, IMAP, POP3, SMTP and MQTT, etc.

## Tips:

1. You can put default options in `~/.curlrc` and sync them with chezmoi 😉
2. Try [Curl by Example](https://antonz.org/curl-by-example/).

### Example

```powershell
# To make curl fail when it gets a 4xx or 5xx code
curl --fail http://httpbingo.org/status/503

# To POST json
curl --json ($pwd|select *Path| convertto-json) http://httpbingo.org/post
```
<!--
The man page for curl is over 80 pages (printed), but it's worth learning the basics, because this really is one of the most universally available networking tools. I don't want to spend any time on this, but I didn't feel I could skip it.
-->

---

# D is for dotnet new<br/><div class="text-sm text-primary-lighter" style="font-weight:200;" >https://github.com/dotnet/templating</div>

By far the easiest way to create templates for projects.

Take a simple _working_ project, add a `template.json` config file, and share via NuGet.

<div class="text-sm left-4 relative">
The key is that instead of injecting tokens into your code, you can specify the GUIDs and names that are already in your project and explicitly keep only some parts of the project in the template. This way your templates are based on actual working code, you can use `dotnet new` regardless of the project language.
</div>

### Example

```powershell
dotnet new --install Jaykul.PowerShellModule
dotnet new psmodule -n MyModule
```

### See also

- My [PowerShell Template](https://github.com/Jaykul/PowerShellTemplate)

<!--
We use dotnet new to generate templates for PowerShell modules, gitops configurations for our Kubernetes clusters, and even slide decks for meetings...

TODO: I need to publish that PowerShell Template

Honorable mention to doggo, which is one of the nicest DNS tools, and to delta which is an amazing diff tool.
-->

---

# E is for earthly<br/><div class="text-sm text-primary-lighter" style="font-weight:200;" >https://github.com/earthly/earthly</div>

Earthfile is like a cross between make files and dockerfiles. It can build anything, and the builds are fast, cached, and consistent, running the same whether on a developer laptop or GitHub CI/CD.

```dockerfile
VERSION 0.8
FROM mcr.microsoft.com/dotnet/sdk:9.0
WORKDIR /work

deps:
    COPY src/*.csproj src/
    RUN dotnet restore src/*.csproj

build:
    FROM +deps
    COPY src src
    RUN dotnet publish --no-restore src/*.csproj -o publish

    SAVE ARTIFACT publish AS LOCAL publish
```

<!--
TODO: This would be a great live demo
-->

---

# F is for fzf<br/><div class="text-sm text-primary-lighter" style="font-weight:200;" >https://github.com/junegunn/fzf</div>

Think of fzf as a faster, more powerful, text-only version of `Out-ConsoleGridView`...

<img src="https://junegunn.github.io/fzf/images/fzf.gif" width="80%" />


<!--
Make sure to check out [kelleyma49/PSFzf](https://github.com/kelleyma49/PSFzf), a PowerShell wrapper that will even help you integrate fzf in your PSReadLine, and [beauwilliams/awesome-fzf](https://github.com/beauwilliams/awesome-fzf) a collection of ideas for using fzf (but using bash syntax), and [d-kuro/kubectl-fuzzy](https://github.com/d-kuro/kubectl-fuzzy) which wraps a bunch of kubectl commands in fzf

TODO: I need a much better demo of fzf (e.g. to pick a file, with file preview on the side)

Honorable mention to fd, which is a faster find, and fluxCD which we use to manage our Kubernetes clusteers.
-->

---

# G is for Git<br/><div class="text-sm text-primary-lighter" style="font-weight:200;" >https://git-scm.com/</div>

This one is another no-brainer that I really can't ignore. If you're not tracking your change history in git, what are you using?

# TODO: What's the hottest git example?

## Honorable mention to `gh`, the GitHub CLI

Create or clone repositories, manage pull requests, and even close issues from your terminal.

---




---
layout: image-right
image: /images/RateThis.png
routeAlias: ThankYou
title: Thank You
level: 2
rightHeader: /images/PSDOGSummit.png
---

<div class="text-blend text-7xl" style="font-weight:700;" >
THANK YOU!
</div>
<div class="text-6xl top-20 relative" style="font-weight:700;" >
Feedback is a gift. Please review this session!
</div>

<!-- TODO: Make a layout where this image and the header/foooter images can all show up -->