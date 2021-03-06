/*
 *   Copyright 2018 Fabian Riethmayer
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Library General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.6
import QtTest 1.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.4 as Kirigami
import "../../models/" as Models
import "../../addr/" as Addr
import "../../lib/annotate.js" as A

Rectangle {
    width: 320
    height: 600
    id: root

    Addr.Addressbook {
        id: addrbook
    }


    // HACK
    TestEvent {
        id: event
    }
    Timer {
        interval: 2000
        repeat: false
        running: true
        onTriggered: {
            var a = new A.An(addrbook);
            a.find("swipelistitem").eq(3).swipe({fromX: +140, fromY: 9, toX: -80, toY: 0});
        }
    }

    Timer {
        interval: 4000
        repeat: false
        running: true
        onTriggered: {
            var a = new A.An(addrbook);
            a.find("swipelistitem").eq(3).touch({});
        }
    }
}
