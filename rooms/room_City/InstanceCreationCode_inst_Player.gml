var beer_bottle = instance_create_depth(x, 600, 1, obj_BeerBottle);
current_weapon_script = beer_bottle.weapon_script;
current_attacking_sprite = beer_bottle.attacking_sprite;
current_attacking_frame = beer_bottle.attacking_frame;
instance_destroy(beer_bottle);