---
title: Inline Message
---
==============

::: {.container .intend}
:::

Purpose
-------

A inline message is a small panel that informs users of a non-critical
problem or special condition. It is embedded in the content and should
not overlap content or controls. The panel has four visual style options
which can be used for neutral messages, success conditions, warnings,
and errors. It can also be given buttons.

![The four different levels of inline messages.](/hig/Message5.png)

Examples
--------

![An inline message is used for feeback after an upload has been
completed.](/hig/Message-example.png)

Guidelines
----------

-   Use inline messages in cases of non-critical problems that user can
    solve.
    -   Use `negative feedback`{.interpreted-text role="iconred"} (aka
        error) as a secondary indicator of failure, e.g. if a
        transaction was not completed successfully.
        -   Show the information on a warning level in case of relevant
            information that does not concern the current workflow, e.g.
            No Internet connection available.
    -   Use `positive feedback`{.interpreted-text role="noblefir"} to
        notify about user-initiated processes, e.g. to indicate
        completion of background tasks.
    -   Use `opportunistic interaction`{.interpreted-text
        role="plasmablue"} (aka notification) to acknowledge the user
        about options that he or she might be interested in, e.g.
        \"Remember password?\"
-   Display the information immediately.
-   When users dismiss the inline message, don\'t display any other UI
    or start any other side effect.
-   Don\'t add controls to the inline message other than action buttons
    for opportunistic interaction.
-   Consider to show a
    `notification </platform/notification>`{.interpreted-text
    role="doc"} if information does not concern the current workflow.

Is this the right control? / Behavior
-------------------------------------

### Negative Feedback

The inline message should be used as a secondary indicator of failure:
the first indicator is for instance that the action the user expected to
happen did not happen.

Example: User fills a form, clicks \"Submit\".

-   Expected feedback: form closes
-   First indicator of failure: form stays there
-   Second indicator of failure: a inline message appears on top of the
    form, explaining the error condition

When used to provide negative feedback, an inline message should be
placed close to its context. In the case of a form, it should appear on
top of the form entries.

An inline message should get inserted in the existing layout. Space
should not be reserved for it, otherwise it becomes \"dead space\",
ignored by the user. An inline message should also not appear as an
overlay to prevent blocking access to elements the user needs to
interact with to fix the failure.

When used for negative feedback, don\'t offer a close button. The
message panel only closes when the problem it informs about (e.g. the
error) is fixed.

### Positive Feedback

An inline message can be used for positive feedback but it should not be
overused. It is often enough to provide feedback by simply showing the
results of an action.

Examples of acceptable uses:

-   Confirm success of \"critical\" transactions
-   Indicate completion of background tasks

Example of wrong uses:

-   Indicate successful saving of a file
-   Indicate a file has been successfully removed

### Opportunistic Interaction

Opportunistic interaction is the situation where the application
suggests to the user an action he could be interested in perform, either
based on an action the user just triggered or an event which the
application noticed.

Example use cases:

-   A browser can propose remembering a recently entered password
-   A music collection can propose ripping a CD which just got inserted
-   A chat application may notify the user a \"special friend\" just
    connected

Appearance
----------

A basic inline messages consists of an icon and text. It can contain an
optional close button and
`buttons <../navigation/pushbutton>`.

![Inline message with a custom icon and a close
button.](/hig/Message1.png)

![Inline message with two buttons.](/hig/Message2.png)

If there is not enough space to display all the buttons, an overflow
menu is shown instead.

![Inline message with overflow menu.](/hig/Message3.png)

Code
----

### Kirigami

> -   `Kirigami: InlineMessage <InlineMessage>`{.interpreted-text
>     role="kirigamiapi"}
>
> ::: {.literalinclude language="qml"}
> /../../examples/kirigami/InlineMessage.qml
> :::

### Qt Widgets

> -   `QtWidgets:  KMessageWidget <KMessageWidget>`{.interpreted-text
>     role="kwidgetsaddonsapi"}
