require 'rails_helper'

# rubocop:disable RSpec/DescribeClass
describe 'Elk queries' do
  it 'is a JSON file' do
    data = File.read('app/data/queries/current_status.json')
    json = JSON.parse(data)
    expect(json.class).to be(Hash)
  end

  it 'is a JSON file' do
    data = File.read('app/data/queries/availability_history.json')
    json = JSON.parse(data)
    expect(json.class).to be(Hash)
  end

  it 'is a JSON file' do
    data = File.read('app/data/queries/homepage_status.json')
    json = JSON.parse(data)
    expect(json.class).to be(Hash)
  end
end
