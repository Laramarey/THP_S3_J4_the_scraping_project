require_relative '../lib/mairie_christmas'


describe "get_townhall_email method, it takes an url and gives back a hash" do
  it "test no url" do
    expect(get_townhall_email("")).to eq(nil)
  end
  it "test good url" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/nerville-la-foret.html")).to eq({"nerville-la-foret"=>"mairie-nerville95@wanadoo.fr"})
  end
  it "test good url" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/nerville-la-foret.html")).to be_kind_of(Hash)
  end
  
end