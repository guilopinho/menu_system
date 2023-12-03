enum menu_page{
	main,
	settings,
	resume,
	length
}

enum menu_info{
	name,
	type,
	value,
	length
}

enum menu_element_type{
	use_script,
	page_transfer,
	slider,
	lenth
}

global.current_page = menu_page.main;
global.menu_index = 0;
global.slider_mouse_focus = noone;
global.slider_keyboard_focus = noone;

function menu_page_create(){
	var _grid = ds_grid_create(menu_info.length,0);
	return _grid;
}

function menu_page_add_element(_menu_page,_name,_type,_value){
	
	if(!ds_exists(_menu_page,ds_type_grid)) return false;
	
	var _row = ds_grid_add_row(_menu_page);
	
	_menu_page[# menu_info.name, _row] = _name;
	_menu_page[# menu_info.type, _row] = _type;
	_menu_page[# menu_info.value, _row] = _value;
	
}

function ds_grid_add_row(_grid){
	var _grid_w = ds_grid_width(_grid);
	var _grid_h = ds_grid_height(_grid);
	
	ds_grid_resize(_grid,_grid_w,_grid_h + 1);
	
	return(ds_grid_height(_grid) - 1);
}

function start_game(){
	room_goto(rm_gameplay);
	global.current_page = menu_page.resume;
}

function back_main_menu(){
	room_goto(rm_menu);
	global.current_page = menu_page.main;
}

function end_game(){
	var _exit = show_question("Você deseja sair?");
	if(_exit){
		game_end();	
	}
	return false;
}

function toggle_fullscreen(){
	if(window_get_fullscreen()){
		settings_page[# menu_info.name, 1] = "Tela Cheia Off";
		window_set_fullscreen(false);
	}else{
		settings_page[# menu_info.name, 1] = "Tela Cheia On";
		window_set_fullscreen(true);
	}
}