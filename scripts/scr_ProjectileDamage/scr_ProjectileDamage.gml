/// @description OnEnemy hit

with(other)
{
	hp -= other.bullet_damage;
	was_hit = true;
	instance_destroy(other);
}