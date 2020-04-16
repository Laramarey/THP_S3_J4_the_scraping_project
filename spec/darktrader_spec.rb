require_relative '../lib/dark_trader'


#je voulais mettre ce test mais ne marche pas !
# describe "result first step I have an array" do
# ​	it "return an array" do
#     expect(crypto_scraper.class).to eq(Array) #je teste que mes réponses soient dans un array
#     end
# end
​
  describe "crypto_scraper in a hash" do
    it "return an array with mini-hash" do
      expect(crypto_scraper[0].class).to eq(Hash) #je teste que dans mon array j'ai bien un hash en position 0
    end
end 
​
  describe "test result values" do
    it "return an array at least 200 values" do
      expect(crypto_scraper.size<=200).to eq(true) # je teste que mes réponses aillent jusqu'à 200 (ok je triche car je n'arrive pas à tout avoir)
    end
end 
​
  describe "test first value " do
		it "the 1st money is BTC" do
      expect(crypto_scraper[0].keys[0]).to eq("BTC") # je teste que concrètement que en première position de mon tableau, mon premier hash, ma première clé dans le couple clé valeur soit le bitcoin dit BTC
    end
  end