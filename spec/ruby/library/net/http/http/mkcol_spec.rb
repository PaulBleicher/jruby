require File.expand_path('../../../../../spec_helper', __FILE__)
require 'net/http'
require File.expand_path('../fixtures/http_server', __FILE__)

describe "Net::HTTP#mkcol" do
  before :each do
    NetHTTPSpecs.start_server
    @http = Net::HTTP.start("localhost", 3333)
  end

  after :each do
    @http.finish if @http.started?
    NetHTTPSpecs.stop_server
  end

  it "sends a MKCOL request to the passed path and returns the response" do
    response = @http.mkcol("/request")
    response.should be_kind_of(Net::HTTPResponse)
    response.body.should == "Request type: MKCOL"
  end
end
