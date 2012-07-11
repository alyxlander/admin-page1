# Accounts tab in admin page

Admin.controllers :accounts do

  # Shows all accounts
  get :index do
    @accounts = Account.all
    render 'accounts/index'
  end
  
  # new tab, if selected gives form to create new account
  get :new do
    @account = Account.new
    render 'accounts/new'
  end

  # Creating/saving the account
  post :create do
    @account = Account.new(params[:account])
    if @account.save
      flash[:notice] = 'Account was successfully created.'
      redirect url(:index, :id => @account.id)
    else
      render 'accounts/new'
    end
  end

  # edit link, renders the edit form with current information in it.
  get :edit, :with => :id do
    @account = Account.find(params[:id])
    render 'accounts/edit'
  end

  # Action for edit
  put :update, :with => :id do
    @account = Account.get(params[:id])
    if @account.update(params[:account])
      flash[:notice] = 'Account was successfully updated.'
      redirect url(:accounts, :edit, :id => @account.id)
    else
      render 'accounts/edit'
    end
  end

  # deletes account, unless the account you want to delete is the one logged in.
  delete :destroy, :with => :id do
    account = Account.find(params[:id])
    
    if account != current_account && account.destroy
      flash[:notice] = 'Account was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Account!'
    end
    redirect url(:accounts, :index)
  end
end
