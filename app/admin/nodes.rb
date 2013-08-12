ActiveAdmin.register Node do
	form do |f|
		f.inputs do
			f.input :name
			f.input :category, as: :select, collection: Category.all
			f.input :what, label: "What is it?"
			f.input :who_for, label: "Who's it for?"
			f.input :more, label: "How can we find out more?"
			

			
			f.has_many :social_links do |ff|

			end
			#	fu.input :social_key, as: :select, collection: Category.all
				
			#	fu.input :_destroy, :as=>:boolean, :required => false, :label => 'Delete Tag' unless fu.object.new_record?
			
		end

		f.actions
	end
end
