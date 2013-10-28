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
	private Window _window;
	

	public Mainwindow() {
		//Window
		_window = new Window();
		_window.title = "DbValadator";
		_window.border_width = 5;
		_window.window_position = WindowPosition.CENTER;
		_window.set_default_size(800, 600);
		_window.destroy.connect(Gtk.main_quit);

		//Toolbar
		var toolbar = new CustomToolbar();

		//Tree
		var tree = new CustomTree();
		var scroll_tree = new ScrolledWindow(null, null);		
		scroll_tree.set_policy(PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
		scroll_tree.add(tree);

		//Layout
		var vbox = new Box(Orientation.VERTICAL, 0);
		vbox.pack_start(toolbar, false, true, 0);
		var hbox = new Box(Orientation.HORIZONTAL, 0);
		hbox.pack_start(scroll_tree, true, true, 0);
		vbox.pack_start(hbox, true, true, 0);

		//Add components to window
		_window.add(vbox);

		
	}

	public void show_window() {
		_window.show_all();
	}

}
}
