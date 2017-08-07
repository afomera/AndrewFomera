require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'post is valid with a title and content' do
    post = Post.new(title: 'Hello world', content: 'It is a wonderful day')
    assert post.valid?
  end

  test 'post is not valid without a title' do
    post = Post.new(content: 'foo')
    assert_not post.valid?
  end

  test 'post is not valid without content' do
    post = Post.new(title: 'foo')
    assert_not post.valid?
  end
end
