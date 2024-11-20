extends Control

class_name InventoryGUI

@onready var inv: Inv = preload("res://inventory/inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
var isopen : bool = false

func open():
	visible = true
	isopen = true

func close():
	visible = false
	isopen = false

func update_slots():
	for i in range(min(inv.items.size(), slots.size())): 
		slots[i].update(inv.items[i])

# Called when the node enters the scene tree for the first time.
func _ready():
	update_slots()
	close()
	Global.invgui = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if isopen:
			close()
		else:
			open()
	
	if event.is_action_pressed("left_click"):
		inventory_update(event.position)


func inventory_update(mp):
	var i: int = 0
	for slot in slots:
		var slot_pos = slot.get_screen_position()
		var mouse_pos = mp
		if ((mouse_pos.x > slot_pos.x and mouse_pos.x < slot_pos.x + slot.get_rect().size.x) and (mouse_pos.y > slot_pos.y and mouse_pos.y < slot_pos.y + slot.get_rect().size.y)):
			print(slot.get_node("CenterContainer/Panel/item"))
			get_parent().hat_smenyat(slot.get_node("CenterContainer/Panel/item").texture)
		i=i+1
