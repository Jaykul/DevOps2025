# Mistake-Proofing: Poka-Yoke for PowerShell scripts and functions

Mistake-proofing is a fundamental concept in continuous improvement, preventing defects by minimizing human errors. In this talk you'll learn about user scenarios and the 5 Whys, and how to apply the basics of root cause analysis and error prevention to your PowerShell scripts and functions. You will also learn to use specific Poka-Yoke techniques for PowerShell --from naming conventions and help messages to error messages-- to guide users, and prevent defects. On top of that, you'll learn how to handle (or not) errors and a couple of ways to capture them so you can prevent them in the future.

Learn about naming. Why parameters names matter. How to choose them, and what they have to do with your output objects.

Learn about documentation: what's the minimum amount of help we can write, and how to make sure your examples always work.

Learn about error handling! Which errors to handle and where, how to choose when to handle errors, and when to just log and output them.

---

Learn questions to ask before sharing, and how to to choose better parameters names.

Whether you've just written your first few scripts and never shared them with anyone, or you've been writing modules for coworkers for years

Say you've written some scripts, and now you want to share with your teammates -- or maybe you want to share them with the world.

- Handle errors when you can
- Output errors when you can't
- Options for better logging
- Questions to ask before sharing
- The minimum amount of help we can write
- Why parameter names matter, and how to choose them
- Outputting objects that are predictable and identifiable
- Binding parameters from the pipeline
- Determining what should go outside the process loop

At the end you'll have a checklist, some code snippets to help you meet it, and the knowledge of why you should do this work to make your scripts, functions, and modules more robust, and more intuitive for users.

notes: This is an update of a popular talk I gave in 2019 & 2023. Hopefully, this time, I'll be able to get through it without borrowing a laptop from the audience.
