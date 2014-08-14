require 'net/http'
require 'open-uri'

class Hanja < ActiveRecord::Base

	def search
		study_page("", true)
	end
	
private

	def study_page(params, deep = false)
		encoded = URI::encode(name)
		result = Net::HTTP.get('hanja.naver.com', "/hanja/idiom?q=#{encoded}#{params}")
		page = Nokogiri::HTML(result)   
		word_list = page.css(".word_list")[0]
		Hanja.study(word_list)
		if !deep
			return
		end
		word_list.css(".paginate a").each do |link|
			number = link.text
			puts "Page #{number}"
			study_page("&pageNo=#{number}", false)
		end
		# word_list.css(".paginate a").
		# 	map{ |link| link.text }.
		# 	each { |number| study_page("&pageNo=#{number}") }
	end

	def self.study(word_list)
		# word_list.css("dt a .hanja").
		# 	collect { |hanjas| hanjas.collect { |hanja| hanja.text.strip }.join }.
		# 	select { |name| Hanja.do_i_know?(name) }.
		# 	each { |name| Hanjacombination.create(name: name) }
		word_list.css("dt a").each do |a|
			hanjas = a.css(".hanja")
			name = hanjas.collect { |hanja| hanja.text.strip }.join
			puts name
			do_i_know = Hanja.do_i_know?(name)
			if do_i_know
				Hanjacombination.create(name: name)
			end
		end
	end

	def self.do_i_know?(hanja_name)
		puts "Trying #{hanja_name} #{hanja_name.size}"
		hanja_encoded = URI::encode(hanja_name)
		found = hanja_name.
			split(//).
			all? {|c| Hanja.find_by_name(c) }
	end
end