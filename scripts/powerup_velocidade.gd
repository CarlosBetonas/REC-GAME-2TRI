extends Area2D
## PowerUp criado para a avaliacao: aumenta a velocidade do player temporariamente.


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return

	if body.has_method("ativar_powerup_velocidade"):
		body.ativar_powerup_velocidade()
		queue_free()
