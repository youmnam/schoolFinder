class ItemSpec < ActiveRecord::Base
  belongs_to :item
  belongs_to :category_filter


  
  
  
  def self.findbyItem(itemid)
  	where("item_id LIKE ?", "%#{itemid}%") 
  end
  
  
  
  

  def self.findAll( filterArr , searchValues , arrayOfColor )
    
	$query = " (1 = 1) "
    
	
	$checked = 0
	countselected  =0
  filterArr.each do |x| 
   
   
   
   
    if x.typeOfLabel == "FromTo"
	
	
	
	$query  += " AND value " + " BETWEEN  " + "'#{searchValues["F"+x.nameOfLabel]}'" +" AND " + "'#{searchValues["T"+x.nameOfLabel]}'"
	
    elsif x.typeOfLabel == "checkBox"
    
	
			
			$Colors = "(" 
			arrayOfColor.each do |c|
			
			
			if searchValues["Color_"+c] != nil
				$Colors += "'#{c}' ,"  
			end 	 
		end
			n = $Colors.size
			$Colors = $Colors[0..n-2]
			$Colors += ")"  
			
			puts  $Colors.size 
			if $Colors.size != 2
				
				if $checked == 0
				$checked = 1
				$query += " AND ( ( category_filter_id = " + "#{x.id} )"
				else 
				$query += " OR ( ( category_filter_id = " + "#{x.id} )"
				end
				 $query  += " AND  ( value "  + " in " + $Colors + ") )"		
				 		countselected = countselected +1 
			end 
	
	else 
		if searchValues[x.nameOfLabel] != ""
			if $checked == 0
		    $checked = 1
			$query += " AND ( (category_filter_id = " + "#{x.id} )"
			else
			$query += " OR ( (category_filter_id = " + "#{x.id} )"
			end 
			countselected = countselected +1		
			$query  += " AND ( value "  + " LIKE " + "'%#{searchValues[x.nameOfLabel]}%'  ))"
			
		end
	
	end 
	
	
 end 
  puts $query

  	ItemSpec.select('item_id, count( value)').where($query).group("item_id").having( "count( value) = ?",countselected) 
  end
  
end