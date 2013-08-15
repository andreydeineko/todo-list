class Authenticated::TasksController < Authenticated::BaseController
  before_filter :find_task!,    only: [ :update, :prioritize, :complete ]
  before_filter :find_project!, only: [ :create ]

  def create
    @task = @project.tasks.create(task_params)

    if @task.persisted?
      render json: { entry: render_to_string(partial: 'task', locals: { task: @task }), message: I18n.t('flash.authenticated.tasks.create.notice') },
             status: 202
    else
      render json: { errors: @task.errors }, status: 422
    end
  end

  # Expects an array of ids
  def destroy
    current_user.tasks.where(id: params[:task][:task_ids]).
      destroy_all

    render nothing: true, status: 200
  end

  def complete
    @task.update(completed: !@task.completed)

    render nothing: true, status: 200
  end

  def update
    if @task.update(task_params)
      render json: @task, status: 202
    else
      render text: @task.errors.full_messages.join("<br />")
    end
  end

  def prioritize
    @task.insert_at(params[:position])

    render nothing: true, status: 200
  end

  private

  def task_params
    params.require(:task).permit(:name, :position)
  end

  def find_task!
    @task = current_user.tasks.find(params[:id])
  end

  def find_project!
    @project = current_user.projects.find(params[:task][:project_id])
  end
end
