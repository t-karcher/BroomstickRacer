extends Area2D

var update_snitch_count : FuncRef

func _on_Snitch_body_entered(_body):
	update_snitch_count.call_func(1)
	self.queue_free()