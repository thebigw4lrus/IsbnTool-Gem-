IsbnTools gem
---------------------------------------------------------------------------------------------------------------------------


Running the tests:
---------------------------------------------------------------------------------------------------------------------------
#rake tests



Hyphenizing 
---------------------------------------------------------------------------------------------------------------------------
irb> require 'hypenizer'

irb> hyp = IsbnsTools::Hyphenizer.new

irb> hyp.Hyphenize("9783635266942")

=> 978-3-635-26694-2


Faking an Isbn 
---------------------------------------------------------------------------------------------------------------------------
irb> require 'faker'

irb> faker = IsbnsTools::Faker.new

irb> faker.fake_isbn()

=> 978-3-635-26694-2



irb> faker.fake_isbn(start: 9783, range: 635)

=> 978-3-635-26694-2




