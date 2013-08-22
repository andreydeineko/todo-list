class Authenticated::ProjectsController < Authenticated::BaseController
  before_filter :find_project!, only: [ :update, :destroy ]

  def index
    @projects = current_user.projects.page(params[:page]).recent_first
    @project  = Project.new
  end

  def create
    @project = current_user.projects.create(project_params)

    if @project.persisted?
      render json: { entry: render_to_string(partial: 'project', locals: { project: @project }), message: I18n.t('flash.authenticated.projects.create.notice') },
             status: 202
    else
      render json: { errors: @project.errors }, status: 422
    end
  end

  def update
    if @project.update(project_params)
      render json: @project
    else
      render text: @project.errors.full_messages.join("<br />")
    end
  end

  def destroy
    @project.destroy

    render json: { message: I18n.t('flash.authenticated.projects.destroy.notice') }, status: 200
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def find_project!
    @project = current_user.projects.find(params[:id])
  end
end
