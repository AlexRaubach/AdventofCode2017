
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
        outputs << x[i+2]
    end
    @pipes[x[0]] = outputs
end


find_group_size('0')
p @group_0.length