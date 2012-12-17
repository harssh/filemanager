class FoldersController < ApplicationController
 
 
 
 
 def index 
   redirect_to Folder.root
   
 end
 
  def edit
  end

  def new
  @folder = @target_folder.children.build
  
  end

  def show
  end
  
  
  def create 
   
   @folder = @target_folder.children.build(params[:folder])
   
   if @folder.save
     redirect_to @target_folder
   else
     render :action => 'new'
   end 
    
  end


   def update
     if @folder.update_attributes(params[:folder])
       redirect_to edit_folder_url(@folder), :notice => t(:your_changes_were_saved)
       
     else
       render :action => 'edit'
     end
   end


  def destroy
    
    target_folder = @folder.parent
    @folder.destroy
    redirect_to target_folder
    
  end
  
  
  private 
  
  def require_existing_folder
    @folder = get_folder_or_redirect(params[:id])
    
  end
  
  def require_folder_isnt_root_folder
    
    if @folder.is_root?
      redirect_to Folder.root, :alert => t(:cannot_delete_root_folder)
      
    end
  end
   
   
   def require_delete_permissions
     unless @folder.is_root? || current_user.can_delete(@folder)
       redirect_to @folder.parent, :alert => t(:no_permissions_for_this_type, :method => t(:delete), :type =>t(:this_folder))
     else
       require_delete_permissions_for(@folder.children)
     end
   end


   def require_delete_permissions_for(folders)
     folders.each do |folder|
       unless current_user.can_delete(folder)
         redirect_to @folder.parent, :alert => t(:no_delete_permissions_for_subfolder)
       else
         require_delete_permissions_for(folder.children)
       end
     end
   end

end
