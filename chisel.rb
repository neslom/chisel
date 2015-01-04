# require 'pry'
# class Chisel
# 	attr_reader :separate_lines
# 	def initialize
# 		@separate_lines = nil
# 	end

#   def split_lines(document)
#   	@separate_lines = document.split(/\n\n/)
#   end

#   def hasher
#   	separate_lines.map do |line|
# 	  	if line.include?("#####")
# 				line = line + "</h5>\n\n"
# 				line.gsub("##### ", "<h5>")
# 			elsif line.include?("####")
# 				line = line + "</h4>\n\n"
# 				line.gsub("#### ", "<h4>")
# 			elsif line.include?("###")
# 				line = line + "</h3>\n\n"
# 				line.gsub("### ", "<h3>")
# 			elsif line.include?("##")
# 				line = line + "</h2>\n\n"
# 				line.gsub("## ", "<h2>")	
# 			elsif line.include?("#")
# 				line = line + "</h1>\n\n"
# 				line.gsub("# ", "<h1>")
# 			elsif line == ""
# 				next
# 			else
# 			  	 "<p>
# 	  #{line}
# 	</p>"
# 			end
# 	  end
#   end
# end



document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."'

separate_lines = document.split(/\n\n/)

markdown = separate_lines.map do |line|
	if line.include?("#####")
		line = line + "</h5>\n\n"
		line.gsub("##### ", "<h5>")
	elsif line.include?("####")
		line = line + "</h4>\n\n"
		line.gsub("#### ", "<h4>")
	elsif line.include?("###")
		line = line + "</h3>\n\n"
		line.gsub("### ", "<h3>")
	elsif line.include?("##")
		line = line + "</h2>\n\n"
		line.gsub("## ", "<h2>")	
	elsif line.include?("#")
		line = line + "</h1>\n\n"
		line.gsub("# ", "<h1>")
	elsif line == ""
		next
	else
		  	 "<p>
  #{line}
</p>"
	end
end



# # # regex for finding \*.+\* 
# p separate_lines
puts markdown
# parser = Chisel.new
# parser.split_lines(document)
# p parser.separate_lines
# puts parser.hasher





