require 'spec_helper'

describe Sipgate do
  context "defaults" do
    subject { Sipgate }
    its(:user) { should be_nil}
    its(:password) {should be_nil}
    its(:api_host) {should be_nil}
  end
  context "with user and password" do
    subject do
      Sipgate.user = "user"
      Sipgate.password = "password"
      Sipgate.api_host = "api.sipgate.net"
      Sipgate
    end
    its(:user) { should == "user"}
    its(:password) {should == "password"}
    its(:api_host) {should == "api.sipgate.net"}
  end
end