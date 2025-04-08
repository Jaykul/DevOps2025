---
drawings:
  persist: false
transition: slide-left
mdc: true

theme: ./theme
highlighter: shiki
lineNumbers: false
fonts:
  # basically the text
  sans: Chakra Petch # Offside
  # use with `font-serif` css class from UnoCSS
  serif: Milonga
  quote: Carattere
  # for code blocks, inline code, etc.
  mono: Source Code Pro

defaults:
  leftFooter: /images/cc-by-sa.svg
  rightHeader: /images/PSDOGSummit.png
  layout: default
src: ./talks/MistakeProofing/cover.md
layout: cover
background: images/322798.jpg
level: 1
---
<!-- The content should come from cover.md -->
---
layout: image
image: images/Sponsors.png
rightHeader:
leftFooter:
routeAlias: Sponsors
title: Sponsors
level: 2
---
<!-- The sponsors slide has no content -->
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
    <a href="https://github.com/Jaykul"><logos-github-icon style="background: #eee; border: 1px solid #ccc; border-radius: 1em" /> github.com/Jaykul</a> and <a href="https://github.com/PoshCode">PoshCode</a><br/>
    <a href="https://discord.gg/PowerShell"><logos-discord-icon /> discord.gg/PowerShell</a><br/>
    <a href="https://HuddledMasses.org"><emojione-statue-of-liberty /> HuddledMasses.org</a><br/>
    <a href="https://bsky.app/profile/jaykul.powershell.sociall"><logos-bluesky />@jaykul.powershell.social</a><br/>
    <a href="https://fosstodon.org/@Jaykul"><logos-mastodon-icon /> @Jaykul@FOSStodon.org</a><br/>
  </div>

<!--

For those of you who came to this talk despite not knowing me, thank you, and let me introduce myself.

I'm Joel Bennett, and I'm from western New York by way of the grasslands of Guanacaste, Costa Rica. I have been "Jaykul" (J. Cool) online since the 1990s, and I'm currently a Principal DevOps Engineer at loanDepot! I've been solving problems with code since the last century, and I've been recognized as a Microsoft MVP for PowerShell fifteen times in a row now. I am an open source developer, and I coordinate the official PowerShell support chat and virtual user group, so you can find me on GitHub, Discord, BlueSky, Mastodon, etc. I'm always happy to chat about PowerShell, DevOps, GitOps.

-->

---
src: ./talks/MistakeProofing/slides.md
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