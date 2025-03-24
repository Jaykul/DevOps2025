# CLI Tools for DevOps, that weren't written for PowerShell

Come hear about my favorite open source command-line tools, from a to z. You're almost certain to find a compelling new tool in this talk, as I go through some of my favorites starting with age, bat, chezmoi, and dotnet new, all the way to yq and zstd. We'll be covering a lot of command-line tools, and every one is open source, cross-platform, and does cool tricks. There will be very little PowerShell in this talk, but for a few of these, I'll show you a PowerShell wrapper or some tips and tricks that will make a tool fit better in your PowerShell eco system, and your terminal of choice.

A is for age, and arc and az, encryption, compression, and azure won't faze me.

C is for carapace, choco, chezmoi, completions, installing, and syncing, voila!

D is for dotnet new, a better way to template your projects, that doesn't need to rhyme to be cool.

---

c is for chezmoi, choco, carapace, schollz/croc, hpjansson/chafa (https://hpjansson.org/chafa/) and curl.
and d is for dotnet new or delta or doggo, and e is for earthly, and f is for fd, and g is for git or gh, and h is for helm or sharkdp/hexyl or httpie, and i is for ip, and j is for jq or jupyter, and k is for k9s, and l is for lsd, and m is for miller or make, and n is for nmap, and o is for open, and p is for pandoc, and q is for q, and r is for rg, and s is for skaffold or stern, and t is for terraform or terjira, and u is for up, and v is for vcpkg, and w is for wget or weasyprint, and x is for xargs, and y is for yq, and z is for zstd.


https://dystroy.org/broot
https://github.com/stern/stern


```powershell
$Executables = `
Get-ChildItem *.exe -OutVariable exes |
Get-Random -count 20 |
Format-Table Mode, Name, Length |
Out-String
```
