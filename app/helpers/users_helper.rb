module UsersHelper
  def select_group(group, selected = nil)
    select_tag(group, options_for_select(
        [['', nil]] + Group.order('numer').load.map{ |x| [x.numer, x.id] },
        [selected]))
  end
end
