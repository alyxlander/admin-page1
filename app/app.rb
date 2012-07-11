class SampleBlog < Padrino::Application
  register Padrino::Rendering  
  register Padrino::Helpers
  
  # Add these routes below to the app file...
  get "/" do
    "Hello World!"
  end

  get :about, :map => '/about_us' do
    render :haml, "%p This is a sample blog created to demonstrate how Padrino works!"
  end
end
