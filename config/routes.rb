Rails.application.routes.draw do


resources :schools 
match 'schools/approve/:id', :to => 'schools#approve', :as => 'approve', :via => :put
  
namespace :api, :defaults => {:format => :json} do
    namespace :v1 do  
    	  get     "/getAllSchools",              to: "api#getAllSchools"
        get     "/getAllSchoolsNames",               to: "school_api#getAllSchoolsNames"
        get     "/getAllSchoolsWithAdmissionON",to: "school_api#find_school_withAdmissionON" 
    	  post    "/add_new_school",             to: "api#add_new_school"
    	  post    "/search_school",              to: "api#Search_school"
    	  post    "/getSchoolRating",            to: "ratings#getSchoolRating"
        get     "/getSchoolDetailsRating/:id",     to: "ratings#getSchoolDetailsRating"
        get     "/getSchoolRatersComments/:id",     to: "ratings#getSchoolRatingMessages"
    	  post    "/add_school_rating",          to: "ratings#add_school_rating"
    	  get     "/getAllJobVacancies",         to: "school_api#get_all_job_vacancies"
        get     "/getSchoolInfo/:id",          to: "school_api#get_school_info"
        post    "/searchForVacancy",           to: "job_vacancy#search_for_vacancy"
        post    "/AddJobVacancy",              to: "job_vacancy#add_job_vacancy"
        get     "/getJobVacancyDetails/:id",   to: "job_vacancy#get_job_vacancy_details"
        post    "/addTutorPosition",           to: "tutor#add_tutor_postion"
        get     "/getAllTutor",                to: "tutor#getAllTutor"
        post    "/addmission",                 to: "school_api#addmission"
        post    "/job_addmission",             to: "job_vacancy#job_addmission"
        
        post    "/addNews",                    to: "news#add_new_news"
        post    "/getNewsSchool",              to: "news#getNewsSchool"
        post    "/getAllNewsbyDate",           to: "news#getAllNewsbyDate"
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
