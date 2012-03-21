require "spec_helper"

describe ApplicationController do

  it "should redirect to showrooms path after user login" do
    subject.after_sign_in_path_for(nil).should == showrooms_path
  end

end
