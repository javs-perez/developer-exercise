require "rails_helper"
Array.include CoreExtensions::Array::Where

RSpec.describe CoreExtensions::Array::Where do
  let(:boris) do
    {:name => 'Boris The Blade', :quote => "Heavy is good. Heavy is reliable. If it doesn't work you can always hit them.", :title => 'Snatch', :rank => 4 }
  end
  let(:charles) do
    { :name => 'Charles De Mar', :quote => 'Go that way, really fast. If something gets in your way, turn.', :title => 'Better Off Dead', :rank => 3 }
  end
  let(:wolf) do
    { :name => 'The Wolf', :quote => 'I think fast, I talk fast and I need you guys to act fast if you wanna get out of this', :title => 'Pulp Fiction', :rank => 4 }
  end
  let(:glen) do
    { :name => 'Glengarry Glen Ross', :quote => "Put. That coffee. Down. Coffee is for closers only.",  :title => "Blake", :rank => 5 }
  end
  let!(:objects) { [boris, charles, wolf, glen]}

  it 'finds the exact match' do
    expect(objects.where(name: 'The Wolf')).to eq [wolf]
  end

  it 'finds with a partial match' do
    expect(objects.where(title: /^B.*/)).to eq [charles, glen]
  end

  it 'finds with multiple exact results' do
    expect(objects.where(rank: 4)).to eq [boris, wolf]
  end

  it 'finds with multiple criteria' do
    expect(objects.where(rank: 4, quote: /get/)).to eq [wolf]
  end

  it 'finds with chain calls' do
    expect(objects.where(quote: /if/i).where(rank: 3)).to eq [charles]
  end
end
