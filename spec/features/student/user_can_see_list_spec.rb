require 'rails_helper'

describe 'user visits' do
  describe 'the index' do
    scenario 'they see all the students' do
      student1 = Student.create(name: 'Anakin Skywalker')
      student2 = Student.create(name: 'Luke Skywalker')
      student3 = Student.create(name: 'Ben Kenobi')

      visit students_path

      expect(page).to have_content(student1.name)
      expect(page).to have_content(student2.name)
      expect(page).to have_content(student3.name)
      expect(page).to have_link('Delete', count: 3)
    end

    scenario 'they click on a student to view the show page' do
      student1 = Student.create(name: 'Anakin Skywalker')

      visit students_path
      click_on student1.name

      expect(current_path).to eq(student_path(student1))
    end
  end
end