class Subscriber<ActiveRecord::Base
  has_many :comics

  attr_accessor :name, :url

  def initialize(opts={})
    @name = opts[:name]
    @url = opts[:url]
  end

  def create_subscriber_list

    BASE_URL= 'http://tapastic.com/swallowsofdoom/subscribers?series_id=1237'
    BASE_SUBSCRIBER_URL = 'http://tapastic.com'

    subscribers = []
    doc = Nokogiri::HTML(open("http://tapastic.com/swallowsofdoom/subscribers?pageNumber=1&series_id=1237"))
    #finds the last page of subscribers
    last_page_node = doc.css('div.g-pagination-wrap/a.mln')
    last_page_number = last_page_node.text

    i = 1
    while i <= last_page_number
      doc = Nokogiri::HTML(open("http://tapastic.com/swallowsofdoom/subscribers?pageNumber=" + i.to_s + "&series_id=1237"))
      subscriber_nodes = doc.css('li.ib/a.thumb-wrap')
      subscriber_nodes.each do |subscriber_node|
        subscriber_name = subscriber_node['href']
        subscriber_url = BASE_SUBSCRIBER_URL
        subscribers << Subscriber.new(name: subscriber_name, url: subscriber_url)
      end
      i +=1
    end
    suscribers
  end

end
