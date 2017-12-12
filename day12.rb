@pipes = {}
@group_0 = []

def find_group_size(name)
    child_nodes = @pipes[name]
    child_nodes.each do |child|
        unless @group_0.include?(child)
            @group_0 << child
            find_group_size(child)
        end
    end
end

open('day12.txt').each_line do |line|
    x = line.tr(',', '').split(' ')
    outputs = []
    (x.length - 2).times do |i|
        outputs << x[i+2].to_i
    end
    @pipes[x[0].to_i] = outputs
end

@checked = []
@group_size = 0
2000.times do |num|
    unless @checked.include? num
        find_group_size(num)
        @checked = @checked + @group_0
        # puts num.to_s + ' has a group size of  ' + @group_0.length.to_s 
        @group_0 = []
        @group_size +=1
    end
end

p @group_size