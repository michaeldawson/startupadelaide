ActiveAdmin.register Node do
	permit_params :name, :category_id, :description, target_ids: [], social_links_attributes: [:id, :social_key, :link_url, :_destroy]

	form do |f|
		f.inputs do
			f.input :name
			f.input :category, as: :select, collection: Category.all
			f.input :description, as: :text
		end

		f.inputs "Who's it for?" do
			f.input :targets, label: "Ideal for"
		end

		f.inputs "Social Links" do
			f.has_many :social_links do |ff|
				ff.input :social_key, as: :select, collection: SocialLinkPrefill.all.map {|slp| slp.name}
				ff.input :link_url, label: "Link URL - should start with with http://"
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



