input = open('input_d16.txt').read.split(',')
#input = 's1,x3/4,pe/b'.split(',')
programs = ('a'..'p').to_a
#programs = 'abcde'.split('')

class String
    def numeric?
      Float(self) != nil rescue false
    end
end

1000.times do |i|
    input.each do |move|
        move_array = move.split('')
        if move_array.length > 2 && move_array[2].numeric?
            move_array[1] = move_array[1] + move_array[2]
            move_array.slice!(2)
        end
        if move_array.length > 4
            move_array[3] = move_array[3] + move_array[4]
        end

        if move_array[0] == 's'
            move_array[1].to_i.times do
                programs.rotate!(-1)
            end
        elsif move_array[0] == 'x'
            programs[move_array[1].to_i], programs[move_array[3].to_i] = programs[move_array[3].to_i], programs[move_array[1].to_i]
        elsif move_array[0] == 'p'
            first = programs.index(move_array[1])
            second = programs.index(move_array[3])
            programs[first], programs[second] = programs[second], programs[first]
        end
    end

    if programs.join == 'abcdefghijklmnop'
        p i
    end
end
