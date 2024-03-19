# frozen_string_literal: true

RSpec.describe OnStrum::Healthcheck::RspecHelper::ContextGenerator, type: :helper do
  describe '#random_message' do
    it 'returns random message' do
      expect(::FFaker::Lorem).to receive(:sentence).and_call_original
      expect(random_message).to be_an_instance_of(::String)
    end
  end

  describe '#random_service_name' do
    it 'returns random service name' do
      expect(::FFaker::InternetSE).to receive(:login_user_name).and_call_original
      expect(random_service_name).to be_an_instance_of(::String)
    end
  end
end
