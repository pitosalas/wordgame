require 'test_helper'

class WordTest < ActiveSupport::TestCase
  def setup
    Word.create(eng: "house", ned: "huis")
    Word.create(eng: "boat", ned: "boot")
  end

  test 'the truth' do
    assert true
  end

  test 'stores translation' do
    word = Word.new(eng: 'house', ned: 'huis')
    assert_equal 'house', word.eng
    assert_equal 'huis', word.ned
  end

  test 'records stay around in database' do
    assert_equal 27, Word.count
  end

  test 'can add a record on the fly' do
    Word.create(eng: "shoe", ned: "schoen")
    assert_equal 28, Word.count
  end

  test 'cannot store word without both language versions' do
    myword = Word.create(eng: "university")
    assert_equal false, myword.valid?
  end

  test "returns a random word" do
    myword = Word.random
    assert_kind_of Word, myword
  end

  test "random word when there are no words in the database" do
    Word.destroy_all
    myword = Word.random
    assert_nil myword
  end
end
