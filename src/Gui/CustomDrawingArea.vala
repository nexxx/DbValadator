/* CustomDrawingArea.vala
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
using Cairo;
//https://wiki.gnome.org/Vala/CairoSample
namespace Dbv.Gui{
public class CustomDrawingArea : DrawingArea {
	private const int SIZE = 20;

	public CustomDrawingArea() {
		draw.connect(on_draw);
	}
	
	private bool on_draw (Widget da, Context ctx) {
        ctx.set_source_rgb (0, 0, 0);

        ctx.set_line_width (SIZE / 4);
        ctx.set_tolerance (0.1);

        ctx.set_line_join (LineJoin.ROUND);
        ctx.set_dash (new double[] {SIZE / 4.0, SIZE / 4.0}, 0);
        stroke_shapes (ctx, 0, 0);

        ctx.set_dash (null, 0);
        stroke_shapes (ctx, 0, 3 * SIZE);

        ctx.set_line_join (LineJoin.BEVEL);
        stroke_shapes (ctx, 0, 6 * SIZE);

        ctx.set_line_join (LineJoin.MITER);
        stroke_shapes(ctx, 0, 9 * SIZE);

        fill_shapes (ctx, 0, 12 * SIZE);

        ctx.set_line_join (LineJoin.BEVEL);
        fill_shapes (ctx, 0, 15 * SIZE);
        ctx.set_source_rgb (1, 0, 0);
        stroke_shapes (ctx, 0, 15 * SIZE);

        return true;
    }

    private void stroke_shapes (Context ctx, int x, int y) {
        this.draw_shapes (ctx, x, y, ctx.stroke);
    }

    private void fill_shapes (Context ctx, int x, int y) {
        this.draw_shapes (ctx, x, y, ctx.fill);
    }

    private delegate void DrawMethod ();

    private void draw_shapes (Context ctx, int x, int y, DrawMethod draw_method) {
        ctx.save ();

        ctx.new_path ();
        ctx.translate (x + SIZE, y + SIZE);
        bowtie (ctx);
        draw_method ();

        ctx.new_path ();
        ctx.translate (3 * SIZE, 0);
        square (ctx);
        draw_method ();

        ctx.new_path ();
        ctx.translate (3 * SIZE, 0);
        triangle (ctx);
        draw_method ();

        ctx.new_path ();
        ctx.translate (3 * SIZE, 0);
        inf (ctx);
        draw_method ();

        ctx.restore();
    }

    private void triangle (Context ctx) {
        ctx.move_to (SIZE, 0);
        ctx.rel_line_to (SIZE, 2 * SIZE);
        ctx.rel_line_to (-2 * SIZE, 0);
        ctx.close_path ();
    }

    private void square (Context ctx) {
        ctx.move_to (0, 0);
        ctx.rel_line_to (2 * SIZE, 0);
        ctx.rel_line_to (0, 2 * SIZE);
        ctx.rel_line_to (-2 * SIZE, 0);
        ctx.close_path ();
    }

    private void bowtie (Context ctx) {
        ctx.move_to (0, 0);
        ctx.rel_line_to (2 * SIZE, 2 * SIZE);
        ctx.rel_line_to (-2 * SIZE, 0);
        ctx.rel_line_to (2 * SIZE, -2 * SIZE);
        ctx.close_path ();
    }

    private void inf (Context ctx) {
        ctx.move_to (0, SIZE);
        ctx.rel_curve_to (0, SIZE, SIZE, SIZE, 2 * SIZE, 0);
        ctx.rel_curve_to (SIZE, -SIZE, 2 * SIZE, -SIZE, 2 * SIZE, 0);
        ctx.rel_curve_to (0, SIZE, -SIZE, SIZE, -2 * SIZE, 0);
        ctx.rel_curve_to (-SIZE, -SIZE, -2 * SIZE, -SIZE, -2 * SIZE, 0);
        ctx.close_path ();
    }
}
}
