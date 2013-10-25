/* Mainwindow.vala
*
* This file is part of DbValadator
*
* Copyright (C) 2013       Andreas Freitag <freitandi@gmail.com>
*	                         Sebastian Theuermann <stheuerman@gmail.com>
*
* DbValadator is free software: you can redistribute it and/or modify it under the terms of the
* GNU General Public License as published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
* 
* DbValadator is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
* without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
* 
* See the GNU General Public License for more details. You should have received a copy of the GNU
* General Public License along with DbValadator. If not, see <http://www.gnu.org/licenses/>. 
* 
* Author(s):
*		Andreas Freitag <freitandi@gmail.com>
*/
using Gtk;

namespace Dbv.Gui {
class Mainwindow : GLib.Object {
	private Window window;

	public Mainwindow(string[] args) {
		window = new Window();
		window.title = "DbValadator";
		window.border_width = 5;
		window.window_position = WindowPosition.CENTER;
		window.set_default_size(800, 600);
		window.destroy.connect(Gtk.main_quit);
	}

	public void show_window() {
		window.show_all();
	}
}
}
