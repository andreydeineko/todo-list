require 'spec_helper'

describe 'Projects' do
  let!(:user) { FactoryGirl.create(:user) }

  before { sign_in(user) }

  describe 'Create', js: true do
    let(:project) { FactoryGirl.build(:project) }

    it 'should create new project' do
      visit projects_path

      fill_in 'project_name', with: project.name
      click_button I18n.t('common.submit')

      page.should have_content project.name
    end
  end

  describe 'Destroy', js: true do
    it 'should destroy project' do
      project = FactoryGirl.create(:project, user: user)

      visit projects_path
      click_link I18n.t('authenticated.projects.project.destroy')
      page.driver.browser.switch_to.alert.accept
      page.should_not have_content(project.name)
    end
  end

  describe 'Update', js: true do
    let(:new_project_name) { 'New project name' }

    it 'should update project' do
      project = FactoryGirl.create(:project, user: user)
      visit projects_path

      click_link "edit-project-name-#{project.id}"
      find('div.editable-input input').set new_project_name
      find('button.editable-submit').click

      page.should have_content(new_project_name)
    end
  end
end
