@tool
extends Control

@export var sidebarMargin: MarginContainer
@export var memoryMonitor: Button
@export var hsplit: HSplitContainer

func _process(_delta: float) -> void:
	if sidebarMargin:
		if sidebarMargin.position != Vector2.ZERO:
			sidebarMargin.position = Vector2.ZERO
	
	if memoryMonitor and hsplit:
		memoryMonitor.custom_maximum_size.x = hsplit.split_offsets[0] - 64
	
	$"Panel/MarginContainer/Panel/HSplitContainer/Panel/MarginContainer/VBoxContainer/Screen".custom_maximum_size = hsplit.split_offsets[0] - 64
