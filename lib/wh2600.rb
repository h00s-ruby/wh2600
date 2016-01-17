require 'nokogiri'
require 'open-uri'

class Wh2600
  def initialize(ip_address)
    @ip_address = ip_address
  end

  def get_data(live_data_uri='livedata.htm')
    data = {}
    data_html = Nokogiri::HTML(open_page(live_data_uri))
    data['receiver_datetime'] = DateTime.strptime(data_html.at_xpath('//input[@name="CurrTime"]')['value'], '%H:%M %m/%d/%Y')
    data['sensors'] = {}
    data['sensors']['indoor_id'] = data_html.at_xpath('//input[@name="IndoorID"]').attr('value')
    data['sensors']['outdoor1_id'] = data_html.at_xpath('//input[@name="Outdoor1ID"]').attr('value')
    data['sensors']['outdoor2_id'] = data_html.at_xpath('//input[@name="Outdoor2ID"]').attr('value')
    data['temperature'] = {}
    data['humidity'] = {}
    data['temperature']['in'] = data_html.at_xpath('//input[@name="inTemp"]').attr('value').to_f
    data['temperature']['out'] = data_html.at_xpath('//input[@name="outTemp"]').attr('value').to_f
    data['humidity']['in'] = data_html.at_xpath('//input[@name="inHumi"]').attr('value').to_i
    data['humidity']['out'] = data_html.at_xpath('//input[@name="outHumi"]').attr('value').to_i
    data['pressure'] = {}
    data['pressure']['absolute'] = data_html.at_xpath('//input[@name="AbsPress"]').attr('value').to_f
    data['pressure']['relative'] = data_html.at_xpath('//input[@name="RelPress"]').attr('value').to_f
    data['wind'] = {}
    data['wind']['direction'] = data_html.at_xpath('//input[@name="windir"]').attr('value').to_i
    data['wind']['speed'] = data_html.at_xpath('//input[@name="avgwind"]').attr('value').to_f
    data['wind']['gust'] = data_html.at_xpath('//input[@name="gustspeed"]').attr('value').to_f
    data['solar'] = {}
    data['solar']['radiation'] = data_html.at_xpath('//input[@name="solarrad"]').attr('value').to_f
    data['solar']['uv'] = data_html.at_xpath('//input[@name="uv"]').attr('value').to_f
    data['solar']['uvi'] = data_html.at_xpath('//input[@name="uvi"]').attr('value').to_f
    data['rain'] = {}
    data['rain']['hourly'] = data_html.at_xpath('//input[@name="rainofhourly"]').attr('value').to_f
    data['rain']['daily'] = data_html.at_xpath('//input[@name="rainofhourly"]').attr('value').to_f
    data['rain']['weekly'] = data_html.at_xpath('//input[@name="rainofhourly"]').attr('value').to_f
    data['rain']['monthly'] = data_html.at_xpath('//input[@name="rainofhourly"]').attr('value').to_f
    data['rain']['yearly'] = data_html.at_xpath('//input[@name="rainofhourly"]').attr('value').to_f
    return data
  end

  def get_units(units_uri='station.htm')
    units = {}
    units_html = Nokogiri::HTML(open_page(units_uri))
    units['temperature'] = units_html.at_xpath('//select[@name="u_Temperature"]/option[@selected]/text()').to_s
    units['pressure'] = units_html.at_xpath('//select[@name="unit_Pressure"]/option[@selected]/text()').to_s
    units['rainfall'] = units_html.at_xpath('//select[@name="u_Rainfall"]/option[@selected]/text()').to_s
    units['wind'] = units_html.at_xpath('//select[@name="unit_Wind"]/option[@selected]/text()').to_s
    units['solar_radiation'] = units_html.at_xpath('//select[@name="unit_Solar"]/option[@selected]/text()').to_s
    return units
  end

  private
  def open_page(page)
    open("http://#{@ip_address}/#{page}")
  end
end
