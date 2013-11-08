namespace :data do
  desc "Get data from twitter API and store in database"
	task :assign => :environment do

		Node.all.each do |n|
			n.targets = []
			n.save
		end

		t=Target.where(name: "newbies").first

		["Networking", "Formal education", "Coworking space", "Advisory service"].each do |c_n|
			c=Category.where(name: c_n).first

			c.nodes.each do |n|
				n.targets << t
				n.save
			end
		end


		t=Target.where(name: "students").first

		["Networking", "Formal education", "Coworking space"].each do |c_n|
			c=Category.where(name: c_n).first
			c.nodes.each do |n|
				n.targets << t
				n.save
			end
		end


		t=Target.where(name: "entrepreneurs").first

		["Networking", "Incubator or Accelerator", "Coworking space", "Advisory service"].each do |c_n|
			c=Category.where(name: c_n).first
				c.nodes.each do |n|
				n.targets << t
				n.save
			end
		end

		t=Target.where(name: "startups").first

		["Networking", "Industry education", "Incubator or Accelerator", "Coworking space", "Government funding", "Advisory service"].each do |c_n|
			c=Category.where(name: c_n).first
				c.nodes.each do |n|
				n.targets << t
				n.save
			end
		end


	end
end
