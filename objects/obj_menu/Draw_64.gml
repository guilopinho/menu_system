var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _x1 = GUI_WIDTH / 2;
var _y1 = GUI_HEIGHT / 2;

var _margin = 20;

draw_set_font(fnt_gui);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

for(var _i = 0;_i < ds_grid_height(global.current_page);_i++){
	var _y2 = _y1 + (_margin * _i);
	
	var _name = global.current_page[# menu_info.name, _i];
	var _type = global.current_page[# menu_info.type, _i];
	
	var _str_w = string_width(_name);
	var _str_h = string_height(_name);
	
	if(point_in_rectangle(_mx,_my,_x1 - _str_w / 2,_y2 - _str_h / 2,_x1 + _str_w / 2,_y2 + _str_h / 2) and global.slider_mouse_focus == noone
	and !global.slider_keyboard_focus){
		global.menu_index = _i;
		if(mouse_check_button_pressed(mb_left)){
			menu_check_option(_type,_i);
		}
	}
	
	var _color_focus = make_color_rgb(255,0,64);
	
	if(global.menu_index == _i) draw_set_color(_color_focus); else draw_set_color(c_white);
	
	draw_text(_x1,_y2,string(_name));
	
	if(_type == menu_element_type.slider){
		
		var _move_x = _mx;
		var _move_y = _my;
		
		var _spr_slider_w = sprite_get_width(spr_slider_bar);
		var _spr_slider_h = sprite_get_height(spr_slider_bar);
		
		var _slider_x = _x1 + (_spr_slider_w / 2);
		var _slider_y = _y2 + (_spr_slider_h / 2);
		
		var _value = global.current_page[# menu_info.value, _i];
		
		draw_sprite_ext(spr_slider_bar,0,_slider_x,_slider_y,1,1,0,c_white,1);
		
		draw_sprite_ext(spr_slider_bar,1,_slider_x,_slider_y,_value,1,0,c_white,1);
		
		var _x_circle = (_x1  + (_spr_slider_w * _value)) + (_spr_slider_w / 2);
		var _y_circle = _y2 + (_spr_slider_h / 2);
		
		draw_sprite_ext(spr_slider_circle,0,_x_circle,_y_circle,1,1,0,c_white,1);
		
		if(point_in_circle(_move_x,_move_y,_x_circle,_y_circle,10) and !global.slider_keyboard_focus or global.slider_mouse_focus == _i and 
		!global.slider_keyboard_focus){
			if(mouse_check_button(mb_left)){
				global.slider_mouse_focus = _i;
				global.menu_index = _i;
				global.current_page[# menu_info.value, _i] = (_move_x - _slider_x) / _spr_slider_w;
				global.current_page[# menu_info.value, _i] = clamp(global.current_page[# menu_info.value, _i],0,1);
			}
		}
		
		if(!mouse_check_button(mb_left)){
			global.slider_mouse_focus = noone;
		}
		
	}
	
}

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_color(-1);