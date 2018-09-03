# def get_group_id(grp_str_arr)
#   Group.where(:name => grp_str_arr.split(';')).pluck(:id)
# end
# def add_to_usr(usr_info)
#   User.find_or_create_by(usr_info)
# end
# smart_option = {
#   :col_sep => ',',
#   :row_sep => "\n",
#   :strip_chars_from_headers => /[\-"]/,
#   :force_simple_split => true,
#   :remove_unmapped_keys => true,
#   :verbose => true
# }
# User.delete_all
# User.create({:isadmin => true, :email=>"mud@mud.com", :name=>"mud", :username=>"mud", :snow_user=>"mud", :phone_user=>"mud", :quality_user=>"mud", :password => "12", :password_confirmation => "12"})
# data = SmarterCSV.process(File.join(Rails.root, 'db/user.csv'), smart_option) do |c|
#   usr_info = c[0]
#   usr_grps = get_group_id(usr_info[:group_id])
#   usr_info.delete_if {|key, value| key == :group_id }
#   usr = add_to_usr(usr_info)
#   if usr.new_record?
#     usr.password = 'password'
#     usr.password_confirmation = 'password'
#     usr.isadmin = false
#   end
#   usr_grps += usr.group_ids
#   usr.group_ids = usr_grps.uniq
# end
