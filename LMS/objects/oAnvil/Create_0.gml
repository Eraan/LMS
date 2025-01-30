player = noone;
player_order = noone;
global.selected_anvil = false;

enum anvil {
	EMPTY,
	PICKING
}

state = anvil.EMPTY;

image_speed = 0;

ready = true;
selection_position = 0;
selected_bar = "";
selected_bar_sprite = noone;

items = {
	woodenStick : global.all_items.woodenStick,
	bronzeSword : global.all_items.bronzeSword,
	ironSword : global.all_items.ironSword,
	/*
	bronzeBar : oBronzeBar.itemData,
	ironBar : oIronBar.itemData,
	steelBar : oSteelBar.itemData,
	mithrilBar : oMithrilBar.itemData*/
}