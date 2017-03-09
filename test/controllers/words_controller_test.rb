require 'test_helper'
require 'minitest/mock'

class WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get learn" do
    get words_learn_url
    assert_response :success
  end

  test "should pick up new word learn" do
    get words_learn_url
    assert_kind_of Word, assigns('word')
    assert_response :success
  end

  test "pass a word form random" do
    target_word = Word.new(eng: "nose", ned: "neus")
    Word.stub :random, target_word do
      get words_learn_url
      assert_equal target_word, assigns('word')
    end
  end
end
