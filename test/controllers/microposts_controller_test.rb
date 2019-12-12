require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @micropost = microposts(:orange)
  end
  
  test "should redirect destroy for wrong microposts" do
      log_in_as(users(:michael))
      micropost=microposts(:ants)
      assert_no_difference 'Micropost.count' do
          delete micropost_path(micropost)
      end 
      assert_redirected_to root_url
      
  end
end 