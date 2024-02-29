extends MarginContainer

@onready var player := $'../Player'
@onready var label := $Stats

func _process(_delta: float) -> void:
	#label.text = 'velocity: '+(str(player.velocity))+'\ndirection: '+(str(player.dir))+'\nfps: '+str(Engine.get_frames_per_second())
	pass
