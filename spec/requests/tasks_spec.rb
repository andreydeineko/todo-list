require 'spec_helper'

describe 'Tasks' do
  let!(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }

  context 'Persisted' do
    let!(:project) { FactoryGirl.create(:project, user: user) }
    let!(:task)    { FactoryGirl.create(:task, project: project) }

    before { visit projects_path }

    describe 'Destroy', js: true do
      it 'destroys task' do
        check_task_checkbox_for task
        within "div.project#project-#{project.id}" do
          click_link 'Delete selected tasks'
        end
        page.driver.browser.switch_to.alert.accept

        page.should_not have_content(task.name)
      end
    end

    describe 'Update', js: true do
      let(:new_task_name) { 'New task name' }

      it 'updates task' do
        hover_over task
        click_link "edit-task-name-#{task.id}"


        find('div.editable-input input').set new_task_name
        find('button.editable-submit').click

        page.should have_content(new_task_name)
      end
    end

    describe 'Complete', js: true do
      it 'completes task' do
        hover_over(task)
        within "li#task-item-#{task.id}" do
          click_link 'Mark as completed'
        end

        page.should have_selector("li#task-item-#{task.id}.completed")
      end
    end

    describe 'Uncomplete', js: true do
      it 'uncompletes task' do
        # so quick and stupid
        task.update(completed: true)
        visit projects_path

        hover_over(task)
        within "li#task-item-#{task.id}" do
          click_link 'Mark as uncompleted'
        end

        page.should_not have_selector("li#task-item-#{task.id}.completed")
      end
    end
  end

  context 'Not persisted' do
    describe 'Create', js: true do
      it 'creates new task' do
        visit projects_path
      end
    end
  end

  private

  def hover_over task
    page.execute_script "$('li#task-item-#{task.id}').trigger('mouseenter')"
  end

  def check_task_checkbox_for task
    find("label[for='task-#{task.id}']").click
  end
end
