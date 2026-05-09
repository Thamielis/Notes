———
description: Discover an easier, more efficient workflow with this outstanding IDE
title: These 5 VS Code features completely changed how I work
image: https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/09/visual-studio-code.jpg?w=1600&amp;h=900&amp;fit=crop
———

Visual Studio Code (VS Code) is the undoubted king of coding editors, with 75% of respondents to the 2025 Stack Overflow Survey citing it as a tool they use regularly. It towers above not only strong competitors like Vim, Cursor, and Notepad++, but also over its fuller-featured parent project, Visual Studio.

VS Code excels as a text editor, but these extra features elevate it even further, and they’re easy to miss or overlook.

##  Command palette and file search

###  A brilliant idea that’s often imitated

Wherever you are in VS Code, whatever you’re doing, you can run any command by pressing **Ctrl**+**Shift**+**P** (Windows) or **Shift**+**Cmd**+**P** (macOS).

 This drop-down panel lists every command available to you in VS Code, commands that would otherwise be buried in menus or behind buttons. You can—and should—use the palette’s integrated fuzzy search to find the command you’re interested in. It also highlights recent items and displays keyboard shortcuts so you can learn as you go.

Using **Ctrl**+**P** / **Cmd**+**P**, you can open the similar Quick Open palette, which shows files in your project and recently opened files. Again, the built-in fuzzy search is excellent, and this is a much faster way of getting to a file once you’re used to it.

Both these features have been widely borrowed, especially the command palette in editors like Zed and [Sublime Text](https://www.howtogeek.com/757442/why-sublime-text-is-great-for-writers-not-just-programmers/).

##  Quick, convenient navigation

###  Never lose your place again

It’s easy to lose track when you’re jumping around a codebase, and VS Code’s navigation shortcuts make it easier than ever to move between files. Press **F12**, and you’ll immediately jump to the definition of whatever’s under your cursor. But then what?

If you ever find yourself losing your way, try the Go Back and Go Forward commands, which have convenient keyboard shortcuts: **Alt**+**Left/Right Arrow** on Windows and **Ctrl**+**Hyphen** or **Shift**+**Ctrl**+**Hyphen** on macOS.

These shortcuts are the coding equivalent of Back/Forward in your web browser, and are just as useful. As with any keyboard combo, they might take a few goes to lodge in your muscle memory, but once they have, you’ll wonder how you ever did without them.

##  Rename with confidence

###  Like search & replace all, but much more convenient

When you need to rename a function or variable, you also need to change all its corresponding calls and references. This is either a painstaking manual task or one that you mitigate slightly with a global search and replace. The problem is, a straightforward text replacement isn’t always what you want, so you’ll end up having to step through each instance, just to be sure you’re doing the right thing.

VS Code recognizes how stupid this situation is and fixes it. Press **F2** while your cursor is inside a symbol—like a variable or function name—you want to change. Type in your replacement, and VS Code will refactor your files, with an optional preview to check what’s going to happen before applying it.

 The editor will apply simple changes immediately if it can apply them unambiguously. Otherwise, you’ll see in the preview which changes VS Code thinks you should and shouldn’t make, selecting the appropriate ones by default.

For example, the IDE is clever enough to recognize that you may or may not want to replace matching text in a string.

 Once you’ve used this feature a few times, you’ll never go back to standard search and replace again.

#####  Lenovo ThinkPad X1 Carbon with Linux

The Lenovo ThinkPad X1 Carbon with Linux takes everything that is great about the iconic ThinkPad line, adds powerful hardware, and lets you choose between Fedora or Ubuntu pre-installed.

Expand Collapse 

##  Explore the differences between files

###  Find out what’s changed, right in the editor

Code-diffing has long been the preserve of the command line, but editors are starting to take on the job, and they’re doing it well. What better place to compare two files than the editor you’re already using?

In VS Code, just right-click a file and choose **Select for Compare**, then right-click another and choose **Compare with Selected**. You’ll see a side-by-side view of the two files, with changes clearly highlighted as removals in red and additions in green.

 Of course, you’ll see a similar diff view when looking at the Timeline view for a git-controlled file, or [the git changes for a file](https://www.howtogeek.com/devops/how-to-apply-git-commit-diffs-to-different-files/) in your working tree.

##  Quick boilerplate code with Emmet

###  Supercharged macros for HTML, CSS, XML, and more

Emmet is one of those extensions that is pre-installed, even though you’ll never know about it unless you go looking for it. It’s also a fairly niche-use tool but, for me, it’s quickly become essential.

###  Subscribe to our newsletter for VS Code power tips

Unlock deeper VS Code know-how by subscribing to the newsletter — curated deep dives on overlooked features, refactor and rename workflows, Emmet and extension recommendations, and practical file-diff and navigation tips.

—

Get Updates 

By subscribing, you agree to receive newsletter and marketing emails, and accept our [Terms of Use](https://www.valnetinc.com/en/terms-of-use) and [Privacy Policy](https://www.valnetinc.com/en/privacy-policy). You can unsubscribe anytime.

I tend to write a lot of HTML and CSS in [the general pursuit of web development](https://www.howtogeek.com/visual-studio-codes-latest-update-is-a-big-deal-for-web-development/), and it always involves regurgitating a lot of boilerplate—until VS Code, that is. Emmet lets you automate away all that manual tag-typing using abbreviations that look [a bit like CSS selectors](https://www.howtogeek.com/tips-for-getting-started-with-modern-css/). For example, here’s an Emmet abbreviation:

```
ul#todo>li*5

```

In Emmet syntax, this represents a ul with id “todo” containing five empty li elements. Enter that abbreviation in an HTML file in VS Code, and it will recognize it as an Emmet abbreviation.

 

 Then, press **Enter** or **Tab** to accept Emmet’s expansion, and you’ll get the full markup equivalent, instantly in your editor:

 

—
