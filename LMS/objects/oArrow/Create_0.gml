speed = 4;
image_speed = 0;
has_hit = false;
owner = noone;
device = "Keyboard";
dir_x = 0;
dir_y = 0;
arrow_dir = 0;
//image_angle = arrow_dir;

itemData = {
    name : "Arrow",
	slug : "arrow",
    price : 1,
    amount : 1,
    sprite : sArrow,
    object : oArrow,
    type : "Projectile",
	damage : 2,
	range : 100,
	attributes : ["Poison"]
};