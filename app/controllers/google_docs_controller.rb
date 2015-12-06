class GoogleDocsController < ApplicationController

  def create
    session = GoogleDrive.login_with_oauth(current_user.oauth_token)
    remote_doc = session.create_spreadsheet(title = doc_params[:title])
    google_doc = GoogleDoc.create(doc_params)
    google_doc.url = remote_doc.human_url
    google_doc.save
    redirect_to :back 
  end

  private

  def doc_params
    params.require(:google_doc).permit(:title, :group_id)
  end

end