var shotgun = instance_create_depth(x, 600, 1, obj_Shotgun);
current_weapon_script = shotgun.weapon_script;
current_attacking_sprite = shotgun.attacking_sprite;
current_attacking_frame = shotgun.attacking_frame;
instance_destroy(shotgun);