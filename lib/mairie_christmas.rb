require 'rubygems'
require 'pry'
require 'open-uri'
require 'nokogiri'

#Ne pas oublier de bien mettre les guillemets

URL = "https://annuaire-des-mairies.com/val-d-oise.html"

#Isoler les élements que je souhaite avoir dans mon tableau


#Consigne : récupérer les adresses e-mails des mairies du Val d'Oise et les mettre dans un tab
# type de tab 
# a = [
#   { "ville_1" => "email_1" },
#   { "ville_2" => "email_2" }, 
#   etc
# ]
# je distingue donc deux méthodes minimum à faire, une pour les noms des maries et une pour les emails

#regardons comment se construit l'url http://annuaire-des-mairies.com/95/ableiges.html


#------------------------------------------------------------------------------------
#liste des urls de mairie dans le 95 : programme pour sortir toutes les urls sans avoir à cliquer


def townhall_url_95
specific_townhall_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html")).xpath('//a[@class="lientxt"]/@href')  
    #chaque mairie a une url qui suit une certaine construction, on peut ajouter le xpath qui inclu le lien href
  townhall_url = specific_townhall_url.map {|x| "https://www.annuaire-des-mairies.com" + x.text[1..-1]}
  #à l'url de ma ville est donc égale au schéma d'url de ville surlequel je réalise une opération (map) sans remplacer le précédent tableau
  #et dans cette opération à chaque nouvel élément j'ajoute mon texte du href
  return townhall_url
end

#------------------------------------------------------------------------------------

#Liste des emails des mairies : scraping des emails de maries avec fonction scraping et recherche


#1/Liste des villes--------------------scraping des villes

def townhall_95
  page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))
    townhall_95 = page.xpath('//a[@class="lientxt"]') # scrape moi toutes les villes dans la page val d'oise
  return townhall_95
  end
# puts townhall_95

def get_townhall_email(townhall_url)

#je mets une condition si l'URL est nil ou empty
  return nil if townhall_url.nil? || townhall_url.empty?

#2/Liste des emails--------------------je fais une recherche intelligente de type 'contient'

  list_mail = townhall_url_95.map{ |x| #pour avoir ma liste des emails je vais effectuer une opération sur mon tableau des url de chaque mairie
      Nokogiri::HTML(open(x)).xpath('//*[contains(text(), "@")]') #ainsi pour tout élément x de mon tableau, donc chaque url de mairie, scrape le texte qui entoure un "@"
        }
#array des mails
   
  mail_hash = []# je créé mon arr
  for a in 0..townhall_95.length-1 do 
    mail_hash[a] = Hash.new
    mail_hash[a][townhall_95[a].text] = list_mail[a].text
  end
  puts mail_hash
  return mail_hash
end

#-------------------------Si mon hash est vide !--------------------------------------------------

def mail_hash

  if mail_hash.empty? #si un hash du tableau est vide, alors ne me mets pas d'erreur nil mais juste "pas de mail"
  return "Pas de mail"
  end
end

#---------------------------------ma méthode de fin pour vérifier qu'il n'y ait pas de mic mac avec mes variables-----------------------------------------------

def testing
  townhall_url = townhall_url_95
  get_townhall_email(townhall_url) 
end
testing

