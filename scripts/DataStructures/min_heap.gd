# MinHeap.gd
extends Object
class_name MinHeap

var data: Array = []

# Push an array [noise_value, Vector2] into the heap
func push(item: Array) -> void:
    data.append(item)
    _bubble_up(data.size() - 1)

# Remove and return the array with the smallest noise_value
func pop():
    if data.is_empty():
        return null
    var min_item: Array = data[0]
    data[0] = data[data.size() - 1]
    data.pop_back()
    _bubble_down(0)
    return min_item

# Return the array with the smallest noise_value without removing it
func peek():
    if data.is_empty():
        return null
    return data[0]

func _bubble_up(index: int) -> void:
    while index > 0:
        var parent: int = (index - 1) / 2
        if data[index][0] < data[parent][0]:
            var temp = data[index]
            data[index] = data[parent]
            data[parent] = temp
            index = parent
        else:
            break

func _bubble_down(index: int) -> void:
    var size: int = data.size()
    while true:
        var left: int = 2 * index + 1
        var right: int = 2 * index + 2
        var smallest: int = index

        if left < size and data[left][0] < data[smallest][0]:
            smallest = left
        if right < size and data[right][0] < data[smallest][0]:
            smallest = right
        if smallest != index:
            var temp = data[index]
            data[index] = data[smallest]
            data[smallest] = temp
            index = smallest
        else:
            break