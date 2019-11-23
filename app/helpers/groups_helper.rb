module GroupsHelper
  def draw
    @group = Group.find(params[:group_id])
    @participants = @group.users
    @group_arr = []
    @participants.each do |participant|
      @group_arr << participant
    end
    @group_arr.shuffle!
    @group_arr.each_with_index do |person, index|
      person.receiver_id = group_one_arr[index - 1].id
      person.save
    end
  end
end
