# What is Poka-Yoke?

<div v-click class="text-6xl text-primary-lighter">

| ポカ | Poka | Mistake |
| --- | --- | --- |
| ヨケ | Yoke | Avoidance |

</div>
<div v-click>

## A set of techniques and tools used to prevent errors or defects

</div>

<!--

The phrase "poka yo-kay" comes from the Japanese words [click] "poka" which refers to an _inadvertent_ mistake, and "yokeru" which means "to avoid".

It was coined by Shigeo Shingo at Toyota as part of their Zero Quality Control and refers to a set of techniques and tools used to prevent errors or defects in processes. [click] The goal is to create processes where mistakes are either impossible or immediately detectable.

It was originally called baka-yoke -- which means "idiot-proofing" (or "fool-proofing") ...

-->

---
layout: section
---
# Where do bugs come from?

<v-click>

<AutoFitText class="text-blend" modelValue="Mistakes" />

Obviously. You didn't make them on purpose..

</v-click>

<!--
Just to set the stage a moment, consider where bugs come from.

Bugs. Defects. Problems.

[click] They are never on purpose, right?. Bugs are the _result_ of mistakes.

So to prevent bugs, we need to prevent mistakes, and if we do it well, we'll improve our user's experience.

Of course, we can't prevent all mistakes. We're talking about preventing humans from _**repeating**_ mistakes that we've seen before.
-->

---

# Poke-Yoke

## Mistakes Should Be

<v-clicks>

- Obvious at a glance
<img src="/images/dashboard-warnings.jpg" alt="Dashboard Lights" class="max-height-120px" />

- Outright impossible
<img src="/images/laptop-ports.jpg" alt="Laptop Ports" class="max-height-120px" />

</v-clicks>

<!--

With Poka-Yoke our goal is to preventing problems by designing tools and processes in such a way that human mistakes are...

- [click] immediately detectable.
- [click] Or basically impossible.

As you can see, these are some examples from the real world (you'll start noticing Poka-Yoke in industrial design all around you, now that you've heard of it).
At the bottom, we have some of the best kind of solutions -- they are easy to implement, require no maintenance, and don't slow you down, but most importantly, they make mistakes nearly impossible. When there's no way to totally prevent a mistake, the next best thing is to make them obvious. Examples of this are warning lights and bells so you can easily see that you're low on gas, or your passenger is not wearing their seatbelt.

Let's take a look at some examples of these sorts of solutions for PowerShell and coding.

-->

---
layout: two-cols
leftClass: col-span-6
rightClass: col-span-6
---

::header::

# Poka-Yoke for PowerShell

## Make Mistakes Impossible

### Falling Into the Pit of Success

Consistency (noun): Reliability, uniformity, or conformity. Logical coherence. A singular way of doing things. {.text-color-yellow}

::left::

<v-clicks>

- [Approved Verbs](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)
- [Strongly Encouraged Guidelines](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/strongly-encouraged-development-guidelines)
- [Common Parameters](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters)
- [Standard Parameter Names and Types](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/standard-cmdlet-parameter-names-and-types)
- [Validating Parameter Input](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/validating-parameter-input)
- [Cmdlet Aliases](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/cmdlet-aliases)
- [Parameter Aliases](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/parameter-aliases)

</v-clicks>

::right::

<v-clicks>

- [Parameter Sets](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/cmdlet-parameter-sets)
- [Supporting Wildcard Characters in Parameters](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/supporting-wildcard-characters-in-cmdlet-parameters)
- [Input Filter Parameters](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/input-filter-parameters)
- [Parameter Binding by Property Name](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parameter_binding)
- [Extending Output Objects](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/extending-output-objects)
- [About_Classes](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes)
- [Custom Formatting Files](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/custom-formatting-files)

</v-clicks>

<!--

Jeffrey Snover used to talk about the "Pit of Success" -- the idea that PowerShell is designed to make it easy to do the right thing, and hard to do the wrong thing.

As tool authors, we get to take advantage of a lot of that, and a big part of it,
is about consistency and predictability. I talk about this a lot, but I only have 25 minutes right now,
so I just want to quickly give you some ideas, about how to write _consistent_ commands by following the PowerShell conventions.

So for each bullet point here, I guarantee an internet search will turn up **official** documentation on learn.microsoft.com with a whole lot more details.

- [click] We have a set of approved verbs, which help users identify what a command does.
- [click] We have guidelines for picking nouns. Here's a hint: use the name of the _type_ of the object you're going to output.
- [click] We have a set of common parameters, and help for implementing them. These help everyone understand your commands and use them safely.
- [click] We also have an _extended_ list of ["standard" parameter names and types](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/standard-cmdlet-parameter-names-and-types), over a hundred and tewnty-five different parameter names in 7 categories that are usually understoon, and guidelines for the data types you should use for them.
- On top of that, [click] We have a lot of options for -validating parameter input
- And [click] To give you back some naming flexibility, there are command aliases
- [click] And parameter aliases, so you can help people _find_ the right command or parameter, when you know some people will guess wrong.

We also have a lot of tooling in the language for implementing things consistently:

- [click] We have parameter sets to help you design complex commands with more than one way of using them
- [click] We have design and implementation support for wildcard characters
- [click] And standard parameters for filtering input

Finally, although PowerShell has built-in support for
- [click] Writing your own data classes
- And [click] binding parameters from pipeline input objects
- There is also support for [click] extending built-in types without writing your own
- [click] And custom formatting, so you can control how objects are displayed in the output, without needing to change the types.

All of this is designed to work together to help users do the right thing, and to help them discover the right way to use the tools that you write.

That's the ground work.









-->

---

# Poka-Yoke for PowerShell

## Make User Mistakes Impossible

<v-switch>
<template #1>

### Consistency: Verbs, Nouns, Parameters

PowerShell has a lot of consistency built in. A set of approved verbs. Common parameters. Common patterns for formatting output.

2. About Documentation and Help
3. Argument Transformation
4. Argument Completers

</template>
<template #2>

### Use CmdletBinding to Support Common Parameters

```powershell {4-6}
class Player { [string]$Name; [Position]$Position; [string] ToString() { return $this.Name } }
class Position { [int]$X; [int]$Y; [string] ToString() { return "" + $this.X + ", " + $this.Y } }

function Move-Player {
    [CmdletBinding()]
    param(
    ...
```

</template>
<template #3>

### Strongly Type Variables and Parameters

<!-- Highlight lines 3 and 8 -->

```powershell {1,6}
enum Direction { North; East; South; West }

function Move-Player {
    [CmdletBinding()]
    param(
        [Direction]$CardinalDirection,
        [int]$DistanceInMeters,
        [switch]$Force
    )
    ...
```

</template>
<template #4>

### Validation attributes

```powershell {1,4-10,13}
[ValidateSet("North", "East", "South", "West")]
[string]$CardinalDirection,

[ValidateScript({
    if ($CardinalDirection -eq "North" -and $Player.Position.Y - $_ -lt 0) {
        throw "You can't move that far North. The edge is only $($Position.Y) away."
    }
    $true
})]
[ValidateRange(1, 10)]
[int]$DistanceInMeters,

[ValidateScript({ Test-Path $_ })]
[string]$Path
```

</template>
<template #5>

### Support -WhatIf and -Confirm

```powershell {1,13}
[CmdletBinding(SupportsShouldProcess, ConfirmImpact="High")]
param(
    [Direction]$CardinalDirection,
    [int]$DistanceInMeters,
    [switch]$Force
)
switch($CardinalDirection) {
    North { $NewPosition = [Position]@{ Y = $Player.Position.Y + $DistanceInMeters; X = $Player.Position.X } }
    East  { $NewPosition = [Position]@{ X = $Player.Position.X + $DistanceInMeters; Y = $Player.Position.Y } }
    South { $NewPosition = [Position]@{ Y = $Player.Position.Y - $DistanceInMeters; X = $Player.Position.X } }
    West  { $NewPosition = [Position]@{ X = $Player.Position.X - $DistanceInMeters; Y = $Player.Position.Y } }
}
if ($Force -or $PSCmdlet.ShouldProcess($Player.Name, "Move ${DistanceInMeters} meters ${CardinalDirection} to ${NewPosition}")) {
    ...
```

</template>
</v-switch>

<!--

There are many ways to prevent mistakes in PowerShell.

_Remember: To run these as demos, pre-run demos-1.ps1_

[click]Predictable names for commands and parameters, working together with tab-completion, and the absolute best way to help your users avoid making mistakes.

[click]Always use CmdletBinding. It's necessary to support the common parameters that users expect, and it's the easiest way to make sure users can only pass the parameters you expect.

[click]Strongly-typed parameters can prevent a lot of mistakes (or at least, prevent them from executing). Incidentally, note the naming here too: "CardinalDirection" is more specific than "Direction" (and eliminates "Up" and "Down") as "DistanceInMeters" is more specific than "Distance" -- additionally, by adding "Cardinal" the parameters start with different letters, making them easier to tab complete.

[click]Validation attributes can do some of the same things as strongly-typed parameters, but they can be more flexible, and can even take other parameters into account.

[click]Support -WhatIf and -Confirm, so that users can check, and set ConfirmImpact=High if you do something irreversible.

make them very obvious From stringly typed parameters to validation attributes, there are many ways to prevent mistakes from being made.
-->

---

# Poka-Yoke for PowerShell

## Make User's Mistakes Obvious

### Handle Known Errors Gracefully

Provide user-actionable information for every expected error that you can't prevent.




### Validate Inputs Up Front, Output Helpful Errors & Suggestions

```powershell {9-11}
function Move-Player {
    [CmdletBinding()]
    param(
        [Direction]$Direction,
        [int]$DistanceInMeters,
        [switch]$Force
    )

    if ($Direction -eq "North" -and $Player.Position.Y - $DistanceInMeters -lt 0) {
        throw "You can't move that far north. The map edge is only $($Position.Y) away.""
    }
    ...
```



<!--

A big part of what we can do to make mistakes obvious is already built into PowerShell's error handling, with stack traces and error messages always visible by default (unless they happen inside your prompt).

As tool authors, we should take the responsibility to provide user-actionable information for all expected errors, but Poka-Yoke is part of Zero Quality Assurance -- if we know about a mistake, we want to prevent it from happening again.

A

To a certain extent, even the Validation Attributes that we talked about
earlier don't really _prevent_ mistakes. They _do_ make it obvious when the
user passes the wrong value, but although the main code in the function does not run,
from the user's perspective, they're still making a mistake.

There's very little difference for most users between validation attributes and
and validation code that runs _inside_ your function.

Remember to make the solutions to the mistakes more obvious.
Instead of "Argument out of bounds" or "Invalid argument" -- indicate the valid range of values.

[click]

-->

---

# Poka-yoke for PowerShell

## Make Your Own Mistakes Impossible

<v-switch>
<template #1-6>

### Write Regression Tests

</template>
<template #2-6>
- Made a mistake?
</template>
<template #3-6>
- Write a test!
</template>
<template #4-6>
- Fix the mistake
</template>
<template #5-6>
- Integrate the test
</template>
<template #6-10>

### Use PSScriptAnalyzer

</template>
<template #7-10>

Consistency (noun): Reliability, uniformity, or conformity. Logical coherence. A singular way of doing things. {.text-color-yellow}

</template>
<template #8-10>

#### Consistency facilitates intuition

</template>
<template #9-10>

#### Consistency increases maintainability

</template>
</v-switch>

<!--
Let's switch gears a little and talk about ways to prevent our own mistakes.

## What would you all say is the best way to stop yourself from _repeating_ a mistake?

My answer is: [click]**regression tests**.

- [click]Any time you find a mistake...
- [click]Write a test that fails because of that mistake
- [click]Fix the mistake so that the test passes
- [click]And then ... make sure that test runs every time you make a change

Another tool to prevent mistakes (and increase their visibility)...

## [click]PSScriptAnalyzer is a PowerShell linter

Linters check for obvious errors and common bugs, and help you to identify style and consistency issues.
Normally, this would fall under the category of making mistakes more obvious,
but if we consider a mistake hasn't really been made until you try to run it,
linters (and even spell-checkers) can prevent mistakes.

On shared projects, consider extending PSScriptAnalyzer to enforce your own rules.
-->

---

# TODO

<!--
- **Prevent** mistakes from being made:
  - Documentation (help)
  - Strongly typed parameters
  - ArgumentCompleters
  - Helper commands that produce valid input
- Make mistakes **obvious** at a glance:
  - Handle Common Errors (and explain them)
  - Output Errors (don't suppress unexpected errors)
- **Learn** from mistakes:
  - Logging (to a file, or to the event log)
  - Error Reporting (to a ticketing system, or to a chat channel) -->

---
layout: image-right
image: /images/PDCA-Cycle.webp
---

# Plan-Do-Check-Act

## The cycle of continuous improvement

<br/>

1. **Plan**: Identify your (possible) problems
2. **Do**: Design mistake-proofing solutions
3. **Check**: Test and validate your solutions
4. **Act**: Implement and train your team(s)

<!--

I like to create and use Poka-Yoke as solutions in our cycles of continuous improvement, so let's talk about that cycle for a minute.

Continuous improvement is not always about iterating on _the same_ product over and over.

In DevOps, particularly, we almost always have many products and projects,
and a wide range of different tools and solutions that we're responsible for.
I don't know about your teams, but mine tends to switch _between_ projects based on
external factors like ...

- What management is excited about this month
- What caused the most recent outage

But regardless of whether you're continually iterating on the same product,
or you just have an opportunity to do one or two cycles of improvements,
the process is basically the same...

-->
---

# Plan

## <v-click>Identify the problem</v-click>
## <v-click>Find the root cause</v-click>
## <v-click>Ask "why?" five times</v-click>
### <v-click>Let's take an example</v-click><v-click>. Our deployments are failing.</v-click>
<v-clicks>

1. Why? Because the "publish" step is failing to upload.
1. Why? Because there was an error authenticating to the service.
1. Why? Because the credentials are wrong.
1. Why? Because the password expired overnight.
1. Why? Because we forgot to change the password ahead of time.

</v-clicks>

<!--

[click] The first step is always to identify the problem.

Well, sometimes, we're only going through this process because someone _else_ has **already** identified a problem, but even then ...

[click] We need to understand it, and determine why it happened: the root cause.

The simplest form of root-cause analysis, we just call "the five whys."

[click] Five whys is literally asking "why" five times; each time directing the question at the answer to the previous question.

This way, you dig deeper toward a root cause. (This technique _also_ came out of Toyota, by the way.)

[click] Let's take an example: [click] Our deployments are failing
- Why? [click]Because the "publish" step is failing to upload
- Why? [click]Because there was an error authenticating to the service
- Why? [click]Because the credentials are wrong.
- Why? [click]Because the password expired.
- Why? [click]Because we forgot to change the password ahead of time.

Okay, so we've identified the problem, and we think we've identified the root cause. Let's move on to the next step.

-->

---

# Do

## Design Poka-Yoke Solutions


---

# Check

## Test and Validate Your Solutions

Use it. Write tests. Verify the mistakes are are impossible -- or obvious.

If your solution works, move on to the next error. Otherwise, try another solution.

<!--

The bottom line is: do what used to cause the problem. See if your solution prevents the problem.

Ideally, you'll have unit tests that reproduce the problem, and you can verify that your solution prevents it.

Worst case, you need to have new users try the tool with the solution in place, and verify they don't have problems.

-->

---


<!-- Three basic principles of defects:
* Don't create a Defect.
* Don't accept a D​efect.
* Don't pass on a Defect. -->