require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

#Ne pas oublier de bien mettre les guillemets

URL = "http://annuaire-des-mairies.com/"

#Isoler les élements que je souhaite avoir dans mon tableau


#Consigne : récupérer les adresses e-mails des mairies du Val d'Oise et les mettre dans un tab
# type de tab 
# a = [
#   { "ville_1" => "email_1" },
#   { "ville_2" => "email_2" }, 
#   etc
# ]
# je distingue donc deux méthodes à faire, une pour les maries et une pour les e,mails

#regardons comment se construit l'url http://annuaire-des-mairies.com/95/ableiges.html

#95 / number département
#def number end

#url_val_oise = "http://annuaire-des-mairies.com/95/"
x = []

def townhall

#xpath = "//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"))

townhall = page.xpath('//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]').each do |node|
puts node.text

return townhall	
end


def townhall_url
puts "http://annuaire-des-mairies.com/95/"+townhall.downcase+ ".html" << x
puts x.compact.join
return x.compact.join = townhall_url
end



def get_townhall_email(townhall_url)
#xpathemail = "/html/body/div/main/section[2]/div/table/tbody/tr[4]/td"
page = Nokogiri::HTML(open(townhall_url))

get_townhall_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
puts node.text

return get_townhall_email
end

def mairie_xmas

result = []

for a in 0..townhall.size do result[a] = Hash.new
	result[a][townhall[a].text] = get_townhall_email[a].text
end

puts result
retunr result

end








