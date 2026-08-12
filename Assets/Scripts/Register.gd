@tool
extends PanelContainer

@export var title: String

@export var titleLabel: Label
@export_range(0, 255, 1) var value: int
@export var valueLabel: Label

@export var Bin: Button
@export var Dec: Button
@export var Hex: Button

func _process(_delta: float) -> void:
	# 1. Protect against null references during initialization
	if not titleLabel or not valueLabel or not Hex or not Dec or not Bin:
		return
		
	if Engine.is_editor_hint():
		titleLabel.text = title
	
	if Hex.button_pressed:
		valueLabel.text = "0x%02X" % value
	elif Dec.button_pressed:
		valueLabel.text = str(value)
	else:
		valueLabel.text = "0b" + to_bin(value)
	
	if titleLabel.text != title: titleLabel.text = title

func to_bin(num: int) -> String:
	if num == 0:
		return "0"
	
	var numStr = ""
	while num > 0:
		numStr += str(num % 2)
		num /= 2
		
	return numStr.reverse()
