class Subscriber<ActiveRecord::Base
  has_many :comics

  attr_accessor :name, :url

  def initialize(opts={})
    @name = opts[:name]
    @url = opts[:url]
  end
end
