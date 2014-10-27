class PopulateGroupCreatorWithProgress < ActiveRecord::Migration
  def change
    #for each group assign first admin with membership and assign as creator
    #could there be a Membership level of creator?
    progress_bar = ProgressBar.create( format: "(\e[32m%c/%C\e[0m) %a |%B| \e[31m%e\e[0m ",
                                       progress_mark: "\e[32m/\e[0m",
                                       total: Group.count )

    Group.includes(:memberships).find_each(batch_size: 100) do |group|
      if admin = group.memberships.where(admin: true).first
        group.creator_id = admin.user_id
        group.save!
      elsif member = group.memberships.first
        group.creator_id = member.user_id
        group.save!
      end
      progress_bar.increment
    end
  end
end
