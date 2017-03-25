namespace :notification do
  desc "Sends sms notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    # 1. Schedule to run at every Sunday at 9pm
    # 2. Iterate over all employees
    # 3. Skip AdminUsers
    # 4. Send a message that has instructions and a link to log time

    # User.all.each do |user|
    #   SmsTool.send_sms
    # end
  end
end
