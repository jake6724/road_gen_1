extends Object
class_name MaxHeap

var data: Array = []

func push(value: Variant) -> void:
    data.append(value)
    _bubble_up(data.size() - 1)

func pop() -> Variant:
    if data.is_empty():
        return null
    var max_value: Variant = data[0]
    data[0] = data[data.size() - 1]
    data.pop_back()
    _bubble_down(0)
    return max_value

func _bubble_up(index: int) -> void:
    while index > 0:
        var parent: int = (index - 1) / 2
        if data[index] > data[parent]:
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
        var largest: int = index

        if left < size and data[left] > data[largest]:
            largest = left
        if right < size and data[right] > data[largest]:
            largest = right
        if largest != index:
            var temp = data[index]
            data[index] = data[largest]
            data[largest] = temp
            index = largest
        else:
            break