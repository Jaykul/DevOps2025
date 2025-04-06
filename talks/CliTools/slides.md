# A is for age<span block  text="sm primary-lighter">https://github.com/FiloSottile/age</span>

A simple, modern and secure encryption tool with small keys, no config options, and pipeline composability. (See also [rage](https://github.com/str4d/rage) and [typage](https://github.com/FiloSottile/typage)).

### Tips

Age also supports using SSH Keys for encryption.


### Honorable mention to Ansible and Az

<!--
### Usage

```powershell
age [--encrypt] [-p | -r key | -R keyfile] [-o file] ...
age --decrypt [-i keyfile] [-o file] ...
```
-->

### Example

```powershell
age-keygen -o key.txt
Public key: age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p

tar cvz "~/data" | age -r "age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p" > data.tar.gz.age
age --decrypt --identity "key.txt" --output "data.tar.gz" data.tar.gz.age
```

<!--
Also a Go library, with Rust and Typescript implementations (yes, typage works in the browser).

Honorable mention to [Ansible](which has usable automation for service accounts -- and can change their passwords, and manage GMSAs, unlike certain other configuration tools...

Honorable mention also to [az](https://github.com/Azure/azure-cli), which is basically a python CLI version of the Az PowerShell modules, in only 13k files and 300MB. Which may sound like a lot, but the Az modules are 7k fies and 1.7GB...
-->

---

# B is for bat<span block text="sm primary-lighter">https://github.com/sharkdp/bat</span>

A `cat` clone with syntax highlighting and git integration. It shows modifications with respect to the git index, can syntax highlight anything from actionscript to zig (including powershell), can show non-printable characters, can display multiple files at once, read pipeline input, pages by default, etc.

### Example

Next time someone asks you to `irm ... | iex`, check it with `bat` first:

```powershell
irm bun.sh/install.ps1 | bat -l ps1
```
<!--

Honorable mentions:
- [broot](https://github.com/Canop/broot), a better `tree` or `fd`
- [bun](https://bun.sh/) a fast, all-in-one JavaScript runtime (like node + npm but faster).

-->
---

# C is for chezmoi<span block text="sm primary-lighter">https://github.com/twpayne/chezmoi</span>

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

### Tips

1. You can put default options in `~/.curlrc` and sync them with chezmoi 😉
2. Try [Curl by Example](https://antonz.org/curl-by-example/).

### Example

```powershell
# To make curl fail when it gets a 4xx or 5xx code
curl --fail http://httpbingo.org/status/503
# To POST json
curl --json ($pwd|select *Path| ConvertTo-Json) http://httpbingo.org/post
# Get someones public SSH keys so you can encrypt a message to them
curl -s https://github.com/jaykul.keys | age -a -R - .\demos\password.txt
```

<!--
The man page for curl is over 80 pages (printed), but it's worth learning the basics, because this really is one of the most universally available networking tools. I don't want to spend any time on this, but I didn't feel I could skip it.
-->

---

# D is for dotnet new<span block text="sm primary-lighter">https://github.com/dotnet/templating</span>

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

Honorable mention to delta which is an amazing diff tool, and doggo, which is one of the nicest DNS tools...
-->

---

# E is for earthly<span block text="sm primary-lighter">https://github.com/earthly/earthly</span>

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

# F is for fzf<span block text="sm primary-lighter">https://github.com/junegunn/fzf</span>

Think of fzf as a faster, more powerful, text-only version of `Out-ConsoleGridView`.

Also a way nicer Ctrl+r (thanks [kelleyma49/PSFzf](https://github.com/kelleyma49/PSFzf) _or_ [domsleee/Posh-Fzf](https://github.com/domsleee/posh-fzf))

<img src="https://junegunn.github.io/fzf/images/fzf.gif" width="80%" />

<!--
Make sure to check out [kelleyma49/PSFzf](https://github.com/kelleyma49/PSFzf), a PowerShell wrapper that will even help you integrate fzf in your PSReadLine, and [beauwilliams/awesome-fzf](https://github.com/beauwilliams/awesome-fzf) a collection of ideas for using fzf (but using bash syntax), and [d-kuro/kubectl-fuzzy](https://github.com/d-kuro/kubectl-fuzzy) which wraps a bunch of kubectl commands in fzf

TODO: make a better gif

Fzf is so good, there are two PowerShell modules to make it easier to use, and provide helper functions and PSReadLine key bindings for it!

Honorable mention to fd, which is a faster find, and fluxCD which we use to manage our Kubernetes clusteers.
-->

---

# G is for Git<span block text="sm primary-lighter">https://git-scm.com/</span>

This one is a no-brainer. Please folks:
1. Put your code in source control
2. Put your infrastructure in code

## Honorable mention to `gh`, the GitHub CLI

Create or clone repositories, manage pull requests, and even close issues from your terminal.

<!--
# TODO: What's the hottest git example?

I really wish I believed that everyone here keeps all their scripts in git, but I've been around too  that I really can't ignore. If you're not tracking your change history in git, what are you using?


-->
---

# H is for httpie<span block text="sm primary-lighter">https://github.com/httpie/cli</span>

A colorful modern command-line HTTP client with a more intuitive interface ([docs](https://httpie.io/docs/cli)). Designed for testing & debugging APIs, servers & services.

### Examples

```powershell
# Stream in json...
$pwd | Select *Path | ConvertTo-Json | http POST http://httpbingo.org/post

# Type literal json (or forms with -f)
http http://httpbingo.org/post Path=C:\Users\Jaykul ProviderPath=C:\Users\Jaykul

# Download with --download or via redirection
http pie.dev/image/png > image.png
```

### Honorable mention to [sharkdp/hexyl](https://github.com/sharkdp/hexyl)

A simple hex viewer that uses a colored output to distinguish different categories of bytes.

<!--

You can `choco install httpie` or `winget install --id=HTTPie.HTTPie -e` use pip or brew or apt/yum, etc.

<img src="https://camo.githubusercontent.com/d3fea7abd0c9cb12b9627f4408a0559e4e081d4a786db3d7f6bdb9984ca61ada/68747470733a2f2f692e696d6775722e636f6d2f447037576e637a2e706e67" width="80%" />

-->

---

# I is for ImageMagick<span block text="sm primary-lighter">https://imagemagick.org/</span>

So many possibilities for scripting images, from resizing & converting to complex text annotation. Sixels!

<img src="/images/ImageMagickRules.png" width="60%" alt="An imageMagick Screenshot shows an inline image in a terminal"/>

### Examples

```powershell
magick ./public/images/RateThis.png RateThis.six && get-content RateThis.six
# convert to sixel and output to pipeline
magick ./public/images/RateThis.png sixel:-
```

<!--
Another one you need to get from choco or winget

1..5 | % {
convert -size 50x80 xc: +noise Random -write mpr:noise +delete `
        mpr:noise -extent 100x80 -compose copy `
        -page +50-40 mpr:noise -page +50+40 mpr:noise -flatten -write mpr:tile +delete `
        mpr:tile -virtual-pixel tile `
        `{ -blur 0x10 -paint 3 `( +clone -shade 120x45 `) +swap  -compose overlay -composite `} `
        -auto-level -write mpr:geotile +delete `
        -size 680x200 'xc:#212021' -font Forte -pointsize 72 `
        -tile mpr:geotile -gravity center -annotate +10+10 'Welcome To\nPowerShell!' `
        sixel:-
}

-->

---

# J is for jq<span block text="sm primary-lighter">https://github.com/jqlang/jq</span>

The json query tool lets you slice and filter, map and transform structured data. You don't _need_ jq in PowerShell, but having it can save you time when people's examples use it, and if nothing else, it's a prettier way to display json.

<!-- TODO: I need a better tool for J -- I don't believe in jq -->

### Examples

```powershell
irm 'https://api.github.com/repos/powershell/powershell/commits?per_page=5'
| ft @{n="name"; expr={$_.commit.author.name}}, @{n="message"; expr = { $_.commit.message }}

curl 'https://api.github.com/repos/powershell/powershell/commits?per_page=5'
| jq '.[] | {message: .commit.message, name: .commit.author.login}'
```

---

# K is for ~~kubectl~~ k9s<span block text="sm primary-lighter">https://github.com/derailed/k9s</span>

A terminal based UI to interact with your Kubernetes clusters.

![alt text](/images/k9spods.png)

<!--

My `k` alias is for `kubectl` and there's no doubt that's one of my highest used CLi tools. In this slot, however, I want to mention a slightly less well known tool. K9s is a terminal dashboard for kubernetes with lots of functionality built in. If you're administering Kubernetes, check it out. You can easily go from namespace to namespace, view pods, view logs, forward ports, etc.

-->

---

# L is for lnav<span text="sm primary-lighter">https://github.com/tstack/lnav</span>

Logfile Navigator. A TUI with built-in understanding of syslog, apache, strace, and more, but **very good** with any log files that have time stamps. Supports _navigation by time_, markdown annotations, searching, etc. Try it! There's a 'tutorial1' and a 'playground' you can use to learn what it can do:

```bash
ssh tutorial1@demo.lnav.org
```

⚠ **Note:** Windows builds currently only available on [ci-build output](https://github.com/tstack/lnav/actions/workflows/c-cpp.yml), but just unzip and run.

| Logs | Markdown |
| ---- | ---- |
| <img src="/images/lnav-logs.png" /> | <img src="/images/lnav-markdown.png" /> |

<!--

This tool is particularly for you if you deal with linux syslog or webserver log files where you just have to know the meanings of the columns. Given a directory of log files, the Logfile Navigator can decompress, _**detect formats**_, and merge all the files to a single view where you can search, filter, and navigate. It can even detect new files and follow renames.

It use color to highlight fields, detects warning and errors, and builds an index that enables quickly navigating to them, and SQL style queries for searching or filtering. It even has tab-completion for simple field value search. It has navigating by timestamps (like going "forward" 2 minutes or 20, or going to specific days, etc.). lnave allows you to write yourself markdown notes about specific lines in the log files.

Hypothetically, you could use this as a pager, but it's a bit of a heavy tool for that, since it starts by creating sqlite databases... But it's amazing for log files.
-->

---

# M is for Miller<span block text="sm primary-lighter">https://github.com/johnkerl/miller</span>

Miller is for stream-processing tabular data. It has a simple syntax for filtering, transforming, and aggregating data. It even handles a few formats that PowerShell does not, like pretty-printed tabular data and delimited key-value pair data, and can read compressed files.

### Examples

```powershell
# Flatten json to tabular data ...
curl 'https://api.github.com/repos/powershell/powershell/commits?per_page=5' -s
| mlr --ijson --ocsv flatten then cut -f "sha,author.login"
# Convert (and clean up) TSV data
helm list -A | mlr --itsv --opprint clean-whitespace then cut -x -f STATUS,CHART
helm list -A | mlr --itsv --opprint clean-whitespace
```

<!--

The simplest things you can do with Miller, PowerShell does not need Miller for, because you have ConvertFrom-* and the *-Object commands.
But miller handles formats that PowerShell doesn't, like zipped files and pretty-printed output, and can flatten structured data like json. It also has a lot of features for cleaning up data.

Here's two trivial examples. Flattening json to csv is a very useful trick, and miller can `unflatten` as well. If you've ever piped helm output to `ConvertFrom-Csv` you'll know Helm mixes spaces and tabs in it's output, and we end up with columns like "NAME " that have a space on the end. Miller's clean-whitespace will remove those spaces and give us nice clean data.

Notice the extra underlines on the headers here:

helm list -A | ConvertFrom-Csv -Delimiter `t | ft NAME*, REVISION*, UPDATED*, *Version

-->

---

# N is for nmap<span block text="sm primary-lighter">https://nmap.org/</span>

<!-- TODO: I don't really even know how to use nmap -->

---

# O is for Ov<span block text="sm primary-lighter">https://github.com/noborus/ov</span>

## Let's talk about pagers

- **More** is a pager. It outputs one page at a time so you can read it all.
- **Less** does more. We can go _back_, search, _filter_, use colors and your mouse. `less -R --mouse`
- **Moar** does less. Adds incremental search, syntax highlighting.
- **Ov** supports tabular data, multiple highlights, configurable keys, named modes...

### Examples

```powershell
$Env:LESS = '-R --mouse'
$Env:PAGER = 'ov'
# Viewing tab-delimited columnar data that's too wide for the screen
helm list -A | ov --view-mode posix
# Highlighting ERROR and WARNING lines, etc.
ov --multi-color "ERROR,WARN,INFO,DEBUG,not,^.{24}" access.log
# Counting columns to find the index of an error
ov --jump-target 3 --ruler --line-number --pattern "O is for Ov" './slides.md'
```

<!--
Hopefully you all know what a terminal "pager" is: a tool for displaying output or files so you can read a page at a time.

PowerShell ships with paging built-in, but it's honestly _embarrasing_. Hopefully none of you are using `Out-Host -Paging`?

With modern terminals, sometimes you can just output the text, and scroll back in your terminal, but every terminal has a limit, so what do _you_ do, when a command has several times that much output? In the early days of PowerShell, the PowerShell Community Extensions (PSCX) included `less` and because of that, I used it for years, and tended to assume that most people have upgraded to it (even though getting a Windows build can be a little confusing, outside of PSCX, which is a module now).

If you've never read the help for your pager, you should. There are a lot of features and options in there that you probably didn't know about.

Did you know less can support the mouse wheel for scrolling? Did you know it can _filter_ and show only lines that match a pattern?

Whether you're familiar with `less` or not, I encourage you to try my current favorite, ov (or try moar -- the built-in syntax hightlighting is appealing, but not as good as bat's).

Right now my favorite pager is `ov` because it gives me everything I used in less, plus column support, configurable modes, multi-word search and incremental search. I use `bat` for source files, but with ov as the pager.
-->

---

# P is for Pandoc<span block text="sm primary-lighter">https://github.com/jgm/pandoc</span>

If you need to convert text files from one markup format into another, pandoc is your swiss-army knife.

### Examples

```powershell
# Output ANSI escape sequences for a markdown file
pandoc -s README.md -t ansi
# Convert a markdown file to a Jupyter notebook
pandoc -s README.md -o README.ipynb
# Convert a markdown file to Textile (we use Jira)
pandoc -s README.md -o README.textile
```

Did you know you can use pandoc as a lua interpreter? Just run `pandoc lua` ...

<!--
I really struggled to choose just one tool for the letter P, there are so many very useful tools: Packer, PowerShell, Python, Peazip... but I was never tempted by Perl.

I picked Pandoc as one I thought less people would be familiar with, to add value to your collection.

-->
---

# Q is for qrc<span block text="sm primary-lighter">https://github.com/fumiyas/qrc</span>

QRC is a helpful little command-line tool for generating QR codes _inside_ your terminal.

### Examples

```powershell
  qrc "https://HuddledMasses.org"
  qrc "MAILTO:Jaykul@HuddledMasses.org"
  qrc "WIFI:S:guestwifi;T:WPA;P:we are not allowed to share that;;"
```

<!--

This one's a little helper that generates QR Codes in your terminal. It doesn't have many options, but it can output sixel or use ASCII blocks to output to a terminal.

-->

---

# R is for RipGrep<span block text="sm primary-lighter">https://github.com/BurntSushi/ripgrep</span>

Ripgrep _recursively_ searches directories for files and then for text matchin a regex pattern. Respects .gitignore, and has switches to search specific file types, and can do globbing.

### Examples

```powershell
rg --tyaml "dev" --iglob "**/*prod/*"

```

<!--
RipGrep is fast, and is the go-to tool for searching text when it hasn't ben indexed.

TODO: Copy more examples from work.
-->
---

# S is for SOPS<span block text="sm primary-lighter">https://github.com/getsops/sops</span>

SOPS is a tool for managing secrets in configuration files, encrypting with Age, PGP, Azure Key Vault, AWS KMS or GCP KMS.

Demonstrating it's full use is practically a session in itself, here's an example of encrypting a Kubernetes secrets file:

```powershell
$key = age-keygen -y $Env:AppData\sops\age\keys.txt
sops -e -i --age $key --encrypted-regex '^(data|stringData)$' .\secret.yaml
Get-Content '.\secret.yaml'
```

And decrypting it:

```powershell
sops ./secret.yaml
```

---

# <span class="text-2xl">T is for Terraform (Tofu)</span><span block text="sm primary-lighter">https://github.com/hashicorp/terraform</span><span block text="sm primary-lighter">https://github.com/opentofu/opentofu</span>

The cross-cloud, cross-platform, infrastructure as code tool.
<!-- Tofu is a fork of Terraform due to the license changes prior to Hashicorp's purchase by IBM. -->

# <span class="text-2xl">Tailscale</span><span block text="sm primary-lighter">https://github.com/tailscale/tailscale</span>

The easiest way to use Wireguard. Connect and disconnect, serve content and local services, etc.

# <span class="text-2xl">Tig</span><span block text="sm primary-lighter">https://github.com/jonas/tig</span>

A text user interface that can be used to browse your git repo, stage and commit changes.

---

# U is for Ubuntu

<!-- TODO: I need a tool here -->

---

# V is for viu <span block text="sm primary-lighter">https://github.com/atanunq/viu</span>

A fast image viewer for the terminal.

Really I should mention [trackd/sixel](https://github.com/trackd/sixel) but it's a native PowerShell module 😉

### Examples

```powershell
curl https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExdjdnc3ljazQyYmlyM2gyMWVpeTE3YTB5M2IxaW5kMWFwOW84djg2dCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/v65rDtklV9l6g/giphy.gif
| viu --once -
```

```powershell
Get-ChildItem .\Icons\weather\ -Exclude *.txt
| Get-Random -Count 5
| ConvertTo-Sixel
```

---

# W is for Wush <span block text="sm primary-lighter">https://github.com/coder/wush</span>

A wireguard powered file-transfer tool. Also available in your browser at [wush.dev](https://wush.dev)

```powershell
wush serve
wush cp 1gb.txt
```

## Honorable mention to WezTerm (and Windows Terminal)
## And Winget, and Wsl...

---

# X is for xcopy (and RoboCopy, I guess)

<!--
TODO: Should this be xargs instead?
gruntwork-io/git-xargs

git-xargs \
  --branch-name test-branch \
  --github-org <your-github-org> \
  --commit-message "Create hello-world.txt" \
  touch hello-world.txt

-->

---

# Y is for yq<span block text="sm primary-lighter">https://github.com/mikefarah/yq</span>

yq is a command-line structured data processor, like `jq` but with support for yaml, json, xml, properties, csv, tsv and toml. It doesn't support quite everything that jq does, but it's faster...

### Examples

```powershell
# Check the image versions in a deployment
yq '.spec.template.spec.containers[].image' ./deployment.yaml
# Update in place, the image for the first container
yq -i '.spec.template.spec.containers[0].image = "ghcr.io/stefanprodan/podinfo:6.8.0"' ./deployment.yaml
```

---

# Z is for zoxide<span block text="sm primary-lighter">https://github.com/ajeetdsouza/zoxide</span>

A cross-platform, cross-shell, smarter `cd` command. It tracks your most used directories and lets you jump to them with a few keystrokes.

It uses fzf to fuzzy match folders if you want, and supports integration to PowerShell, and importing your "database" from ZLocation (an _awesome_ PowerShell module that basically does the same thing, with better PowerShell support, but obviously without support for running in other shells).

### Examples

```powershell

z some/long/path/to/a/directory
z # will go to ~
z direc # will return to "some/long/path/to/a/directory"
```
