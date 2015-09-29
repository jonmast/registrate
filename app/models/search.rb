class Search
  include ActiveModel::Model
  attr_accessor :term

  def initialize(options = {})
    self.term = options.fetch(:term, '')
  end

  def users
    @results ||= User.search(term)
  end
end
