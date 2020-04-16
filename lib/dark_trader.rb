#1/ mettre tous mes require gems

require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

#2/mettre mon url

URL = "https://coinmarketcap.com/all/views/all/"



#3/ isoler les éléments HTML qui vont bien

def crypto_names

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

# mon test avec "contains" 
keys_symbols = page.xpath('//td[contains(@class,"cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol")]//div')


#mon test avec css
#keys_symbols = URL.css('a.cmc-link').text

#keys_symbols = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3]/div')
    #all_crypto_name = un array 
  return keys_symbols

end


def crypto_values
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

#values_price = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/a')

# mon test avec contains 
values_price = page.xpath('//td[contains(@class, "cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price")]//a[contains(@href,"/currencies/")]') 


#mon test avec css
#values_price = URL.css('a.cmc-link').attribute('href').text


return values_price
end




def crypto_scraper

#4/ je réutilise les éléments scrappés plus haut pour les mettre dans un tableau, donc j'invoques mes rsultats de méthode

keys_symbols = crypto_names
values_price = crypto_values


#pour extraire le texte de l'array :

#rappel :
# result = Hash.new
# result['ta_key'] = 'ta_value'

#5/ extraire les textes (d'où format txt) et les mettres dans un hash
  result = [] 

  for a in 0..keys_symbols.length-1 do # pour tout élément a compris entre 0 et l'avant-dernier élément de mon tableau
    result[a] = Hash.new # mon tableau result aura en index de l'élément un hash
    result[a][keys_symbols[a].text]= values_price[a].text #ce hash imbriqué dans mon tableau pour chaque élément de l'index sera un couple clé/valeur avec key_symbols en clé et values_price en valeur
  end

  puts result #affiche le tableau de résultat appelé "result"
  puts keys_symbols.length

  return result # enregistre le tableau de résultat appelé "result"

end 
    
crypto_scraper #je ferme ma dernière méthode






#autres méthodes 

# test jeremy page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3]/div
# ').each do |node|
#     puts node.text
#   end

# comme celle de l'exemple dans le tuto

  # doc.xpath('//h3/a').each do |node| # test donné sur le site référence
  #   puts node.text
  # end

  # doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
  # doc.css('h3.r > a.l').each do |node|
  #   puts node.text
  # end