package com.purple.core 
{
	/**
	 * ...
	 * @author Benoît Chabert
	 */
	public class Calendar 
	{
		
		static public var day					: Number			= 1;
		static public var weekDays				: Array				= ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"];
		static public var months				: Array				= ["", "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"];
		static public var monthDays				: Array				= [0,         31,      28,      31,      30,    31,     30,     31,       31,          30,        31,         30,         31];
		static public var year					: Number			= 2012;
		static private var firstDay				: Number			= 6;
		
		public function Calendar() 
		{
			
		}
		
		static public function calculateDay(_day:Number, _month:Number, _year:Number):void
		{
			day = _day;
			var currentMonth:Number = _month;
			
			firstDay = generateFirstDay(_year);
			
			//days to count
			var daysToCount:Number = 0;
			for (var i:int = 1; i < currentMonth; i++)
			{
				if (i == 2)
				{
					if (_year / 4 == Math.round(_year / 4))
					{
						daysToCount += 29;
					}
				}
				else
				{
					daysToCount += monthDays[i];
				}
			}
			daysToCount = int(daysToCount + day);
			
			var currentDay:int = firstDay;
			for (var wd:int = 0; wd < daysToCount; wd++)
			{
				if (currentDay == 6)
				{
					currentDay = 0;
				}
				else
				{
					currentDay++;
				}
			}
			trace(weekDays[currentDay]);
		}
		
		static public function generateFirstDay(_year:Number):Number 
		{
			var currentDay:int = 3;
			var extraDay:int = 0;
			for (var i:int = 0; i < (_year*365); i++)
			{
				if ((i / 365) / 4 == Math.round((i / 365) / 4))
				{
					extraDay++;
				}
				if (currentDay == 6)
				{
					currentDay = 0;
				}
				else
				{
					currentDay++;
				}
			}
			for (var e:int = 0; e < extraDay; e++)
			{
				if (currentDay == 6)
				{
					currentDay = 0;
				}
				else
				{
					currentDay++;
				}
			}
			return currentDay;
		}
		
	}

}