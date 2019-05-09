alias TreeNode

root = %TreeNode{data: 1}

root = TreeNode.add_node(root, 2)
root = TreeNode.add_node(root, 3)
root = TreeNode.add_node(root, 4)
root = TreeNode.add_node(root, 5)
root = TreeNode.add_node(root, 6)
root = TreeNode.add_node(root, 7)
root = TreeNode.add_node(root, 8)
root = TreeNode.add_node(root, 9)
root = TreeNode.add_node(root, 10)
root = TreeNode.add_node(root, 11)
root = TreeNode.add_node(root, 12)
root = TreeNode.add_node(root, 13)
root = TreeNode.add_node(root, 14)
IO.inspect(root.rightNode.leftNode.rightNode.data)
