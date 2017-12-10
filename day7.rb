# I solved Part 1 by manually searching through the inputs. 
#just select a node with children, ctl+f to find its parent and repeat until you get to the base node

@hash = {}

def assign_weight(name)
    children =  @hash[name]['children'] 
    weight = @hash[name]['weight']
    children_weight = 0
    if children != nil 
        children.each do |child_name|      
            children_weight += assign_weight(child_name)
        end

    end
    @hash[name]['total_w'] = weight + children_weight
    return weight + children_weight
end

def check_weight(name)
    children =  @hash[name]['children']
    children_weights = []
    children.each do |child|
        children_weights << [@hash[child]['total_w'],  child]
    end
    # The tree is really shallow so print the array find the outlier and repeat until you find a balanced node.
    p children_weights
end


open('day7.txt').each_line do |line|
    x= line.tr('(),', '').split(' ')
    if x.length > 2
        y = x.length - 3
        children = []
        y.times do |i|
            children << x[3+i]
        end
        @hash[x[0]] = {"name" => x[0], "weight" => x[1].to_i, 'children' => children, 'total_w' => 0}
    else
        @hash[x[0]] = {"name" => x[0], "weight" => x[1].to_i}
    end
end

assign_weight('hmvwl')
check_weight('kzltfq')
p @hash['arqoys']
check_weight('arqoys')