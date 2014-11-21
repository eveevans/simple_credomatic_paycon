require 'spec_helper'

module SimpleCredomaticPaycon
  describe Transaction do
    describe "#process" do
      let(:process) { SimpleCredomaticPaycon::Transaction.new.process }

      it "do something boy!" do
        expect(process).to be_a(Hash)
      end

    end
  end
end