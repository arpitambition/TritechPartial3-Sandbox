public class IdeaDateFormatController {

    public Idea ideaParam { get; set; }
    public IdeaComment commentParam { get; set; }
    public Vote voteParam { get;set;}
    public String dateFormatNeeded { get;set;}
    public Boolean lastCommentDateNeeded
    {get { 
    	if (lastCommentDateNeeded == null ) {
    	   lastCommentDateNeeded =false;
    	}
    	return lastCommentDateNeeded;
        }
        set;}

    public String getDateDisplay() {
        
        Datetime datetimeValue;
        
        if (ideaParam != null) {
            if(lastCommentDateNeeded ) {
                if(ideaParam.lastCommentDate !=null)
                    return formatDateTime(ideaParam.lastCommentDate);
                else
                    return '';
            }
            else {            
                return formatDateTime(ideaParam.createdDate);
            }
        }
        else if (commentParam != null) {
            return formatDateTime(commentParam.createdDate);
        }
        else if (voteParam != null) {
        	return formatDateTime(voteParam.createdDate);
        }
        else {
            return '';
        }        	
    }
 
    public String formatDateTime(Datetime datetimeValue) {
    	return formatDateTime(datetimeValue, DateTime.now());
    }

    public String formatDateTime(Datetime datetimeValue, Datetime baseTime) {
  
        String dateDisplay;
        long nowMS = baseTime.getTime();
        long createdDateMS = datetimeValue.getTime();
        long millisAgo = nowMS - createdDateMS;
        DateTime beginningOfDayNow = DateTime.newInstance(baseTime.year(), baseTime.month(), baseTime.day());
        DateTime beginningOfDayCreatedDate = DateTime.newInstance(datetimeValue.year(), datetimeValue.month(), datetimeValue.day());
        long daysAgo = (beginningOfDayNow.getTime() - beginningOfDayCreatedDate.getTime()) / 86400000;
        
        /*if (daysAgo > 0) {
        	
        	// today, i.e. "7:20am"
          if (daysAgo < 2) {
            // "Yesterday"
            dateDisplay = 'Yesterday';
          } 
          else if (daysAgo < 4) {
            dateDisplay = String.valueOf(daysAgo) + ' days ago';
            // "2 days ago", "3 days ago"
          }
          else {
            // month and date of this year, i.e. "Jul 19, 2002"
            if (dateFormatNeeded == null ) {
            	dateFormatNeeded='MMM d, yyyy';
            }
           dateDisplay = datetimeValue.format(dateFormatNeeded);
          }
          
          
          	//Datetime temp = baseTime.addMonths(-1);
          	//if(temp < datetimeValue) {
          		//Integer dayCount = 1;
          		//Boolean found = false;
          		//while(!found) {
          			//Datetime tempDay = baseTime.addMonths(-dayCount);
          			//if(tempDay > datetimeValue) {
          				//found = true;
          			//} else dayCount++;
          		//}
          	//}
          
        } else if (millisAgo > 1800000) {
          dateDisplay = 'today ' + datetimeValue.format('h:mm a');                   
        } else if (millisAgo > 60000) {
          dateDisplay = String.valueOf(millisAgo / 60000) + ' minutes ago';
        }
        else {
          dateDisplay = String.valueOf(millisAgo / 1000) + ' seconds ago';
        }
        */
        //age calculation
      	Integer start_year_as_int = datetimeValue.year(); //grab the start year
		Integer start_day_as_int = datetimeValue.dayOfYear(); //grab the start day
		Integer start_hour_as_int = datetimeValue.hour(); //grab the start hour
		Integer start_minute_as_int = datetimeValue.minute(); //grab the start minute
		Integer start_second_as_int = datetimeValue.second(); //grab the start second
		Integer start_in_seconds = (start_year_as_int * 31556926) + (start_day_as_int * 86400) + (start_hour_as_int * 3600) + (start_minute_as_int * 60) + (start_second_as_int * 1); //convert the start date to a value in seconds
		//there are 31556926 seconds in one year and that is why we are mutiplying the start_year_as_int value by 31556926 > this same logic applies to the days, hours & minutes logic which is why there are weird multipliers in that line of code
		Integer end_year_as_int = baseTime.year(); //grab the end year
		Integer end_day_as_int = baseTime.dayOfYear(); //grab the end day
		Integer end_hour_as_int = baseTime.hour(); //grab the end hour
		Integer end_minute_as_int = baseTime.minute(); //grab the end minute
		Integer end_second_as_int = baseTime.second(); //grab the end second
		Integer end_in_seconds = (end_year_as_int * 31556926) + (end_day_as_int * 86400) + (end_hour_as_int * 3600) + (end_minute_as_int * 60) + (end_second_as_int * 1); //convert the end date to a value in seconds
		Integer total_duration_in_seconds = end_in_seconds - start_in_seconds; //duration in seconds
		Integer year_result = math.mod(math.floor(total_duration_in_seconds/31556926).intValue(),10000000); //number of years
		Integer day_result = math.mod(math.floor(total_duration_in_seconds/86400).intValue(),365); //number of days
		Integer hour_result = math.mod(math.floor(total_duration_in_seconds/3600).intValue(),24); //number of hours
		Integer minute_result = math.mod(math.floor(total_duration_in_seconds/60).intValue(),60); //number of minutes
		Integer second_result = math.mod(math.floor(total_duration_in_seconds/1).intValue(),60); //number of seconds
		
		//find months
		Integer monthCount = 0;
		Boolean found = false;
		while(!found) {
		    Datetime tempDay = datetimeValue.addMonths(monthCount);
		    if(tempDay > baseTime) {
		        found = true;
		    } else monthCount++;
		}
		
		if(year_result > 0) {
			if(year_result == 1) dateDisplay = '1 year ago';
			else dateDisplay = year_result.format() + ' years ago';
		} else if(day_result > 30) {
			if(day_result <= 60) dateDisplay = '1 month ago';
			else {
				monthCount--;
				if(monthCount == 1) dateDisplay = '1 month ago';
				else dateDisplay = monthCount.format() + ' months ago';
			}
		} else if(day_result > 0) {
			if(day_result == 1) dateDisplay = '1 day ago';
			else dateDisplay = day_result.format() + ' days ago';
		}else if(hour_result > 0) {
			if(hour_result == 1) dateDisplay = '1 hour ago';
			else dateDisplay = hour_result.format() + ' hours ago';
		} else if(minute_result > 0) {
			if(minute_result == 1) dateDisplay = '1 minute ago';
			else dateDisplay = minute_result.format() + ' minutes ago';
		} else if(second_result > 0) {
			if(second_result == 1) dateDisplay = '1 second ago';
			else dateDisplay = second_result.format() + ' seconds ago';
		}
        return dateDisplay;
    }
}