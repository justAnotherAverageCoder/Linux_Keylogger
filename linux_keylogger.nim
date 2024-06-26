import std/strutils











proc toString(byt: int): string =

    var count = 0
    var alpha: seq[string]
    const letters = ["esc", "0", "-", "=", "BACK_SPACE", "TAB", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "[", "]", "ENTER", "L_CONTROL", "a", "s", 
                        "d", "f", "g", "h", "j", "k", "l", ";", "'", "UNKOWN", "L_SHIFT", """\""", "z", "x", "c", "v", "b", "n", "m", ",", ".", "/", "R_SHIFT", 
                        "UNKNOWN", "L_ALT", "SPACE"]
    
    for x in 1 .. 9:
        alpha.add($x)
    for x in letters:
        alpha.add(x)

    for i in alpha:
        if byt - 1 == count:
            return alpha[count]
        count = count + 1


    







proc main() =
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
            echo longData[4]
            echo toString(longData[4])
        found = false
        longData = @[]

            
        



main()


