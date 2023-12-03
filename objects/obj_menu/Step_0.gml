var _key_up = keyboard_check_pressed(KEY_UP);
var _key_down = keyboard_check_pressed(KEY_DOWN);
var _key_right = keyboard_check(KEY_RIGHT);
var _key_left = keyboard_check(KEY_LEFT);
var _key_enter = keyboard_check_pressed(KEY_ENTER);

if(_key_up and !global.slider_keyboard_focus){
	global.menu_index--;
	if(global.menu_index < 0){
		global.menu_index = ds_grid_height(global.current_page) - 1;
	}
}else if(_key_down and !global.slider_keyboard_focus){
	global.menu_index++;
	if(global.menu_index > ds_grid_height(global.current_page) - 1){
		global.menu_index = 0;
	}
}	

if(_key_right and global.slider_keyboard_focus){
	global.current_page[# menu_info.value, global.menu_index]+=0.012;
	global.current_page[# menu_info.value, global.menu_index] = clamp(global.current_page[# menu_info.value, global.menu_index],0,1);
}else if(_key_left and global.slider_keyboard_focus){
	global.current_page[# menu_info.value, global.menu_index]-=0.012;
	global.current_page[# menu_info.value, global.menu_index] = clamp(global.current_page[# menu_info.value, global.menu_index],0,1);
}

if(_key_enter){
	var _type = global.current_page[# menu_info.type, global.menu_index];
	menu_check_option(_type,global.menu_index);
}