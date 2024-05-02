extends Resource

class_name Inv

@export var items: Array[InvItem]

func insert(item:InvItem):
	print(item.to_string())
	for i in range(items.size()):
		if (!items[i]):
			items[i] = item
			Global.invgui.update_slots()
			return

