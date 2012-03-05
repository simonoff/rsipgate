require "spec_helper"

describe Sipgate::Base do

  context "#my_api_host" do
    context "without set" do
      its(:my_api_host) { should == 'samurai.sipgate.net'}
    end
    context "with set" do
      subject do
        Sipgate.api_host = 'api.sipgate.net'
        Sipgate::Base.new
      end
      its(:my_api_host) { should == 'api.sipgate.net'}
    end
  end

  context "#strip" do
    subject { Sipgate::Base.new.strip(number) }
    ["+496912345678", "4-969-1234-5678", "4.969.1234.5678"].each do |value|
      context "#{value}" do
        let(:number) { value }
        it {should == "496912345678"}
      end
    end
  end

  context "#rubyized_hash" do
    subject { Sipgate::Base.new.rubyized_hash(original_hash) }
    let(:original_hash) do
      {
        "ServerKey1" => %w(value1 value3),
        "ServerKey2" => "value2",
        "ServerKey3" => ["value4", {
          "ServerKey4" => "value5"
        }]
      }
    end
    let(:result_hash) do
      {
        :server_key1 => %w(value1 value3),
        :server_key2 => "value2",
        :server_key3 => ["value4", {
            :server_key4 => "value5"
        }]
      }
    end
    it { should eql result_hash }
  end

end