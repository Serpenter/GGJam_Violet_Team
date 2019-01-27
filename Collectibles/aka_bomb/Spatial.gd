extends Spatial

onready var mesh_particles_1 = get_node("MeshInstance/Particles")
onready var mesh_particles_2 = get_node("MeshInstance2/Particles")
onready var mesh_particles_3 = get_node("MeshInstance3/Particles")
onready var mesh_particles_4 = get_node("MeshInstance4/Particles")
onready var anim = get_node("AnimationPlayer")


func _ready():
	pass

func _on_Timer_timeout():
	mesh_particles_1.set_emitting(true)
	mesh_particles_2.set_emitting(true)
	mesh_particles_3.set_emitting(true)
	mesh_particles_4.set_emitting(true)
	anim.play("Expl")

func _on_AnimationPlayer_animation_finished(anim_name):
	mesh_particles_1.set_emitting(false)
	mesh_particles_2.set_emitting(false)
	mesh_particles_3.set_emitting(false)
	mesh_particles_4.set_emitting(false)
