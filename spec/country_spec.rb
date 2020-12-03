describe CovidStatsCli::Country do 

    let(:usa_attributes) {
        {
        :country => "USA",
        :cases => 2000
        }
    }

    let(:usa) {CovidStatsCli::Country.new(usa_attributes)}
    
    let(:norway_attributes) {
        {
        :country => "Norway",
        :cases => 500,
        :tested => 1040
        }
    }

    let(:norway) {CovidStatsCli::Country.new(norway_attributes)}
    
    context "creates attr_accessor for each key/value pair using #send with a shorter hash" do 
        it "assigns an attr_accessor upon initialization from a hash as an argument for each key/value pair" do
            expect(usa.country).to eq(usa_attributes[:country])
            expect(usa.cases).to eq(usa_attributes[:cases])
        end
    end
    
    context "creates attr_accessor for each key/value pair using #send with a different longer hash" do 
        it "also assigns an attr_accessor upon initialization from a hash as an argument for each key/value pair" do
            expect(norway.country).to eq(norway_attributes[:country])
            expect(norway.cases).to eq(norway_attributes[:cases])
            expect(norway.tested).to eq(norway_attributes[:tested])
        end
    end

end
