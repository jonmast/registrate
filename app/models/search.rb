class Search
  include ActiveModel::Model
  attr_accessor :term

  def initialize(options = {})
    self.term = options.fetch(:term, '')
    @page = options.fetch(:page, 1)
  end

  def users
    @results ||= User.search(term).page(@page)
  end
end
