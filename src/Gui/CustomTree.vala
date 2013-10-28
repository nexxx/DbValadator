/* CustomTree.vala
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

namespace Dbv.Gui{

public class CustomTree : TreeView {
	private	TreeStore _store;
	public CustomTree() {
		_store = new TreeStore(1, typeof(string));
		set_model(_store);

		insert_column_with_attributes(-1, "Database", new CellRendererText(), "text", 0, null); 

		TreeIter root;
		TreeIter relation;
		TreeIter attribute;

		_store.append(out root, null);
		_store.set(root, 0, "Database", -1);

		_store.append(out relation, root);
		_store.set(relation, 0, "Relation 1", -1);

		_store.append(out attribute, relation);
		_store.set(attribute, 0, "Attribute 1", -1);

		_store.append(out attribute, relation);
		_store.set(attribute, 0, "Attribute 2", -1);

		_store.append(out attribute, relation);
		_store.set(attribute, 0, "Attribute 3", -1);

		_store.append(out relation, root);
		_store.set(relation, 0, "Relation 2", -1);

		_store.append(out attribute, relation);
		_store.set(attribute, 0, "Attribute 1", -1);

		_store.append(out attribute, relation);
		_store.set(attribute, 0, "Attribute 2", -1);

		_store.append(out attribute, relation);
		_store.set(attribute, 0, "Attribute 3", -1);

		expand_all();
	}



}
}
