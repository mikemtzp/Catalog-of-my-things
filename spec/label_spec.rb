require_relative '../classes/label'

describe Label do
  before(:each) do
    @label = Label.new('Vampire', 'Black')
  end

  it 'Returns @label as an instance of Label class' do
    expect(@label).to be_an_instance_of(Label)
  end

  it 'Contains title of the label' do
    expect(@label.title).to eq('Vampire')
  end

  it 'Contains color of the label' do
    expect(@label.color).to eq('Black')
  end
end
