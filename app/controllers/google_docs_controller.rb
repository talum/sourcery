class GoogleDocsController < ApplicationController

  def create
    @group = Group.find(doc_params[:group_id])
    group_name = @group.topic
    session = GoogleDrive.login_with_oauth(current_user.oauth_token)
    # folder = session.collection_by_title(group_name)
    # binding.pry
    folder = session.root_collection.create_subcollection(group_name)
    
    if doc_params[:doc_type] == "Document"
      remote_doc = session.upload_from_string("Collaborate here!", title=doc_params[:title], :content_type => "text/plain")
    elsif doc_params[:doc_type] == "Spreadsheet"
      remote_doc = session.create_spreadsheet(title = doc_params[:title])
    end
    folder.add(remote_doc)
    @google_doc = GoogleDoc.create(doc_params)
    @google_doc.url = remote_doc.human_url
    @google_doc.save

    respond_to do |format|
      format.js { render action: '../groups/show', status: :created, location: @group}
    end
  end

  private

  def doc_params
    params.require(:google_doc).permit(:title, :doc_type, :group_id)
  end

end