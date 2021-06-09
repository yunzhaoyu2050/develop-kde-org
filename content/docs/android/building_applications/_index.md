---
title: "Building applications for Android"
linkTitle: "Building applications for Android"
weight: 2
description: >
  Learn how to build your applications for Android
---

## Building Applications

Building .apk files from Qt Applications requires a cross-compiling toolchain, which is hard to setup. To simplify this, there is a ready-to-use Docker container for building KDE applications.

This documentation only applies to applications that have a craft blueprint in the craft-blueprints-kde repository. If the application you want does not have such a blueprint yet, have a look at [TODO](TODO).

The container can be started with
```bash
docker run -ti --rm kdeorg/android-sdk bash
```

In the container, Craft needs to be set up:
```bash
git clone https://invent.kde.org/packaging/craftmaster
git clone https://invent.kde.org/sysadmin/binary-factory-tooling
python3 craftmaster/CraftMaster.py --config binary-factory-tooling/craft/configs/master/CraftBinaryCache.ini --target android-arm64-clang -c -i craft
```

Applications can then be built using
```bash
python3 craftmaster/CraftMaster.py --config binary-factory-tooling/craft/configs/master/CraftBinaryCache.ini --target android-arm64-clang -c -i <application>
```

And packaged as an apk with
```bash
python3 craftmaster/CraftMaster.py --config binary-factory-tooling/craft/configs/master/CraftBinaryCache.ini --target android-arm64-clang -c --package <application>
```

{{< alert color="info" title="Note" >}}
If you want to build the apk for other target architectures (arm, arm64, x86, x86_64), adjust the architecture in the target parameter
{{< /alert >}}

When building a project with local patches, the ```src``` directory needs to be added as a volume to the ```docker run``` command, e.g.:
```bash
docker run -ti --rm -v $HOME/kde/src:/home/user/src kdeorg/android-sdk bash
```

Inside the container, the blueprints can be found at `blueprints/craft-blueprints-kde` and can be edited there to quickly test changes.
