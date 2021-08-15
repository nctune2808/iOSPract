class BinarySearchTree {
    
    var value: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    var parent: BinarySearchTree?
    
    init(value: Int){
        self.value = value
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
}


extension BinarySearchTree {
    
    func insert(value: Int) {
        insert(value: value, parent: self)
    }
    
    
    private func insert(value: Int, parent: BinarySearchTree) {
        
        if value < self.value {
            
            if let left = left {
                left.insert(value: value, parent: self)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
            
        } else {
            
            if let right = right {
                right.insert(value: value, parent: self)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
}

extension BinarySearchTree {
    
    func minimum() -> Int {
        var node = self
        
        while let left = node.left {
            node = left
        }
        return node.value
    }
    
    func maximum() -> Int {
        var node = self
        
        while let right = node.right {
            node = right
        }
        return node.value
    }
    
    func height() -> Int {
        if tree.isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    func depth( ofValue value: Int) -> Int {
        
        var depth = 0
        
        guard var tree = searchAndReturnTree(forValue: value) else {
            return 0
        }
        
        while let parent = tree.parent {
            tree = parent
            depth += 1
        }
        
        return depth
        
    }
    
}

extension BinarySearchTree {
    
    func searchAndReturnTree(forValue value: Int) -> BinarySearchTree? {
        
        if value == self.value {
            print(self)
            return self
        }
        
        if value < self.value {
            if let left = left {
                return left.searchAndReturnTree(forValue: value)
            }
        } else {
            if let right = right {
                return right.searchAndReturnTree(forValue: value)
            }
        }
        
        return nil
    }
    
}

extension BinarySearchTree: CustomStringConvertible {
    
    var description: String {
        var result = ""
        
        if let left = left {
            result += "\(left.description) <--"
        }
        result += "\(value)"
        
        if let right = right {
            result += "--> \(right.description)"
        }
        
        
        return result
    }
}

let tree = BinarySearchTree(value: 8)
tree.insert(value: 6)
tree.insert(value: 10)
tree.insert(value: 4)
tree.insert(value: 12)
tree.insert(value: 5)
print(tree)


tree.minimum()
tree.maximum()

print(tree.height())

tree.searchAndReturnTree(forValue: 6)

tree.depth(ofValue: 3)
