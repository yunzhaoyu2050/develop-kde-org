---
title: Creating the Main Window
weight: 2
description: >
  This tutorial shows you the magic of an application's most important thing: The main window.
---

## Summary

This tutorial carries on from [First Program Tutorial](../hello_world) and will introduce the [KXmlGuiWindow](docs:kxmlgui;KXmlGuiWindow) class.

In the previous tutorial, the program caused a dialog box to pop up. Now we're going to take steps towards creating a functioning application with a more advanced window structure.

![](result.png)

## KXmlGuiWindow

[KXmlGuiWindow](docs:kxmlgui;KXmlGuiWindow) provides a full main window view with menubars, toolbars, a statusbar and a main area in the centre for a large widget. For example, the help-menu is predefined. Most KDE applications will derive from this class as it provides an easy way to define menu and toolbar layouts through XML files (this technology is called XMLGUI and is part of the KF5::XmlGui framework). While we will not be using XMLGUI in this tutorial, we will use it in the next.

In order to have a useful KXmlGuiWindow, we must subclass it. So we create two files, a `mainwindow.cpp` and a `mainwindow.h` which will contain our code.

### mainwindow.h


{{< readfile file="/content/docs/getting-started/main_window/mainwindow.h" highlight="cpp" >}}

First we [subclass](https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming#Subclasses_and_superclasses) KXmlGuiWindow with `class MainWindow : public KXmlGuiWindow` then we declare the [constructor](https://en.wikipedia.org/wiki/Constructor_(object-oriented_programming)) with `MainWindow(QWidget *parent = nullptr);`.

And finally, we declare a pointer to the object that will make up the bulk of our program. [`KTextEdit`](docs:ktextwidgets;KTextEdit) is a generic rich text editing widget with some niceties like cursor auto-hiding. 

### mainwindow.cpp

{{< readfile file="/content/docs/getting-started/main_window/mainwindow.cpp" highlight="cpp" >}}

First, of course, we have to include the header file containing the class declaration. 

We initialise our text editor with a [QWidget](https://doc.qt.io/qt-5/qwidget.html) object and use KXmlGuiWindow's built-in `setCentralWidget()` function on it which tells the KXmlGuiWindow what should appear in the central section of the window. 

Finally, [KXmlGuiWindow::setupGUI](docs:kxmlgui;KXmlGuiWindow::setupGUI) is called which does a lot of behind-the-scenes stuff and creates the default menu bars (Settings, Help).

### Back to main.cpp

In order to actually run this window, we need to add a few lines in main.cpp:


{{< readfile file="/content/docs/getting-started/main_window/main.cpp" highlight="cpp" >}}

Again, we include our new header file ??mainwindow.h??. This lets us create our new MainWindow object which we then display near the end of the main function (by default, new window objects are hidden). 

## CMake

The best way to build the program is to use CMake. We add `mainwindow.cpp` to the sources list, include the XmlGui and TextWidgets (for KTextEdit) frameworks, and replace all `helloworld` text to `mainwindow`. 

### CMakeLists.txt

{{< readfile file="/content/docs/getting-started/main_window/CMakeLists.txt" highlight="cmake" >}}

## Compile and run

The best way to compile, link and run it is to [set up a correct build environment ](https://community.kde.org/Get_Involved/development#One-time_setup:_your_development_environment). But for a simple tutorial like this, it's enough to just create a build directory and build from there. This command takes care of all of that in one line:

```bash
mkdir build && cd build && cmake .. && make && ./mainwindow
```
