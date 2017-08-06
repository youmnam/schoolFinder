class Api::V1::NewsController < ApplicationController
before_action :subscription_expired ,on: :add_new_news
skip_before_action :verify_authenticity_token
	
		
def add_new_news

#{
	#"newss_param":{  
    #     "text":"Abdelrahman mohamed",
   #      "date":"31/07/2017", (auto-generated) send empty
  #       "school_id" :7
 #    }
#}

  @news = News.new(news_params)
    if @news.save
    render json: @news.to_json, status: :created
    else
    render json: @news.errors
  end	
end
	
	
	
	def getAllNewsbyDate 
	
	#"date":"29/07/2017"

	#@news =   School.select("Schools.*, News.*").joins(",News where News.school_id = schools.id and to_char(News.date, 'DD/MM/YYYY')  >=  '"+params[:date]+"'") 
	@news =   School.select("Schools.*, News.*").joins(",News where News.school_id = schools.id and News.date  >=  '"+params[:date]+"'::date") 	
    render json: @news.to_json
	
	end
    
	
	def getNewsSchool 
	
	#"school_id":"1"

	@news =   School.select("Schools.*, News.*").joins(",News where News.school_id = schools.id and schools.id =  "+params[:school_id].to_s+" ") 	
    render json: @news.to_json
	
	end
	
	
	
	
    private
    def news_params
    	params[:api_param][:date] = DateTime.now.to_date
      params.require(:api_param).permit(:text,:date,:school_id)
    end
end
