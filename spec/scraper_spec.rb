describe CovidStatsCli::Scraper do

    let!(:covid_stats_array) {[{:country => "USA", :cases => 1}]}

    describe "#get_response_body" do
        it "gets the api body response" do
        expect(subject.get_response_body).to be_a(String)
        expect(subject.get_response_body).to include("country", "cases", "deaths",)
        end
    end

    describe "#parse_json" do
        it "parses api response body" do
        expect(subject.parse_json).to be_a(Array)
        end
    end

end