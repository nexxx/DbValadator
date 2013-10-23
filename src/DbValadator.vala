/* DbValadator.vala
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
public class SyncSample : Window {
  private SpinButton spin_box;
  private Scale slider;
  
  public SyncSample () {
    this.title = "Enter your Age";
    this.window_position = WindowPosition.CENTER;
    this.destroy.connect(Gtk.main_quit);
    set_default_size (300, 20);
    
    spin_box = new SpinButton.with_range(0, 130, 1);
    slider = new Scale.with_range(Orientation.HORIZONTAL, 0, 130, 1);
    
    spin_box.adjustment.value_changed.connect(() => { slider.adjustment.value = spin_box.adjustment.value;});

    slider.adjustment.value_changed.connect(() => { spin_box.adjustment.value = slider.adjustment.value;});
    
    spin_box.adjustment.value = 35;

    var hbox = new Box (Orientation.HORIZONTAL, 5);
    hbox.homogeneous = true;
    hbox.add (spin_box);
    hbox.add (slider);
    add (hbox);
  }
  
  public static int main (string[] args) {
    Gtk.init (ref args);

    var window = new SyncSample ();
    window.show_all ();

    Gtk.main ();
    return 0;
  }
}
