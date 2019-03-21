module Admin::SubjectsHelper
  def select_option_subjects
    @subjects = Subject.all
    @list_subjects = {}
    @subjects.each do |subject|
      @list_subjects[subject.name_subject.to_s] = subject.id
    end
  end
end
