https://medium.com/undabot/visualizing-use-cases-using-mermaid-js-63a5f1b7d2f

> Learn how to transform the textual use case into a markup language code that can be easily updated and generate a flow diagram out of it using mermaid.js.

# Visualizing use cases using mermaid.js | Undabot
## Visualizing use cases using mermaid.js

## It was said a million times before, and I’ll say it again — “a picture is worth a thousand words”. There. I feel a bit cheap now, but it had to be done because that statement applies to the topic of this post so well that it might as well be written specifically for it.

[

![Vedran "Brko" Krizek](https://miro.medium.com/v2/resize:fill:44:44/1*bHWmpd4pRprSUNXBNQQLaw.jpeg)



](https://medium.com/@vedran.krizek?source=post_page---byline--63a5f1b7d2f---------------------------------------)

[

![Undabot](https://miro.medium.com/v2/resize:fill:24:24/1*Vl0e7nSVGIeVA2PAZ5YuqQ.png)



](https://medium.com/undabot?source=post_page---byline--63a5f1b7d2f---------------------------------------)

![](https://miro.medium.com/v2/resize:fit:700/1*U-QqUe0RxEoDStRWMikqog.png)

However, even the pictures do not come *entirely* without problems on their own. The main issue is that it typically takes more time to draw a good descriptive diagram than it takes to write a good descriptive textual use case, and what’s even more important, the pictures tend to be significantly more “expensive” to update and change robustly. This is especially true when we’re talking about non-trivial changes. That is why so far I have avoided using user flow or sequence UML diagrams and preferred well-written use cases over them.

In my experience, diagrams just weren’t “cheap” enough when it came to keeping them up to date to make them useful for anything more than occasional supplemental material for the requirements otherwise centered around written use cases and acceptance criteria.

I generally consider the action to be “cheap” when it can be completed in a couple of minutes at the most, while still being robust and not prone to errors. For example, draw.io is undoubtedly a good and very capable tool, but it does not allow for “cheap” diagram updates in my opinion.

This is because, while it’s comparatively easy to change where a particular arrow is pointing or to change the text within the particular diagram node, etc. — you have to be very careful not to mess something up while doing so. And when you *do* mess something up, it’s typically quite hard to spot and quickly fix — therefore drawing/updating diagrams using a tool like draw.io is not “cheap” (in the meaning of the word “cheap” that I’ve described above).

The reason why I’m focusing so much on the “cheap/expensive” topic here is that one rule of thumb that I’ve learned over my career as a business analyst, solution designer, and application architect is that whenever any action is not “cheap” it will get omitted/skipped very quickly as soon as the general workload gets uncomfortably high (the good old “we’ll do it just after we finish this” fallacy) — and in case of documentation, this leads directly and quickly to out-of-sync documentation and the documentation “rot” in general.

So, to sum things up a bit — we have the following “problem”:

> The use cases are fairly understandable (when written well) and are very cheap to update/change robustly. The diagrams are, on the other hand, significantly easier to understand than the typical textual use cases (especially for complex scenarios) but are not cheap to update/change.

Therefore, ideally, what we need is something that combines the best elements of the two — and that’s where text-to-UML tools enter the picture, and in particular, the tool that is the subject of this post — mermaid.js.

In a nutshell, Mermaid.js is a tool that can produce a diagram image from the markup “code” (definition) written in its custom, very straightforward, and versatile markup language.

To illustrate how mermaid.js works and how it can be used in a real-world scenario, we’ll explore visualizing a real-world use case — i.e. transform the textual use case into a markup language code that can be easily (“cheaply”) updated and generate a flow diagram out of it using mermaid.js.

For the particular example here, we’ll use a non-trivial user level use case that describes the user login process on a hypothetical mobile app and which includes a few extensions. Also, the format used will be based upon the one suggested by Alistair Cockburn in his (brilliant) “Writing effective use cases” book.

So with all that out of the way, let’s start by checking out the use case on which we’ll be working:

## The use case - “The user logs into the system”

## Trigger Event

-   A user asks the system to log them in

## Main success scenario

1.  The system renders the login screen and asks the user to provide their credentials
2.  The user provides its credentials (email and password) and asks the system to log them in
3.  The system asks the backend API to verify users’ credentials
4.  The backend API confirms that the provided credentials are valid
5.  The backend API confirms that the user has an active subscription
6.  The backend API provides the system with an authentication token for the user
7.  The system logs the user in
8.  The main success scenario ends.

## Extension 2a: The user authenticates via 3rd party system (Google, Facebook)

2a1. The user asks the system to authenticate it via 3rd party authentication system (Google or Facebook)

2a2. The system redirects the user to the appropriate 3rd party authentication system

2a3. The user successfully authenticates using 3rd party authentication system and the 3rd party authentication system provides the system with the user’s identification information

2a4. The system asks the backend API to confirm that the user has a valid account and a valid subscription

2a5. The backend API confirms that the user indeed has a valid account and a subscription

2a6. The backend system provides the system with the appropriate authentication token

2a7. The main success scenario resumes from step 7

## Extension 2a4a: The user does not have a valid account

2a4a1. The backend system determines that the user does not have a valid account and informs the System of that fact

2a4a2. The system informs the user that their credentials are not valid

2a4a3. The main success scenario restarts from step 1

## Extension 2a4b: The user does not have a valid subscription

2a4b1. The backend system determines that the user does have an account but does not have a valid subscription and informs the System of that fact

2a4b2. The system informs the user that it does not have a valid subscription, and instructs them to go to the web to buy a subscription

2a4b3. The main success scenario terminates

There is nothing fancy going on here. We have 3 extensions and a fairly standard login process with 3rd party authentication. Perhaps the extension dealing with 3rd party authentication is a use case of its own, but for now, let’s leave it as is.

Now let’s see how we might use mermaid.js to visualize this.

## Step 1: Documentation & learning

The first thing you want to do is to read up (at least a bit) on very good documentation provided at: [https://mermaid-js.github.io/mermaid/#/](https://mermaid-js.github.io/mermaid/#/)

You don’t **absolutely need** to read the entire document to follow this post and to try the examples I’m providing here — but I strongly encourage you to read it completely at least once, as it will certainly provide you with the context and allow you to better understand the code that will follow in subsequent sections.

## Step 2: Installation & setup

Well, you’re in luck, you don’t have to install anything to try out the stuff in this post.

However you certainly could install mermaid.js locally if you need to, and there are several reasons for doing so that are outside the scope of this post, but if you just want a taste of that sweet Text-to-UML action right away — the mermaid.js community have you covered as there is a live editor at: [https://github.com/mermaid-js/mermaid-live-editor](https://github.com/mermaid-js/mermaid-live-editor) which you can either use directly (there is a link to live online version of the editor in the readme text) or you can run it locally, using a published docker image.

## Step 3: Write the markup

Finally, it’s time to write some code (markup). The first thing that we want to try here is to see whether we can translate this use case to mermaid.js markup code in a way where we don’t have to change how we normally write and structure the use cases.

The reason here is that we still want to use all the best practices for writing textual use cases, as while it’s generally true that the pictures are worth a thousand words, those words still need to be meaningful, well written and structured into coherent sentences, otherwise, you just end up with a nice picture depicting something broken or inconsistent.

Ok, now that we have all the tools we need (live editor) and have set a vague goal (change the use case structure as little as possible), we can now try to “code” our graph.

And here it is. You can check the code first and then I’ll describe the actual techniques and features used later.

A full representation of our original use case in mermaid.js markup

One thing that should be obvious right away is that the content and most of the structure within this mermaid.js markup remain unchanged from the “original” use case. I found that fact extremely important — as it means that I’ll still be able to write the use cases using the standard best practices and formats — and will be able to mix the two approaches as I see fit. That is a clear “win” for mermaid.js in my view.

I also think it’s important to point out that the code above is really on the “hello world” level of complexity, i.e. no fancy stuff there, I’ve used 3 node types, filled them with the text of the individual use case steps, and then connected them using “ASCII arrows” and that was pretty much it.

Only two additional techniques/features that I’ve utilized besides the most basic flow syntax are:

-   I’ve manually added line breaks in the textual content rendered inside individual diagram nodes. Without that the content was simply too long to be rendered as one long line and it would visually “break” the resulting diagram. And since mermaid.js does not split the content into multiple lines automatically, you need to do that manually by adding HTML tags in your textual content — I’ve used simple break tags, but you could use paragraphs, divs, or whatever rocks your boat and is supported by the mermaid parser.
-   I’ve colorized trigger event nodes as well as final outcome nodes — using “style” (style SUCCESS fill:#cfc) so that they “pop out” a bit in the final diagram. You can do much much more complex styling with this feature, but for me, that was just enough.

Ok, the code is ready, now let’s render it and see how our diagram looks.

## Step 4: Render the diagram

![](https://miro.medium.com/v2/resize:fit:700/1*IkFni8ojMI5SZkU3y4UnsA.png)

Out-of-the-box rendering of our example use case

Beautiful (keep in mind that I’m a business analyst, so if you are the UI/UX designer, I’m aware that your eyes are probably bleeding right now and your heart is filled with rightful rage at my ignorance and obvious blindness). And there are also easy ways to customize the look & feel enough to satisfy even the most visually “picky” among us. Also, it’s quite hard to read.

Let’s try rotating this a bit (it boils down to a single line change — from **flowchart** TD**;** to **flowchart** LR**;** — where TD stands for “Top-Down” and LR stands for “Left-Right”. Easy)

![](https://miro.medium.com/v2/resize:fit:700/1*LA6Tpp8UPJ-uLsq4nB4mKw.png)

A horizontal version of our original use case diagram

Well, it manages to somehow be both better and worse at the same time. Still not readable though. So what are our options here? Luckily for us, are two easy ones.

One is Kroki (I’ll explain this one a bit later), and the other is to make our use case simpler (which I should have done in the first place, as that extension that deals with 3rd party authentication should be a use case of its own).

So let’s cut out the Extension 2a. And what we end up with is this:

Our original use case, but with extension 2a removed

And this yields the following diagram:

![](https://miro.medium.com/v2/resize:fit:700/0*IfvhSQZDTWw-sgac)

A diagram of our original use case with extension 2a removed

Ok, now that’s more like it. Still could be a bit more readable, but this is now quite manageable.

Now, what about that remaining extension 2a? We’ll make a standalone use case out of it (that’s not mermaid.js related, but since we’re already here…) and generate the graph out of it.

The separate use case would look something like this:

Extension 2a — as a standalone use case

And that results in the following diagram:

![](https://miro.medium.com/v2/resize:fit:681/0*u8Fla1mFh_s8aYYY)

A diagram of the extension 2a as a standalone use case

Well, I can certainly live with that.

## Step 5: Integrate the diagram

The diagrams are great, but in isolation, they don’t do much, they need to be integrated into the requirements documentation where they can be scrutinized, commented on, reviewed, etc., and here are at least three easy ways to do so:

## 1\. Embedding png images directly

That one is a no-brainer, as this is how the images got integrated into this post. Mermaid.js live editor produces PNG and SVG images out-of-the-box and those can easily be integrated into your documents or shared for commenting.

## 2\. Using kroki.io

I’ve mentioned [kroki.io](https://kroki.io/) briefly before, and this is one additional way you can integrate your diagram in whichever form of documentation you have on hand.

What kroki.io does is it renders SVG images from diagram code provided to its services through either deflated base64 encoded GET parameter or via POST payload and finally provides you with the URL of the resulting SVG diagram. And it works great both with mermaid.js and about two dozen other text-to-UML tools.

So for example, the graph in our last example would be represented with the [following link](https://kroki.io/mermaid/svg/eNqNVFtv2jAUfu-vONJUjT6gqVD60E6dgKUd0tYhErRNCFXGcYjVYCPbgaFp_30nvoRko-p4MifH3-VcnBVyT3OiDCQfb88Af-fnkCi-XjMFbMeEscFkNnl4iGadRZIzKDV-I_pZg8F_-qAN24CRUMh1FdkAF-9XCt7dYSYXNsYVPEi5LhhIBfcjIJTKUhi9vOh27-JLx6zNARM8FWS8KG7eUJqdBVlfCBegS0qZ1qApE0RxaT_Gl1aYl6JYyhWjxumzalEdnr0qst0quVWcGAZ9lcIW7R-AlJghDKfEcCk81rKS13Py4t6v2r1XkZVF0brJNDgS5_wV9A-_A3K3-4Ppiqt_jDxKDNwPJ5_ns8hH-4vK0Suo3iV63PGUtZq05yavi_JW-0zMQowsoHCRSbWxZ2v_ypNfNWtct39F6DMTaWMMqBQZV0GGyYk59iEnGgjsSMHxRrnSVPFtTTTwRANb5wA8nE4CpLZoNXATU-BIGb5jLdS6voO6vtc-cr1I_hV_omSerC5cc3b-qr6RiGWNzMfjKI4dUxje6KdhQld5A3ID9SClEumENOgCxYfS-PWoxdtRiL4nA-JXxZ1PeUiZYWrDBdMnG8DQSKB1lCKwVavp7pwW1axs2CTkdePiahY7DTJzrBn2ZBmU9xrKe81RagK4Za3uOgZu4H_FOC3aqNJvPuoQkMt9NZNrhvYEWzY1oLBv0egpno_i8WwyTSZfH5-m89n40zCObm3rXP1dNzsLbw5fuYZWLpYXzdfLZ4fXK6MOxK9xJ_avFrgmVQ9G67rP89cz6q-_qLMzr0SsyoNuVaRyvmerFvSLGEeyPw3e-TA). Also, left-right direction flow diagrams finally [work beautifully as well](https://kroki.io/mermaid/svg/eNqNVFtv2jAUfu-vONJUjT6gqVD60E6dAKUdUtehJGibEKqM44DVYCPbgaFp_30nvoRko-p4MifH3-VcnBdyT9dEGXiMb88Af-fnkCq-WjEFbMeEscE0njw8RHFnnq4ZlBq_Ef2iweA_fdCGbcBIKOSqimyAi49LBR_uMJMLG-MKHqRcFQykgvsREEplKYxeXHS7d8mlY9bmgAmeCnJeFDfvKM3PgqwvhAvQJaVMa9CUCaK4tB-TSyvMS1Es44pR4_RZtagOz14V2W6V3CpODIO-ymCL9g9ASswQhlNiuBQea1HJ6zl5Se9X7d6ryMuiaN1kGhyJc_4G-qffAbnb_cF0xdU_Rp4kBu6Hk8dZHPlof145egPVu0SPO56xVpP23KzrorzXPhOzECMPKFzkUm3s2dq_8uRXzRrX7V8S-sJE1hgDKkXOVZBh1sQc-7AmGgjsSMHxRrnUVPFtTTTwRANb5wA8nE4CpLZoNXATU-BIGb5jLdS6voO6vtc-cj1P_xV_omSerC5cc3b-qr6RiGWNzMbjKEkcUxje6KdhQld5A3ID9SBlEumENOgCxYfS-PWoxdtRiL6nA-JXxZ1PeciYYWrDBdMnG8DQSKB1lCKwVavp7pwW1axs2CTkdePiapY4DTJ3rDn2ZBGU9xrKe81RagK4Za3uOgZu4H_FOC3aqNJvPuoQsJb7aiZXDO0JtmhqQGHfotFzMhsl43gyTSdfn56ns3j8eZhEt7Z1rv6um525N4evXEMrF4uL5uvls8PrlVMH4te4k_hXC1yTqgejdd3n-es59ddf1dmZVSKW5UG3KlI537NlC_pVjCPZHzHi-TY) and are no longer “squashed” and unreadable.

Please note that if you’re about to include the link to your diagram in the public resource with very high traffic, then you need to make sure that you don’t include the kroki.io link directly as the free service is not meant to handle high traffic loads. However, since you can either download and host the resulting SVG file yourself or even easily set up a local kroki.io instance via docker image, this shouldn’t be an issue and should in no way prevent you from using this excellent tool.

## 3\. Using the google docs add-on

If you use google docs for writing requirements, as I do, then there is another option, an [add-on](https://workspace.google.com/marketplace/app/mermaid/636321283856) for google docs that lets you edit the mermaid.js markup and generate diagrams right within the google document content itself.

I find it to be mostly a convenience tool as using the live editor and adding the resulting PNG or SVG images manually is real easy (YMMV with integrating SVGs though, but that’s a topic all in itself), but it does involve a few extra steps that this add-on removes and streamlines the overall process somewhat.

## The conclusion

I think that the Text-to-UML tools are something that every business analyst/requirements writer/solution designer should add to their “toolbox”, and Mermaid.js is an excellent tool that you might want to consider if you haven’t already done so.

The big thing it did for me personally is that it broke the perceived barrier I’ve had that prevented me from using diagrams fully (except when I had absolutely no other option) — and it’s kind of liberating. Also, it allowed me to integrate it into my own “toolbox” without needing to change how I write and structure use cases, or in other words — “cheaply”.

I’ll still write textual use cases for sure, but I won’t shy away from diagrams anymore, and the two do make a very powerful combo which should make my work easier and the overall results of it better than they were before.

It might do the same for you.
