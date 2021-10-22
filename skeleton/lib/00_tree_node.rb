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

    


end