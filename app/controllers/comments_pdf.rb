class CommentsPdf < Prawn::Document
  def initialize(comments, resource)
    super()
    @comments = comments
    @resource = resource
    header
    text_content
  end

  def header
    bounding_box([120, cursor], :width => 600) do
      image "#{Rails.root}/app/assets/images/header.png", width: 300, height: 75
    end
  end

  def text_content
    
    y_position = cursor - 50
    

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 600) do
      text "Comments for #{@resource.title}:", size: 15, style: :bold
    end

    bounding_box([0, y_position-50], :width => 600) do
      @comments.each do |comment|
        text "#{comment.user.gmail_name} | #{comment.content}"
      end
    end

  end

 
end