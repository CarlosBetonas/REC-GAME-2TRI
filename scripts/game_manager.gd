extends Node
## Autoload que guarda a pontuacao e informa o HUD sobre o PowerUp.

signal score_changed(new_score: int)
signal powerup_changed(active: bool, powerup_name: String)

var score: int = 0


func add_point(amount: int = 1) -> void:
	score += amount
	score_changed.emit(score)


func set_powerup(active: bool, powerup_name: String = "") -> void:
	powerup_changed.emit(active, powerup_name)


func reset() -> void:
	score = 0
	score_changed.emit(score)
	powerup_changed.emit(false, "")
