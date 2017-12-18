@dir_x, @dir_y, @dir_z, @max_d = 0,0,0,0

open('input_d11.txt').read.split(',').each do |dir|
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
puts [@dir_x.abs, @dir_y.abs, @dir_z.abs].max.to_s + " = Current Distance; " + @max_d.to_s + " = Max distance"