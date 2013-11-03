require './spec/spec_helper'

describe Economic::Endpoint do
  subject { Economic::Endpoint.new }

  describe "call" do
    let(:client) {
      Savon::Client.new do
        wsdl.document = File.expand_path(File.join(File.dirname(__FILE__), "economic.wsdl"))
      end
    }

    it "uses the SOAP client to invoke a SOAP action on the API" do
      client.expects(:request).with(:economic, :foo_bar).returns({})
      subject.call(client, :foo_bar, {:baz => 'qux'})
    end

    it "sends an actual request" do
      mock_request('Connect', nil, :success)
      subject.call(client, :connect)
    end

    it "returns a Savon response" do
      stub_request('CurrentInvoice_GetAll', nil, :single)
      subject.call(client, :current_invoice_get_all).should be_instance_of(Savon::SOAP::Response)
    end
  end

  describe "soap_action_name" do
    it "returns full action name for the given class and soap action" do
      subject.soap_action_name(Economic::Debtor, :get_data).should == :debtor_get_data
    end

    it "returns full action name for a class given as strings" do
      subject.soap_action_name("FooBar", "Stuff").should == :foo_bar_stuff
    end
  end
end