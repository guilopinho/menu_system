main_page = menu_page_create();
menu_page_add_element(main_page,"Jogar",menu_element_type.use_script,start_game);
menu_page_add_element(main_page,"Configurações",menu_element_type.page_transfer,menu_page.settings);
menu_page_add_element(main_page,"Sair",menu_element_type.use_script,end_game);

settings_page = menu_page_create();
menu_page_add_element(settings_page,"Volume",menu_element_type.slider,0.5);
menu_page_add_element(settings_page,"Tela Cheia off",menu_element_type.use_script,toggle_fullscreen);
menu_page_add_element(settings_page,"Voltar",menu_element_type.page_transfer,menu_page.main);

resume_page = menu_page_create();
menu_page_add_element(resume_page,"Retornar",menu_element_type.use_script,back_main_menu);