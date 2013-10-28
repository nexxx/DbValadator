/* CustomToolbar.vala
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
class CustomToolbar : Gtk.Toolbar {

	public CustomToolbar() {
		add_def_buttons();
		add_zoombox();
		message("Custom Toolbar initialized");
	}

	private void add_def_buttons() {
		Image img_new = new Image.from_icon_name ("document-new", Gtk.IconSize.SMALL_TOOLBAR);
		var button_new = new ToolButton(img_new, "New");
		button_new.is_important = true;
		button_new.set_tooltip_text("New");
		button_new.clicked.connect(() => {
			message("Button NEW clicked");
		});
		add(button_new);
		
		Image img_open = new Image.from_icon_name ("document-open", Gtk.IconSize.SMALL_TOOLBAR);
		var button_open = new ToolButton(img_open, "Open");
		button_open.is_important = true;
		button_new.set_tooltip_text("Open");
		button_open.clicked.connect(() => {
			message("Button OPEN clicked");
		});
		add(button_open);

		Image img_save = new Image.from_icon_name ("document-save", Gtk.IconSize.SMALL_TOOLBAR);
		var button_save = new ToolButton(img_save, "Save");
		button_save.is_important = true;
		button_save.set_tooltip_text("Save");
		button_save.clicked.connect(() => {
			message("Button SAVE clicked");
		});
		add(button_save);

		Image img_undo = new Image.from_icon_name ("edit-undo", Gtk.IconSize.SMALL_TOOLBAR);
		var button_undo = new ToolButton(img_undo, "Undo");
		button_undo.is_important = true;
		button_undo.set_tooltip_text("Undo");
		button_undo.clicked.connect(() => {
			message("Button UNDO clicked");
		});
		add(button_undo);

		Image img_redo = new Image.from_icon_name ("edit-redo", Gtk.IconSize.SMALL_TOOLBAR);
		var button_redo = new ToolButton(img_redo, "Redo");
		button_redo.is_important = true;
		button_redo.set_tooltip_text("Redo");
		button_redo.clicked.connect(() => {
			message("Button REDO clicked");
		});
		add(button_redo);
	}	

	private void add_zoombox() {
		ListStore list = new ListStore(1, typeof (int));
		for (int i = 25; i <= 400; i*=2) {
			TreeIter iter;
			list.append(out iter);
			list.set(iter, 0, i);
		}

		ComboBox cb = new ComboBox.with_model(list);
		CellRendererText renderer = new CellRendererText();
		cb.pack_start(renderer, false);
		cb.set_attributes(renderer, "text", 0);
		cb.set_active(0);
		cb.changed.connect(() => {
			message("Combobox value changed");
		});

		ToolItem container = new ToolItem();
		add(container);
		container.add(cb);
		cb.show();
	}
}
}

