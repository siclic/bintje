module RequestSharedExamples


    shared_examples_for "any request" do
      it "response.class == OpenObject::BackendResponse" do
        response.class.should be OpenObject::BackendResponse
      end
    end

    shared_examples_for "any successful request" do
      it_behaves_like "any request"
      it "response.success : true" do
        response.success.should be true
      end
    end

    shared_examples_for "any failed request" do
      it_behaves_like "any request"
      it "response.success : false" do
        response.success.should be false
      end

      it "response.errors[:faultCode] Server faultCode" do
        response.errors[:faultCode].should eql ServerStub.faultCode
      end

      it "response.errors[:faultString] Server faultString" do
        response.errors[:faultString].should eql ServerStub.faultString
      end

    end


    shared_examples_for "any object request" do
      it "creates connection with context" do
        ReceiverModel.should_receive(:connection).with(user_context)
        response
      end
    end


end