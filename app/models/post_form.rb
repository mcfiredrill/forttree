class PostForm
  include ActiveModel::Model

  attr_reader :branch, :leaf, :board
  delegate :name, :name=, :content, :content=, :photo, :photo=, to: :leaf

  def persisted?
    @branch.persisted?
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Post')
  end

  def id
    if persisted?
      "#{@board.id}/branch/#{@branch.id}"
    else
      @board.id
    end
  end

  def initialize(board = Board.new, branch = Branch.new, leaf = Leaf.new)
    @board = board
    @branch = branch
    @leaf = leaf
  end

  def save!
    @branch.board_id = @board.id
    @branch.save!
    @leaf.branch_id = @branch.id
    @leaf.save!
  end
end
