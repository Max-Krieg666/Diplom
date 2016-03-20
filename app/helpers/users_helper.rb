module UsersHelper
  def select_group(group, selected = nil)
    select_tag(group, options_for_select(
			Group.order('numer').load.map{ |x| [x.numer, x.id] },
			  [selected]), id: 'choose-group')
  end
end
