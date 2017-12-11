
@dir_x = 0
@dir_y = 0
@dir_z = 0
@max_d = 0

x = open('input_d11.txt').read.split(',')

x.each do |dir|
    case dir
    when 'n'
        @dir_y += 1
        @dir_z -= 1
    when 's'
        @dir_y -= 1
        @dir_z += 1
    when 'nw'
        @dir_y += 1
        @dir_x -= 1
    when 'ne'
        @dir_x += 1
        @dir_z -= 1
    when 'sw'
        @dir_x -= 1
        @dir_z += 1
    when 'se'
        @dir_x += 1
        @dir_y -= 1
    end

    if ([@dir_x.abs, @dir_y.abs, @dir_z.abs].max > @max_d)
        @max_d = [@dir_x.abs, @dir_y.abs, @dir_z.abs].max
    end

end
puts [@dir_x.abs, @dir_y.abs, @dir_z.abs].max
puts @max_d
