/// @description OnEnemy hit

with(other)
{	
	scr_DamagePlayer(other.bullet_damage);
	instance_destroy(other);
}