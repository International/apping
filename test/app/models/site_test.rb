require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class SiteTest < Test::Unit::TestCase
  context "Site Model" do
    should 'construct new instance' do
      @site = Site.new
      assert_not_nil @site
    end
  end
end
