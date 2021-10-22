require "byebug"
class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if node == nil
            @parent = nil 
        else
            if @parent != nil
                @parent.children.delete(self)
            end
            @parent = node 
            node.children << self if !node.children.include?(self)
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise unless children.include?(child)
        child.parent = nil
    end

    def dfs(target)
        return self if self.value == target
        # debugger
        children.each do |child|
            search = child.dfs(target)
            return search if search != nil   # why not search.value == target
        end
        nil
    end
    
    def inspect
        [self.value, self.children]
    end

    

end