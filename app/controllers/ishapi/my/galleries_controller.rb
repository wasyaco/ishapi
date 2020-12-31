
class Ishapi::My::GalleriesController < Ishapi::My::MyController

  ## expects params[:jwt_token]
  def index
    authorize! :my_index, Gallery
    @galleries = @current_user.profile.galleries.unscoped.where( is_trash: false ).order_by( created_at: :desc ).limit(20)
    render 'ishapi/galleries/index'
  end

end

