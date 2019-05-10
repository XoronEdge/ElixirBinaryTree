defmodule AddNode do
  alias TreeNode

  def add(%TreeNode{} = user, data) do
    [user]
    |> traverse_tree(data)
  end

  defp traverse_tree([head | tail], data) do
    make_new_node(head, tail, data)
  end

  defp make_new_node(%TreeNode{leftNode: nil} = head, _, data) do
    %TreeNode{head | leftNode: %TreeNode{data: data, side: :left, parent: head}}
  end

  defp make_new_node(%TreeNode{rightNode: nil} = head, _, data) do
    %TreeNode{head | rightNode: %TreeNode{data: data, side: :right, parent: head}}
  end

  defp make_new_node(head, tail, data) do
    (tail ++ [head.leftNode, head.rightNode])
    |> traverse_tree(data)
    |> attach_new_sub_tree_to_parent(head)
  end

  defp attach_new_sub_tree_to_parent(
         %TreeNode{parent: %TreeNode{data: parent_data}} = new_sub_tree,
         %TreeNode{data: head_data} = head
       )
       when parent_data == head_data do
    %TreeNode{new_sub_tree | parent: head}
    |> join_subtree_back(head)
  end

  defp attach_new_sub_tree_to_parent(new_sub_tree, _) do
    new_sub_tree
  end

  defp join_subtree_back(%TreeNode{side: :left} = subtree, head) do
    %TreeNode{head | leftNode: subtree}
  end

  defp join_subtree_back(%TreeNode{side: :right} = subtree, head) do
    %TreeNode{head | rightNode: subtree}
  end
end
