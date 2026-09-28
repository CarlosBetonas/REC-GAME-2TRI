extends CanvasLayer
## HUD de gemas e aviso de PowerUp ativo.

@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var powerup_label: Label = $PowerUpLabel


func _ready() -> void:
	GameManager.score_changed.connect(_on_score_changed)
	GameManager.powerup_changed.connect(_on_powerup_changed)
	_update_score(GameManager.score)
	_on_powerup_changed(false, "")


func _on_score_changed(new_score: int) -> void:
	_update_score(new_score)


func _update_score(value: int) -> void:
	score_label.text = "Gemas: %d" % value


func _on_powerup_changed(active: bool, powerup_name: String) -> void:
	if active:
		powerup_label.text = "PowerUp ativo: %s" % powerup_name
		powerup_label.visible = true
	else:
		powerup_label.visible = false
