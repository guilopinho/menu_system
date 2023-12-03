if(window_get_fullscreen()){
	if(instance_exists(obj_menu)){
		obj_menu.settings_page[# menu_info.name, 1] = "Tela Cheia Off";
	}
	window_set_fullscreen(false);
}else{
	if(instance_exists(obj_menu)){
		obj_menu.settings_page[# menu_info.name, 1] = "Tela Cheia On";
	}
	window_set_fullscreen(true);
}