/* CustomMenubar.vala
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
public class CustomMenubar : Gtk.MenuBar {
	public CustomMenubar() {

		//File
		var item_file = new Gtk.MenuItem.with_label("File");
		add(item_file);

		var filemenu = new Gtk.Menu();
		item_file.set_submenu(filemenu);

		var item_new = new Gtk.MenuItem.with_label("New");
		item_new.activate.connect(() => {
			message("File New clicked");
		});
		filemenu.add(item_new);
		
		var separator = new Gtk.SeparatorMenuItem();
		filemenu.add(separator);
 
		var item_open = new Gtk.MenuItem.with_label("Open");
		item_open.activate.connect(() => {
			message("File Open clicked");
		});
		filemenu.add(item_open);

		var item_save = new Gtk.MenuItem.with_label("Save");
		item_save.activate.connect(() => {
			message("File Save clicked");
		});
		filemenu.add(item_save);
		
		var separator2 = new Gtk.SeparatorMenuItem();
		filemenu.add(separator2);

		var item_exit = new Gtk.MenuItem.with_label("Exit");
		item_exit.activate.connect(Gtk.main_quit);
		filemenu.add(item_exit);

		//About
		var item_help = new Gtk.MenuItem.with_label("Help");
		add(item_help);

		var helpmenu = new Gtk.Menu();
		item_help.set_submenu(helpmenu);

		var item_about = new Gtk.MenuItem.with_label("About");
		item_about.activate.connect(() => {
			message("File About clicked");
		});
		helpmenu.add(item_about);
	}
}
}
