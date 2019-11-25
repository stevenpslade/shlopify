module ImageAttachmentConcern
  extend ActiveSupport::Concern

  included do
    helper_method :delete_image_attachment
  end

  def delete_image_attachment
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    render json: {}, status: :ok
  end
end