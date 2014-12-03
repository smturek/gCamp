namespace :cleanup do

  desc "Deletes all invalid memberships"
  task memberships: :environment do
    Membership.where.not(user_id: User.pluck(:id)).each do |membership|
      membership.delete
    end
  end

  desc "Deletes all invalid comments"
  task comments: :environment do
    Comment.where.not(user_id: User.pluck(:id)).each do |comment|
      comment.delete
    end
  end

end
