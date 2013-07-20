=begin
  * Name: TestFaker
  * Description: Hyphenizer Unit Tests
  * Author: Javier A. Contreras V.
  * Date: Jul 19, 2013
=end 
require 'test/unit'
require 'faker'

class TestFaker < Test::Unit::TestCase
   
  def test_faker
    faker = IsbnsTools::Faker.new 
    10.times do 
      assert_equal is_valid_isbn13?(faker.fake_isbn()), true 
    end
     assert_equal is_valid_isbn13?(faker.fake_isbn(start: 9783, range: 635)), true 
     assert_equal is_valid_isbn13?(faker.fake_isbn(start: 9783, range: 635)), true 
     assert_equal is_valid_isbn13?(faker.fake_isbn(start: 978970, range: 3245)), true 
     assert_equal is_valid_isbn13?(faker.fake_isbn(start: 978971, range: 12)), true 
     assert_equal is_valid_isbn13?(faker.fake_isbn(start: 978975, range: 6)), true 
     assert_equal is_valid_isbn13?(faker.fake_isbn(start: 9787, range: 4)), true 
  end
  
  #The next 2 functions were taken from isbn-tools-0.1.0 gem 
  #in order to have an external isbn validator for testing my gem 
  #Thanks to Thierry Godfroid
  #http://bit.ly/18v8hDf
  def is_valid_isbn13?(isbn_)
    isbn = cleanup(isbn_)
    return false if isbn.nil? or isbn.length!=13 or isbn.match(/^97[8|9][0-9]{10}$/).nil?
    sum = 0
    0.upto(12) { |ndx| sum += isbn[ndx].chr.to_i * (ndx % 2 == 0 ? 1 : 3) }
    sum.remainder(10) == 0
  end
  
  def cleanup(isbn_)
    isbn_.gsub(/[^0-9xX]/,'').gsub(/x/,'X') unless isbn_.nil? or isbn_.scan(/([xX])/).length > 1
  end
end
