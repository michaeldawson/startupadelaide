ActiveAdmin.register AdminUser do     
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    actions                   
  end                                 

  filter :email                       

  form do                      
    inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    actions                         
  end                                 
end                                   
