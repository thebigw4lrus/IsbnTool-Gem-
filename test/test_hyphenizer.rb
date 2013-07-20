=begin
  * Name: HyphenizerTest 
  * Description: Hyphenizer Unit Tests
  * Author: Javier A. Contreras V.
  * Date: Jul 19, 2013
=end 
require 'test/unit'
require 'hyphenizer'

class TestHyphenizer < Test::Unit::TestCase
  
  
  def setup
    #there is a (1-1) concordance betweens these two arrays. 
    @@test_cases_with_dashes = 
    ["978-3-635-91189-7", "978-3-635-30914-4", "978-3-635-03219-6", "978-3-635-21173-7", "978-3-635-52209-3", "978-3-635-09090-5", 
     "978-3-635-23020-2", "978-3-635-40403-0", "978-3-635-39471-3", "978-3-635-68368-8", "978-3-635-87662-2", "978-3-635-11605-6", 
     "978-3-635-44462-3", "978-3-635-77417-1", "978-3-635-80413-7", "978-3-635-77551-2", "978-3-635-99338-1", "978-3-635-32637-0", 
     "978-3-635-13846-1", "978-3-635-50315-3", "978-3-635-27423-7", "978-3-635-90130-0", "978-3-635-41787-0", "978-3-635-44641-2", 
     "978-3-635-95048-3", "978-3-635-92406-4", "978-3-635-35662-9", "978-3-635-88342-2", "978-3-635-64936-3", "978-3-635-57060-5", 
     "978-3-635-10739-9", "978-3-635-90033-4", "978-3-635-19918-9", "978-3-635-96821-1", "978-3-635-62708-8", "978-3-635-43852-3", 
     "978-3-635-95535-8", "978-3-635-72284-4", "978-3-635-26007-0", "978-3-635-11389-5", "978-3-635-13555-2", "978-3-635-34387-2", 
     "978-3-635-52217-8", "978-3-635-07635-0", "978-3-635-05772-4", "978-3-635-38858-3", "978-3-635-08541-3", "978-3-635-94269-3", 
     "978-3-635-31099-7", "978-3-635-09911-3", "978-3-635-89915-7", "978-3-635-42141-9", "978-3-635-75196-7", "978-3-635-41736-8", 
     "978-3-635-88127-5", "978-3-635-55546-6", "978-3-635-68349-7", "978-3-635-69048-8", "978-3-635-41065-9", "978-3-635-46356-3", 
     "978-3-635-20184-4", "978-3-635-72510-4", "978-3-635-13750-1", "978-3-635-05651-2", "978-3-635-26302-6", "978-3-635-82316-9", 
     "978-3-635-73739-8", "978-3-635-34107-6", "978-3-635-93683-8", "978-3-635-85723-2", "978-3-635-80783-1", "978-3-635-42133-4", 
     "978-3-635-32859-6", "978-3-635-91179-8", "978-3-635-45199-7", "978-3-635-45491-2", "978-3-635-53099-9", "978-3-635-33017-9", 
     "978-3-635-42127-3", "978-3-635-10020-8", "978-3-635-41677-4", "978-3-635-98729-8", "978-3-635-76858-3", "978-3-635-17333-2", 
     "978-3-635-75351-0", "978-3-635-07180-5", "978-3-635-66548-6", "978-3-635-68594-1", "978-3-635-63737-7", "978-3-635-51104-2", 
     "978-3-635-82136-3", "978-3-635-07441-7", "978-3-635-57828-1", "978-3-635-57306-4", "978-3-635-31655-5", "978-3-635-83073-0", 
     "978-3-635-98867-7", "978-3-635-19034-6", "978-3-635-27442-8", "978-3-635-14722-7"]
    
    @@test_cases_with_no_dashes = 
    ["9783635911897", "9783635309144", "9783635032196", "9783635211737", "9783635522093", "9783635090905", 
     "9783635230202", "9783635404030", "9783635394713", "9783635683688", "9783635876622", "9783635116056", 
     "9783635444623", "9783635774171", "9783635804137", "9783635775512", "9783635993381", "9783635326370", 
     "9783635138461", "9783635503153", "9783635274237", "9783635901300", "9783635417870", "9783635446412", 
     "9783635950483", "9783635924064", "9783635356629", "9783635883422", "9783635649363", "9783635570605", 
     "9783635107399", "9783635900334", "9783635199189", "9783635968211", "9783635627088", "9783635438523", 
     "9783635955358", "9783635722844", "9783635260070", "9783635113895", "9783635135552", "9783635343872", 
     "9783635522178", "9783635076350", "9783635057724", "9783635388583", "9783635085413", "9783635942693", 
     "9783635310997", "9783635099113", "9783635899157", "9783635421419", "9783635751967", "9783635417368", 
     "9783635881275", "9783635555466", "9783635683497", "9783635690488", "9783635410659", "9783635463563", 
     "9783635201844", "9783635725104", "9783635137501", "9783635056512", "9783635263026", "9783635823169", 
     "9783635737398", "9783635341076", "9783635936838", "9783635857232", "9783635807831", "9783635421334", 
     "9783635328596", "9783635911798", "9783635451997", "9783635454912", "9783635530999", "9783635330179", 
     "9783635421273", "9783635100208", "9783635416774", "9783635987298", "9783635768583", "9783635173332", 
     "9783635753510", "9783635071805", "9783635665486", "9783635685941", "9783635637377", "9783635511042", 
     "9783635821363", "9783635074417", "9783635578281", "9783635573064", "9783635316555", "9783635830730", 
     "9783635988677", "9783635190346", "9783635274428", "9783635147227"]
    
  end
  def test_hyphenize
    hyphenizer = IsbnsTools::Hyphenizer.new
    @@test_cases_with_no_dashes.length.times do |index| 
      assert_equal hyphenizer.hyphenize(@@test_cases_with_no_dashes[index]), @@test_cases_with_dashes[index]  
    end
  end

end