extends Resource

class_name Inv

signal update

@export var items: Array[InvItem]

func insert(item:InvItem):
	var itemslots = items.filter(func(slot):return slot.item == item)
	var emptryslots = items.filter(func(slot):return slot.item == null)
	update.emit()
