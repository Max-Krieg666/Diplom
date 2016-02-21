module DisciplinesHelper
  def select_teacher(teacher, selected = nil)
    select_tag(teacher, options_for_select(
        [['', nil]] + teacher.order('lastname, firstname, patronymic, login').load.map{ |x| [x.fio, x.id] },
        [selected]))
  end
end
