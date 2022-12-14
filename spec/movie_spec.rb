require './classes/movie'

describe Movie do
  context 'When testing Movie class' do
    before :each do
      @movie = Movie.new('The Lord of the Rings', '2022-09-06', nil)
    end

    it 'title property should be The Lord of the Rings' do
      expect(@movie.title).to eq 'The Lord of the Rings'
    end

    it 'publish_date property should be a Date class' do
      expect(@movie.publish_date.class).to eq Date
    end

    it 'should show the publish date' do
      expect(@movie.publish_date.year).to eq 2022
    end

    it 'silet property shoould be false' do
      expect(@movie.silet).to eq false
    end

    it 'can_be_archived method should return false' do
      expect(@movie.send(:can_be_archived?)).to eq false
    end

    it 'can_be_archived should return true' do
      @movie.silet = true
      expect(@movie.send(:can_be_archived?)).to eq true
    end
  end
end
