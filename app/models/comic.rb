class Comic<ActiveRecord::Base
  has_many :subscribers

  attr_accessor :name, :url

  def initialize(opts={})
    @name = opts[:name]
    @url = opts[:url]
  end
end
