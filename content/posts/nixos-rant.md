+++
date = '2025-01-26T23:28:43-08:00'
draft = false
title = 'NixOS, the ~~best~~ most overhyped distro for desktop'
author = 'gokulswam'
+++

## Nix, the best package manager

Nix is amazing. It's also extremely difficult to learn. The learning curve is steep and you get the added bonus of potholes and cracks along that hill that will send you tumbling all the way down. But, man, it's really satisfying and useful once you get near the top. You feel like an absolute gigachad.


![Nix Chad](/images/nix_chad.webp)

Nix builds packages in isolation from each other in a *declarative* fashion. I can tell it what to do and it does it for me. This is done with the *nix* language, which is a purely functional language.

Let's write some recursive factorial code as a quick demo:

```nix
let
  factorial = n: if n == 0 then 1 else n * factorial (n - 1);

in
{
  factorial2 = factorial 2;
  factorial9 = factorial 9;
}
```

If you run that code in a nix REPL, you get the following:

```nix
{
  factorial2 = 2;
  factorial9 = 362880;
}
```

This language is used to create packages for the nix ecosystem. They can shared among peers and built by anyone else without any hassle, since Nix guarantees reproducibility. Even better, using Nix, we can create reproducible shell environments. Imagine a project that includes a nix flake with a declared and reproducible development shell. You only need to have one dependency installed: Nix. You can open the dev shell, which will bring the declared dependencies to scope, and go away with coding your project.

On top of all this is NixOS, a Linux distro.

## NixOS

> **⚠️ Note**
>
> Everything I'm going to rant about is regarding NixOS as a desktop OS. Not for servers.

With NixOS, everything on your system is configured with Nix. Your graphical interface, shell, applications, etc. With it, you get rollbacks. Also included is the insane learning curve and difficulty.

![nixos skill curve graph](/images/nixos_curve.png?width=400)  
*[Source](https://www.reddit.com/r/NixOS/comments/mwem27/nixos_legacy_of_the_greybeard/)*

My issue with NixOS is the lack of convenience. I don't know about you, but on my system, I install lots of things everyday. It's a pain to do that declaratively every time and to wait for the expressions to be evaluated and built. In addition, with NixOS, you have a huge layer of abstraction on top of your system; when an oopsie happens, it's extremely hard to figure out why.

On top of that, some things can't be properly configured declaratively. I use Gnome, and getting that set up with my favorite extensions and extension settings is just not worth it. Things like [gnome-manager](https://github.com/smashstate/gnome-manager) exist for NixOS, but it's just not worth my time.

There's also the fact that I use proprietary software that's not packaged for NixOS. For example, at my University, I use Keysight's [Advanced Design System](https://www.keysight.com/us/en/products/software/pathwave-design-software/pathwave-advanced-design-system.html)(ADS) for RF/Microwave design. I don't want to be packaging this and every other proprietary dependency for this package to use it on NixOS. Same goes for Xilinx's FPGA tools.

You might mention that I can manage Gnome and install those packages on NixOS without doing it declaratively. Yes, you can, but at that point why not use a normal distro?

You might also mention that this is just a result of a skill issue.

![skill issue gif](/images/skill_issue.gif?width=150)  
**Stfu.**

My ultimate solution for this rant is to use something well-supported like Fedora and install Nix on top. I can manage my shell and development dependencies with Nix, and use Linux properly and normally for my own convenience. I'll maybe post more details about my setup in a different post.
