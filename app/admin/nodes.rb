ActiveAdmin.register Node do
	form do |f|
		f.inputs do
			f.input :name
			f.input :category, as: :select, collection: Category.all
			f.input :description, as: :text

			#f.input :who_for, label: "Who's it for?"
			#f.input :more, label: "How can we find out more?"
		
		end

		f.inputs "Who's it for?" do
			f.input :targets, label: "Ideal for"
			
		end

		f.inputs "Social Links" do
			f.has_many :social_links do |ff|
				ff.input :social_key, as: :select, collection: SocialLinkPrefill.all.map {|slp| slp.name}
				ff.input :link_url
			end
		end

		f.actions
	end

	index do 
		
		column :name
		column :category
		#column :what
		#column :who_for
		#column :more
		actions
	end

	controller do
		def new
	  		@node = Node.new

	  		SocialLinkPrefill.all.each do |link|
	  			@node.social_links << SocialLink.new(:social_key=>link.name)
	  		end
	  	end

	  	def upload
	  		Node.import(params[:file])
	  		redirect_to admin_nodes_path
	  	end
	end
end



