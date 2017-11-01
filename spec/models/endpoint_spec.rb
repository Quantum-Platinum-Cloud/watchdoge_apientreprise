describe Endpoint, type: :model do
  context 'happy path' do
    subject do
      described_class.new(
        name: name,
        sub_name: sub_name,
        api_version: api_version,
        api_name: api_name,
        period: period,
        parameter: parameter,
        options: options
      )
    end

    let(:name) { 'service name' }
    let(:sub_name) { 'sub name' }
    let(:api_version) { 2 }
    let(:api_name) { 'apie' }
    let(:period) { 1 }
    let(:parameter) { '00000' }
    let(:options) { 'options' }

    its(:name) { is_expected.to eq(name) }
    its(:sub_name) { is_expected.to eq(sub_name) }
    its(:fullname) { is_expected.to eq("#{sub_name}/#{name}") }
    its(:api_version) { is_expected.to eq(api_version) }
    its(:api_name) { is_expected.to eq(api_name) }
    its(:period) { is_expected.to eq(period) }
    its(:parameter) { is_expected.to eq(parameter) }
    its(:options) { is_expected.to eq(options) }
    its(:valid?) { is_expected.to be_truthy }
  end

  context 'is not valid' do
    subject { described_class.new(api_version: 5, period: 12) }

    its(:valid?) { is_expected.to be_falsy }

    context 'errors messages' do
      subject { described_class.new(api_version: 5).errors.messages }

      its([:name])        { is_expected.not_to be_nil }
      its([:api_version]) { is_expected.not_to be_nil }
      its([:api_name])    { is_expected.not_to be_nil }
      its([:period])      { is_expected.not_to be_nil }
      its([:parameter])   { is_expected.not_to be_nil }
      its([:options])     { is_expected.not_to be_nil }
    end
  end
end
