require 'nokogiri'
require 'faraday'
require 'bigdecimal'

class CurrencyParser
  attr_reader :url, :doc

  def initialize(url:)
    @url = url
    @doc = parse_html
  end

  def parse
    trs = doc.xpath('//tr')[1...-1]
    trs.each_with_object({}) do |tr, result|
      name = tr.children[1].text
      value = tr.children[3].text.scan(/\d+.\d+/).first
      result[name] = BigDecimal(value)
    end
  end

  private

  def parse_html
    resp = Faraday.get(url, {},
                       { 'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64; rv:90.0) Gecko/20100101 Firefox/90.0' })
    @doc = Nokogiri::HTML(resp.body)
  end
end
