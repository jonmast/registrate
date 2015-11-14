class Search
  include ActiveModel::Model
  attr_accessor :term

  def initialize(options = {})
    self.term = options.fetch(:term, '')
    @page = options.fetch(:page, 1)
    @model = options.fetch(:model, User)
  end

  def response
    @response ||= @model.search(term).page(@page)
  end
end
