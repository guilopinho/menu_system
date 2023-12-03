function menu_check_option(_type,_index){
	var _value = global.current_page[# menu_info.value, _index];
	
	switch(_type){
		case menu_element_type.use_script:
			script_execute(_value);
		break;
		
		case menu_element_type.page_transfer:
			global.current_page = _value;
		break;
		
		case menu_element_type.slider:
			global.slider_keyboard_focus = !global.slider_keyboard_focus;
		break;
		
	}
	
}