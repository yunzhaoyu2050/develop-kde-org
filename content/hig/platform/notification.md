---
title: Notification
weight: 3
---

Notifications are a way to inform users of your app about events, even
if the applications has no focus, is minimized, or is only running in
the background.

Examples
--------

![Update notification](/hig/Notification.png)

Guidelines
----------

### Is this the right control?

Use notifications to inform the user of events that are of interest,
even if your app is not in foreground, but don't spam the user with
notifications.

-   Completion of long running tasks that the user has started
    manually
-   Incoming communication from other users
-   Hardware related events like low battery, lost network connection,
    running out of disk space

Don't use a notification for:

-   Operations that don't require user interaction, such as
    background processes, syncing, or updates
-   Advertising, rating or feedback requests, or other annoyances
-   If an unexpected or potentially dangerous condition has been
    reached and the user must make a decision. Use an
    `/components/assistance/message`
    instead.
-   Don't send notifications if an user has never opened your
    application

### Behavior

Notifications are provided by the system to the user, and foremost the
user settings for notification govern the behavior and appearance of
notifications. But there are several options to influence and enrich the
behavior of your notifications.

#### Persistence

Making a notification persistent will prevent it from closing after a
timeout. Your app must revoke the persistent notification, if the reason
for the notification no longer applies, like a power adapter was plugged
after a "Laptop battery is almost empty" notification. Use this if the
notification requires user interaction, e.g. a device is asking for
pairing confirmation.

#### Urgency

It is recommended that a notification carrys an urgency hint:

-   0 -- Low, "Matt is now online", "You just plugged in your AC
    adapter"
-   1 -- Normal, "You have new mail"
-   2 -- Critical, "Laptop battery is almost empty"

#### Actions

You can add up to three action buttons to the notification to enable the
user to react to the event without having to go to the app itself.

#### Preview

You can specify a URL to an image associated with the notification. The
image will be displayed as a preview in the notification.

![Notification with a preview image](/hig/Notification2.png)

Code
----

```c++
KNotification *notification = new KNotification("contactOnline", widget);
notification->setText(i18n("The contact %1 has gone online", 
contact->name());
notification->setPixmap(contact->pixmap());
notification->setActions(QStringList(i18n("Open chat")));
connect(notification, SIGNAL(activated(unsigned int)), contact , 
                      SLOT(slotOpenChat()));
notification->sendEvent();
```

Use [KNotification](https://api.kde.org/frameworks/knotifications/html/classKNotification.html)
to send notifications to the [Plasma Workspaces](/introduction/architecture).
