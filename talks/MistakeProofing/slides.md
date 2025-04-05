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

# Mistakes Should Be

## Obvious at a glance {v-click}

<img v-after src="/images/dashboard-warnings.jpg" alt="Dashboard Lights" class="max-height-120px" />

## Basically impossible {v-click}

<img v-after src="/images/laptop-ports.jpg" alt="Laptop Ports" class="max-height-120px" />


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

# Falling Into the Pit of Success

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
- [About_Classes](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes)
- [Extending Output Objects](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/extending-output-objects)
- [Custom Formatting Files](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/custom-formatting-files)

</v-clicks>

<!--

Microsoft likes to talk about the "Pit of Success".
Jeffrey Snover always says they tried to design PowerShell to
make it _easy to do the right thing, and hard to do the wrong thing_.

As tool authors, we get to take advantage of that design effort,
but we need to _keep that goal in mind_. Ok, I like to talk about _design_,
but I have less than 20 minutes right now, let's just restate the goal:

A well-designed tool makes it easy to do the right thing, and impossible to (or obvious when you) do the wrong thing.

For PowerShell tools, a big part of that is consistency and predictability.
This slide is to remind you that there's a lot of guidance about
how to write _consistent_ and _predictable_ commands.

If you search for _any_ of these bullet points
you will turn up **official** documentation (on learn.microsoft.com)
with a lot more details.

- [click] We have a set of approved verbs, which help users identify what a command does.
- [click] We have guidelines for picking nouns. Here's a hint: use the name of the _type_ of the object you're going to output.
- [click] We have a set of common parameters, and help for implementing them. These help everyone understand your commands and use them safely.
- [click] We also have an _extended_ list of ["standard" parameter names and types](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/standard-cmdlet-parameter-names-and-types), over a 125 different parameter names that are usually well understood across 7 categories, and guidelines for the data types you should use for them.
- On top of that, [click] We have a lot of options for _validating_ parameter input
- And [click] To give you back some naming flexibility, there are command aliases
- [click] And parameter aliases, so you can help people _find_ the right command or parameter, when you know some people will guess wrong.

We also have a lot of tooling in the language for implementing things consistently:

- [click] We have parameter sets to help you design complex commands with more than one way of using them
- [click] We have design and implementation support for wildcard characters
- [click] And standard parameters for filtering input

Finally, remember that PowerShell also has built-in support for
[click] binding parameters from pipeline input objects _and their properties_,
and therefore, you should consider [click] writing your own data classes,
but you can also [click] extend the built-in types instead, and you have
[click] total control over how those objects are displayed...

All of this design work was done by Microsoft to make it easy for you to help users _do the right thing_, and _discover_ the **best** way to use the tools that you write.

Let's look at a few more concrete examples:
-->

---

# Make Mistakes Impossible

<v-switch>
<template #1>

## Use CmdletBinding to Support Common Parameters

<!-- Highlight lines 4 through 6 -->

```powershell {4-6}
class Player { [string]$Name; [Position]$Position; [string] ToString() { return $this.Name } }
class Position { [int]$X; [int]$Y; [string] ToString() { return "" + $this.X + ", " + $this.Y } }

function Move-Player {
    [CmdletBinding()]
    param(
    ...
```

</template>
<template #2>

## Strongly Type Variables and Parameters

<!-- Highlight lines 1 and 6 -->

```powershell {1,6}
enum Direction { North; East; South; West }

function Move-Player {
    [CmdletBinding()]
    param(
        [Direction]$Direction,
        [int]$Distance,
        [switch]$Force
    )
    ...
```

</template>
<template #3>

## Carefully Choose Parameter Names

```powershell {6,7}
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

## Use Validation attributes

```powershell {1,4-10,13}
[ValidateSet("North", "East", "South", "West")]
[string]$CardinalDirection,

[ValidateScript({
    if ($CardinalDirection -eq "North" -and $Player.Position.Y - $_ -lt 0) {
        throw "You can't move that far North. The edge is only $($Position.Y) away."
    }
    $true
})]
[ValidateRange(1, 8)]
[int]$DistanceInMeters,

[ValidateScript({ Test-Path $_ })]
[string]$Path
```

</template>
<template #5>

## Use ArgumentCompleter

```powershell {3-13}
[ValidateSet("North", "East", "South", "West")]
[Direction]$CardinalDirection,
[ArgumentCompleter({ param($Name, $Parameter, $Partial, $Ast, $Bound )
    @(switch($Bound.CardinalDirection) {
        North { ($Player.Position.Y)..0 }
        South { (8-$Player.Position.Y)..0 }
        East  { (8-$Player.Position.X)..0 }
        West  { ($Player.Position.X)..0 }
        default {
            ($Player.Position.X, $Player.Position.Y, (8 - $Player.Position.X), (8 - $Player.Position.Y) | Sort -Desc)[0]..0
        }
    }) | Where { $_ -gt 0 } # Zero isn't a valid move
})]
[int]$DistanceInMeters
...
```

See also ... IValidateSetValuesGenerator, ArgumentCompletions

</template>
<template #6>

## Support ShouldProcess for -WhatIf and -Confirm

```powershell {1,13}
[CmdletBinding(SupportsShouldProcess, ConfirmImpact="High")]
param(
    [Direction]$CardinalDirection,
    [int]$DistanceInMeters,
    [switch]$Force
)
switch($CardinalDirection) {
    North { $NewPosition = [Position]@{ X = $Player.Position.X; Y = $Player.Position.Y - $DistanceInMeters; } }
    East  { $NewPosition = [Position]@{ X = $Player.Position.X + $DistanceInMeters; Y = $Player.Position.Y } }
    South { $NewPosition = [Position]@{ X = $Player.Position.X; Y = $Player.Position.Y + $DistanceInMeters;  } }
    West  { $NewPosition = [Position]@{ X = $Player.Position.X - $DistanceInMeters; Y = $Player.Position.Y } }
}
if ($Force -or $PSCmdlet.ShouldProcess($Player.Name, "Move ${DistanceInMeters} meters ${CardinalDirection} to ${NewPosition}")) {
    ...
```

</template>
</v-switch>

<!--

There are many ways to prevent mistakes in PowerShell.

<p class="text-sm text-green italic">Remember: To run these as demos, pre-run demos-1.ps1</div>

[click]Always use CmdletBinding. It's necessary to support the common parameters that users expect, and it's the easiest way to make sure users can **only** pass the parameters you expect.

[click]Strongly-typed parameters can prevent a lot of mistakes (or at least, prevent them from executing).

Ok, now check out those parameter names. Remember....

[click]Carefully choosing names for your commands and parameters, makes them easier to use. "CardinalDirection" is more specific than "Direction" -- this helps your user eliminate "Up" and "Down" or "Left" and "Right" as options. "DistanceInMeters" is also more specific than "Distance" -- having units in the parameter name eliminates guessing, and the nead to consult the documentation. You **can** add "Direction" as an alias to "CardinalDirections" so people can still use that, or to match pipeline object properties, but if you leave it off, all your parameters start with different letters, making them easier to tab complete.

[click]Validation attributes can do some of the same things as strongly-typed parameters, but they can be more flexible, and can even take other parameters into account.

[click]I put a note at the bottom of this slide about ArgumentCompletions, it's like ValidateSet, but for just completion, without blocking other values.

IValidateSetValuesGenerator is similar, but more dynamic, since it executes code to calculate the possible values.

But ArgumentCompleter is the most powerful. It gives us dynamic, context-aware tab completion that is one of the best ways to help users avoid mistakes -- and it lets you consider the AST and the already bound parameters. You can write it inline, as I did in this example, or you can use the `Register-ArgumentCompleter` command to even add completion for commands you didn't write.

[click]When you can, support ShouldProcess so users can run `-WhatIf`, and remember to set ConfirmImpact=High if you do something irreversible.

So far, we've only talked about the user interface to your functions and modules, but what about when we're writing the code itself?
-->

---

# Never Repeat a Mistake

## Write Regression Tests {v-click}

- Made a mistake? {v-click}
- Write a test! {v-click}
- Fix the mistake {v-click}
- Integrate the test {v-click}

## Use PSScriptAnalyzer {v-click}

Consistency (noun): Reliability, uniformity, or conformity. Logical coherence. A singular way of doing things. {.text-color-yellow v-click}

### Consistency facilitates intuition {v-click}

### Consistency increases maintainability {v-click}

<!--
## What would you all say is the best way to **stop** yourself from _repeating_ a mistake?

My answer is: [click]**regression tests**.

- [click]Any time you find a mistake...
- [click]Write a test that fails because of that mistake
- [click]Fix the mistake so that the test passes
- [click]And then ... make sure that test runs every time you make a change

Over time, your project will build up a collection of test cases highlighting previous mistakes, and not only will this prevent you from repeating mistakes, if you label them well, they can serve as a valuable learning tool for people who are joining a project for the first time.

Speaking of ways to help new people avoid mistakes...

## [click]Use PSScriptAnalyzer

Remember our definition from earlier, when we were talking about the pit of success?

[click]PSScriptAnalyzer will help you remember a lot of the rules we talked about from the PowerShell design.

It's a linter. It checks for obvious errors and common bugs,
and helps you to identify style and consistency issues.
[click]You might file that under the category of making mistakes more obvious,
but I like to think mistakes have not been made until we try to run the code,
so if you [click]run the linter automatically (in VSCode, and in your CI/CD)
it can be like a levelling up from a spell-checker to a grammar checker,
and can _prevent_ mistakes from getting out.

Remember that you can also add your own rules, if you run into specific bugs or errors you can't detect with regression tests.

-->

---
layout: image-right
image: /images/PDCA-Cycle.webp
clicks: 14
---

# Continuous Improvement

<v-switch>
<template #0-14>

<h2>Plan-Do-Check-Act</h2>
<br/>

</template>
<template #1>

<ol>
<li v-click><strong>Plan</strong>: Identify your (possible) problems</li>
</ol>
</template>
<template #2-10>
<ol>
<li><strong>Plan</strong>: Identify your (possible) problems
    <div v-click="['3', '11']">
        <h3 v-click="['3', '11']" class="pl-2">The Five Whys <span v-click="['4', '11']" class="text-sm">Ask Why, Five Times.</span></h3>
        <h4 v-click="['5', '11']">Our deployments are failing</h4>
        <ol>
            <li v-click="['6', '11']">Why? Our "publish" step is failing to upload.</li>
            <li v-click="['7', '11']">Why? Some sort of error authenticating to the service.</li>
            <li v-click="['8', '11']">Why? It turns out the credentials are wrong.</li>
            <li v-click="['9', '11']">Why? Well, the password expired.</li>
            <li v-click="['10', '11']">Why? We forgot to change the password ahead of time.</li>
        </ol>
    </div>
</li>
</ol>
</template>
<template #10-14>
<ol>
<li><strong>Plan</strong>: Identify your problems<br/>... and possible solutions <br/>... and how to measure your results.</li>
<li v-click="['12','15']"><strong>Do</strong>: Implement and test (mistake-proofing) solutions.</li>
<li v-click="['13','15']"><strong>Check</strong>: Study the results. Compare solutions.</li>
<li v-click="['14','15']"><strong>Act</strong>: Adjust. Implement the best solution. Document. Train your team(s).</li>
</ol>
</template>
</v-switch>

<!--

Poka-Yoke is part of the discipline of continuous improvement, and I want to talk about that cycle for a minute.

Continuous improvement is not always about iterating on _the same_ product over and over.

In DevOps, particularly, we almost always have many products and projects,
and a wide range of different tools and solutions that we're responsible for.
So, I don't know about your teams, but mine tends to switch _between_ projects based on
external factors like ...

- What management is excited about this month
- What caused the most recent outage

But regardless of whether you're continually iterating on the same product,
or you just have an opportunity to do one or two cycles of improvements,
the process is basically the same.

[click] They call it: Plan, Do, Check, Act (PDCA).

Also known as the Shewhart cycle, this is based on the scientific method...

[click] The first step is always to identify a problem.

Frequently we're going through this because somebody _else_ **already** identified a problem, but even then ...

We need to understand the problem and determine why it happened (or at least come up with a hypothesis for the root cause).

The simplest form of root-cause analysis, we just call...

[click]The five whys.
[click]It literally consists of asking "why" five times; each time directing the question at the answer to the previous question.

So let's take an example. Say I come to you, and I say:

[click] Our website deployments are failing.

You say ...
- Why? [click]Because the "publish" step is failing to upload
- Why? [click]Because there was an error authenticating to the service
- Why? [click]Because the credentials were wrong.
- Why? [click]Because the password expired overnight.
- Why? [click]Because we forgot to change the password ahead of time.

This way, you dig deeper toward a root cause. (This technique _also_ came out of Toyota, by the way.)

Anyway. [click] Once we've identified a root cause, planning is about establishing objectives, brainstorming solutions, and determining how to measure success.

The simplified, single-player version of planning is:
1. Determine a root cause
2. Come up with at least two things you can try to avoid or detect that mistake in the future.

These might be some things we've discussed already, it might be new ScriptAnalyzer rules, additional error-handling code, or even process changes like pair-programming or adding AI Coding Assistants, etc.

[click]Do. Experiment. Design and test your mistake-proofing solutions. Run your unit tests, measure your results.
[click]Check. Evaluation. Study the results. Compare your solutions, verify that the changes improved results.
[click]Act. Adjust. Permanently implement the best solution, or determine why your solutions didn't improve the situation. Train your team(s) on the changes, etc.
-->

---

# Design By Writing ... Help <div class="inline-icon-btn">F1</div>

## _Plan:_ Write .EXAMPLEs for Common Scenarios {v-click}

## _Do:_ Implement Your Examples {v-click}

## _Check:_ Test Your Examples {v-click}

<h2><em>Act:</em> <span v-click>Document Your Interface <div class="inline-icon-btn">ALT</div> + <div class="inline-icon-btn">H</div></span></h2>

<!--

Here's my 2 minute summary of how to design tools:

[click]Plan. Come up with the scenarios you want to support, and write them down.

Write them as _examples_ in a comment at the top of your function.

[click]Do. Treat those examples as if they were _tests_, and write the code to make them work

[click]Check. Write regression tests to make sure your examples _always_ work

Honestly, I would love to _generate_ my help examples from tagged Pester tests,
because I like writing tests first. But we don't need sophisticated tooling for this.
We write an example, and we write a test named "Example 1" ... and so on.

Whenever anyone touches the documentation --or the "Example" tests-- we ensure during code review that the tests still match the documentation.

### One of the most compelling ways to help tool users succeed is to write _useful_ documentation.

So as part of the *Act*, as I'm finalizing the tool, adjusting and making my implementation permanent,

[click] I document.

- I *describe* the command.
- I write a short synopsis (to clarify the meaning of the verb and noun).
- I make sure there's a helpful description in a comment above each parameter.
- Finally, I add a .LINK to related commands, or the documentation on the website.

That first .LINK that is a URL will be used automatically for `Get-Help -Online`, even if you don't set it in the CmdletBinding attribute.

That's it.

<p class="text-sm text-green italic">NOTE: The PSScriptAnalyer rule does not test anything useful.</p>

-->
---

# Detecting Mistakes

## Error Handling & Logging { v-click }

<v-click>

```powershell {8-9|11,12-13}
function Move-Player {
    [CmdletBinding()]
    param()
    try {
        $MyInvocation.Instrument()
        Your-Code-Goes-Here
    # Special handling for errors you expect
    } catch [System.IO.FileNotFoundException] {
        Write-Error "The target game file was not found." -Recommend "Check the path and try again."
    } catch {
        Write-ErrorInformation -InformationAction $InformationPreference -InformationVariable global:MyGame_ErrorInformation
        Write-Error $_ -Recommend ("Please consider reporting this issue at https://github.com/Jaykul/DevOps2025/issues`n" +
                "  Include as much information as you're comfortable sharing from `$MyGame_ErrorInformation | Set-Clipboard")
    } finally {
        $MyInvocation.TraceEnd()
    }
}
```

</v-click>

<!--

We've talked about the relationship between the scientific method and the continuous-improvement cycle.
It also ties in to the pattern I suggested for writing regression tests.

The last thing that I really want to talk about is how do we detect mistakes?
For continuous improvement, we want to detect all mistakes, and capture as much information as possible.

### [click]In the software world, that means logging.

At a minimum, we want to log every error --every unhandled exception-- that happens in our code.
Obviously, we want to capture as much information as we can,
but for modules that we ship to other people, that get's complicated.

[click]Consider doing something like this.
When we know how to handle the error, we tell the user what to do.

[click]If we don't know how to handle it, we log it,
or at least we ask the user to include the information in an error report.

<p class="text-sm text-green italic">DEMO: dot-source talks\MistakeProofing\demos-1.ps1</p>

-->
