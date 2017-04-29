class CarCat < ActiveRecord::Base

def self.findBySearch(filterArr , search)
 
 $query = "1 = 1"
 

 filterArr.each do |x| 
   
   
    if x.typeOfLabel == "FromTo"
	
	$query  += " AND " + x.nameOfLabel + " BETWEEN  " + "'#{search["F"+x.nameOfLabel]}'" +" AND " + "'#{search["T"+x.nameOfLabel]}'"
	
    else 
    $query  += " AND " + x.nameOfLabel + " LIKE " + "'%#{search[x.nameOfLabel]}%'"
	end 
	
	
 end 
 puts $query
 
  where($query)
  
  end

end
