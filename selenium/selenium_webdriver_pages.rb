#!env ruby
# frozen_string_literal: true

require 'selenium-webdriver'
require './pages/index.rb'

BASE_URL = 'http://localhost:3000'

driver = Selenium::WebDriver.for :safari

index_page = IndexPage.new BASE_URL, driver

index_page
  .open
  .fill_form_with('1 22 33')
  .submit_form
  
res = index_page.result.strip
raise 'Поле результата содержит некорректные данные' unless res == 'Отрезков не нашлось...'

index_page
  .open
  .fill_form_with('1 22 aa')
  .submit_form
  
res = index_page.result.strip
raise 'Поле результата содержит некорректные данные' unless res == 'Некорректный ввод'

index_page
  .open
  .fill_form_with('1 2 6 6 6')
  .submit_form
  
res = index_page.result.strip.delete(' ').delete("\n")
raise 'Поле результата содержит некорректные данные' unless res == '#ОтрезкиИндексы1[6][2]2[6,6][2,3]3[6,6,6][2,4]4[6][3]5[6,6][3,4]6[6][4][6,6,6]::[2,4]'

driver.quit
