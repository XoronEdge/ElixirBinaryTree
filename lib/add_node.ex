defmodule AddNode do
  alias TreeNode

  def add(%TreeNode{} = user, data) do
    node_array = [user]
    traverse_tree(node_array, data)
  end

  defp traverse_tree([], _) do
  end

  defp traverse_tree([head | tail], data) do
    make_new_node(head, head, tail, data)
  end

  defp join_subtree_back(:left, head, subtree) do
    %TreeNode{head | leftNode: subtree}
  end

  defp join_subtree_back(:right, head, subtree) do
    %TreeNode{head | rightNode: subtree}
  end

  defp make_new_node(%TreeNode{leftNode: left}, head, _, data) when left == nil do
    %TreeNode{head | leftNode: %TreeNode{data: data, side: :left, parent: head}}
  end

  defp make_new_node(%TreeNode{rightNode: right}, head, _, data) when right == nil do
    %TreeNode{head | rightNode: %TreeNode{data: data, side: :right, parent: head}}
  end

  defp make_new_node(_, head, tail, data) do
    checkList = tail ++ [head.leftNode, head.rightNode]
    new_sub_tree = traverse_tree(checkList, data)
    attach_new_sub_tree_to_parent(new_sub_tree.parent.data, head.data, new_sub_tree, head)
  end

  defp attach_new_sub_tree_to_parent(parent_data, head_data, new_sub_tree, head)
       when parent_data == head_data do
    new_sub_tree = %TreeNode{new_sub_tree | parent: head}
    join_subtree_back(new_sub_tree.side, head, new_sub_tree)
  end

  defp attach_new_sub_tree_to_parent(_, _, new_sub_tree, _) do
    new_sub_tree
  end
end
