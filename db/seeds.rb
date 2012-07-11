# Command line prompt for creating first admin user.
  
# creates the variables which are stored as the users info
  email     = shell.ask "Email for admin login:"
  password  = shell.ask "Password:"
  name      = shell.ask "What is your first name?"
  surname   = shell.ask "What is your surname?"
  shell.say ""
  
# Gives the user to notice to check that the information is correct before creating
  ans       = shell.ask "Is all the information correct? (y/n)"
  if ans   == "y" or ans == "Y"
  
# If yes, creates the account with the given params via the class account
# If no, the script aborts.
    account = Account.create(:email => email,
                              :name =>  name, 
                              :surname => surname, 
                              :password => password, 
                              :password_confirmation => password, 
                              :role => "admin") 
  
    if account.valid?
      shell.say""
      shell.say "================================================================="
      shell.say "\tAccount has been successfully created:"
      shell.say "================================================================="
      shell.say "\t\temail: #{email}"
      shell.say "\t\tpassword: #{password}"
      shell.say "================================================================="
    else
      shell.say"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      shell.say "\t\tSorry but some thing went wrong!"
      shell.say"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      account.errors.full_messages.each { |m| shell.say "   - #{m}" }
    end
  else
    sleep 0.5
    shell.say"Aborting Seed."
  end
